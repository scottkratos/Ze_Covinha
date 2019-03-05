class PuzzlePiece3 {

  int EntityW, EntityH, ArrayPos;
  PVector location;
  boolean detect, clicked, CanUp, CanDown, CanLeft, CanRight;
  PImage rep;
  AudioPlayer Sniff;

  PuzzlePiece3(int w, int h, PVector loc, int pos) {
    EntityW = w;
    EntityH = h;
    location = loc;
    detect = false;
    location = loc;
    ArrayPos = pos;
    CanUp = false;
    CanDown = false;
    CanLeft = false;
    CanRight = false;
    Sniff = minim.loadFile("puz3.wav");
    if (ArrayPos > 8) {
      rep = loadImage("p9.jpg");
    } else {
      rep = loadImage("p"+ArrayPos+".jpg");
    }
  }
  void TickEntity() {
    DetectMouse();
    DebugMode();
    Sounds();
    image(rep, location.x, location.y);
  }
  void DebugMode() {
    if (DebugMode) {
      rect(location.x, location.y, EntityW, EntityH);
    }
  }
  void DetectMouse() {
    if (mouseX > location.x && mouseX < location.x + EntityW && mouseY > location.y && mouseY < location.y + EntityH) {
      detect = true;
    } else {
      detect = false;
    }
  }
  void Clicked() {
    if (detect) {
      CanUp = true;
      CanDown = true;
      CanLeft = true;
      CanRight = true;
      for (int i = 0; i < Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces.length; i++) {
        if (location.y - EntityH == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.y) {
          if (location.x == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.x) {
            if (CanUp) {
              CanUp = false;
            }
          }
        }
        if (location.y + EntityH == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.y) {
          if (location.x == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.x) {
            if (CanDown) {
              CanDown = false;
            }
          }
        }
        if (location.x - EntityW == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.x) {
          if (location.y == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.y) {
            if (CanLeft) {
              CanLeft = false;
            }
          }
        }
        if (location.x + EntityW == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.x) {
          if (location.y == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Pieces[i].location.y) {
            if (CanRight) {
              CanRight = false;
            }
          }
        }
      }
      if (location.y - EntityH == -75) {
        if (CanUp) {
          CanUp = false;
        }
      }
      if (location.y + EntityH == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.location.y + Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.EntityH) {
        if (CanDown) {
          CanDown = false;
        }
      }
      if (location.x - EntityW == 25) {
        if (CanLeft) {
          CanLeft = false;
        }
      }
      if (location.x + EntityW == Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.location.x + Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.EntityW) {
        if (CanRight) {
          CanRight = false;
        }
      }
      if (CanUp) {
        Sniff.play();
        location.y = location.y - EntityH;
      }
      if (CanDown) {
        Sniff.play();
        location.y = location.y + EntityH;
      }
      if (CanLeft) {
        Sniff.play();
        location.x = location.x - EntityH;
      }
      if (CanRight) {
        Sniff.play();
        location.x = location.x + EntityH;
      }
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
    }
  }
}