class PuzzleObj {

  int EntityW, EntityH;
  PVector location;
  boolean IsVisible, IsFirstTime;
  Puzzle1 Puzzle1;
  CusCol Deg1, Deg2, Deg3;

  PuzzleObj(PVector loc) {
    EntityW = 105;
    EntityH = 260;
    IsVisible = false;
    IsFirstTime = false;
    location = loc;
    Puzzle1 = new Puzzle1();
    Deg1 = new CusCol(675, 505, 200, 200);
    Deg2 = new CusCol(630, 527, 100, 100);
    Deg3 = new CusCol(588, 544, 100, 100);
  }
  void TickEntity() {
    DetectPlayer();
    DrawScreen();
    DebugMode();
    Deg1.TickCollision();
    Deg2.TickCollision();
    Deg3.TickCollision();
    if (!Deg1.SearchL || !Deg1.SearchR) {
      if (p.location.y + p.CharH > Deg1.LocationY) {
        p.groundcollision = Deg1.LocationY - p.CharH;
        p.location.y = p.groundcollision;
      }
    } else if (p.groundcollision != Deg3.LocationY - p.CharH && p.groundcollision != Deg2.LocationY - p.CharH) {
      p.groundcollision = 440;
    }
    if (!Deg2.SearchL || !Deg2.SearchR) {
      if (p.location.y + p.CharH > Deg2.LocationY) {
        p.groundcollision = Deg2.LocationY - p.CharH;
        p.location.y = p.groundcollision;
      }
    } else if (p.groundcollision != Deg3.LocationY - p.CharH && p.groundcollision != Deg1.LocationY - p.CharH) {
      p.groundcollision = 440;
    }
    if (!Deg3.SearchL || !Deg3.SearchR) {
      if (p.location.y + p.CharH > Deg3.LocationY) {
        p.groundcollision = Deg3.LocationY - p.CharH;
        p.location.y = p.groundcollision;
      }
    } else if (p.groundcollision != Deg2.LocationY - p.CharH && p.groundcollision != Deg1.LocationY - p.CharH) {
      p.groundcollision = 440;
    }
  }
  void DetectPlayer() {
    if (p.location.x < location.x + EntityW && p.location.x + p.TroncoEnd.x > location.x) {
      p.CanInteract = true;
    } else {
      p.CanInteract = false;
    }
  }
  void DrawScreen() {
    if (IsVisible) {
      Puzzle1.TickEntity();
      p.IsBackward = p.IsForward = false;
    }
  }
  void Restart() {
    IsVisible = false;
    p.CanInput = true;
  }
  void DebugMode() {
    if (DebugMode) {
      rect(location.x, location.y, EntityW, EntityH);
    }
  }
}