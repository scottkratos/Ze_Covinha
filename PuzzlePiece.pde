class PuzzlePiece {

  char Axis;
  int EntityW, EntityH, MoveRate, ArrayPos;
  float MouseXLoc, MouseYLoc;
  PVector location;
  boolean detect, clicked, foundX, foundY;
  PImage rep;
  AudioPlayer Sniff;

  PuzzlePiece(char axis, int w, int h, int move, PVector loc, int pos) {
    Axis = axis;
    EntityW = w;
    EntityH = h;
    MoveRate = move;
    location = new PVector(0, 0);
    location = loc;
    detect = false;
    MouseXLoc = 0;
    MouseYLoc = 0;
    clicked = false;
    foundX = false;
    foundY = false;
    ArrayPos = pos;
    Sniff = minim.loadFile("puz1.wav");
    if (EntityW == 100 && EntityH == 200) {
      rep = loadImage("Puzzle1PieceVert.jpg");
    } else if (EntityW == 100 && EntityH == 100) {
      rep = loadImage("chave.png");
    } else if (EntityW == 200 && EntityH == 100) {
      rep = loadImage("Puzzle1PieceHor.jpg");
    } else if (EntityW == 300 && EntityH == 100) {
      rep = loadImage("Puzzle1PieceHorSuper.jpg");
    }
  }
  void TickEntity() {
    if (clicked == true) {
    }
    DetectMouse();
    DebugMode();
    Drag();
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
    if (clicked == false) {
      if (detect == true) {
        MouseXLoc = mouseX;
        MouseYLoc = mouseY;
        clicked = true;
      }
    } else {
      clicked = false;
    }
  }
  void Drag() {
    if (clicked == true) {
      if (Axis == 'x') {
        if (MouseXLoc - MoveRate > mouseX) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y < location.y + EntityH && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH > location.y) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW == location.x) {
                foundX= true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.x < location.x) {
              Sounds();
              MouseXLoc = MouseXLoc - MoveRate;
              location.x = location.x - MoveRate;
            }
          }
        } else if (MouseXLoc + MoveRate < mouseX) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y < location.y + EntityH && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH > location.y) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x == location.x + EntityW) {
                foundX = true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.EntityW > location.x + EntityW) {
              Sounds();
              MouseXLoc = MouseXLoc + MoveRate;
              location.x = location.x + MoveRate;
            }
          }
        }
        foundY = false;
        foundX = false;
      } else if (Axis == 'y') {
        if (MouseYLoc - MoveRate > mouseY) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x < location.x + EntityW && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW > location.x) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH == location.y) {
                foundX= true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.y < location.y) {
              Sounds();
              MouseYLoc = MouseYLoc - MoveRate;
              location.y = location.y - MoveRate;
            }
          }
        } else if (MouseYLoc + MoveRate < mouseY) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x < location.x + EntityW && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW > location.x) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y == location.y + EntityH) {
                foundX = true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.EntityH > location.y + EntityH) {
              Sounds();
              MouseYLoc = MouseYLoc + MoveRate;
              location.y = location.y + MoveRate;
            }
          }
        }
        foundY = false;
        foundX = false;
      } else if (Axis == 'z') {
        if (MouseYLoc - MoveRate > mouseY) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x < location.x + EntityW && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW > location.x) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH == location.y) {
                foundX= true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.y < location.y) {
              Sounds();
              MouseYLoc = MouseYLoc - MoveRate;
              location.y = location.y - MoveRate;
            }
          }
        } else if (MouseYLoc + MoveRate < mouseY) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x < location.x + EntityW && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW > location.x) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y == location.y + EntityH) {
                foundX = true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.EntityH > location.y + EntityH) {
              Sounds();
              MouseYLoc = MouseYLoc + MoveRate;
              location.y = location.y + MoveRate;
            }
          }
        }
        foundY = false;
        foundX = false;
        if (MouseXLoc - MoveRate > mouseX) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y < location.y + EntityH && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH > location.y) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityW == location.x) {
                foundX= true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.x < location.x) {
              Sounds();
              MouseXLoc = MouseXLoc - MoveRate;
              location.x = location.x - MoveRate;
            }
          }
        } else if (MouseXLoc + MoveRate < mouseX) {
          for (int i = 0; i < Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces.length; i++) {
            if (i != ArrayPos) {
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y < location.y + EntityH && Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.y + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].EntityH > location.y) {
                foundY = true;
              }
              if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Pieces[i].location.x == location.x + EntityW) {
                foundX = true;
              }
              if (foundY && foundX) {
              } else {
                foundY = false;
                foundX = false;
              }
            }
          }
          if (!foundX && !foundY) {
            if (Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.location.x + Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.EntityW > location.x + EntityW) {
              Sounds();
              MouseXLoc = MouseXLoc + MoveRate;
              location.x = location.x + MoveRate;
            }
          }
        }
        foundY = false;
        foundX = false;
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