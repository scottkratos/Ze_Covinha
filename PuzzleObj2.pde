class PuzzleObj2 {

  int EntityW, EntityH;
  PVector location;
  boolean IsVisible, IsFirstTime;
  Puzzle2 Puzzle2;
  PImage Obj;

  PuzzleObj2(PVector loc) {
    EntityW = 153;
    EntityH = 131;
    IsVisible = false;
    IsFirstTime = false;
    location = loc;
    Puzzle2 = new Puzzle2();
    Obj = loadImage("Puzzle2Obj.png");
  }
  void TickEntity() {
    DetectPlayer();
    DrawScreen();
    DebugMode();
  }
  void DetectPlayer() {
    if (p.location.x < location.x + EntityW && p.location.x + p.CharW > location.x) {
      p.CanInteract = true;
    } else {
      p.CanInteract = false;
    }
  }
  void DrawScreen() {
    image(Obj, location.x, location.y - EntityH, EntityW, EntityH);
    if (IsVisible) {
      Puzzle2.TickEntity();
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