class PuzzleObj3 {

  int EntityW, EntityH;
  PVector location;
  boolean IsVisible, IsFirstTime;
  Puzzle3 Puzzle3;
  PImage Obj;

  PuzzleObj3(PVector loc) {
    EntityW = 102;
    EntityH = 73;
    IsVisible = false;
    IsFirstTime = false;
    location = loc;
    Puzzle3 = new Puzzle3();
    Obj = loadImage("Puzzle3Obj.png");
  }
  void TickEntity() {
    DetectPlayer();
    DrawScreen();
    DebugMode();
  }
  void DetectPlayer() {
    if (p.location.x < location.x + EntityW && p.location.x + p.TroncoEnd.x > location.x) {
      p.CanInteract = true;
    } else {
      p.CanInteract = false;
    }
  }
  void DrawScreen() {
    image(Obj, location.x, location.y - EntityH, EntityW, EntityH);
    if (IsVisible) {
      Puzzle3.TickEntity();
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