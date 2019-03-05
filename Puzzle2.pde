class Puzzle2 {

  PVector location;
  int EntityW, EntityH, index;
  int[] frascos, ImagePos, ImageTable, W, H;
  boolean[] clicked;
  boolean IsComplete, reset;
  PImage fundo, potes, outline;
  AudioPlayer sa, ca;

  Puzzle2() {
    location = new PVector(150, 50);
    EntityW = 500;
    EntityH = 500;
    IsComplete = false;
    fundo = loadImage("Puzzle2BG.png");
    potes = loadImage("potes.png");
    outline = loadImage("potesoutline.png");
    frascos = new int[3];
    frascos[0] = 5;
    frascos[1] = 0;
    frascos[2] = 6;
    ImageTable = new int[3];
    ImageTable[0] = 53;
    ImageTable[1] = 50;
    ImageTable[2] = 60;
    ImagePos = new int[3];
    ImagePos[0] = 35;
    ImagePos[1] = 315;
    ImagePos[2] = 503;
    W = new int[3];
    W[0] = 95;
    W[1] = 107;
    W[2] = 79;
    H = new int[3];
    H[0] = 224;
    H[1] = 117;
    H[2] = 133;
    clicked = new boolean[3];
    clicked[0] = false;
    clicked[1] = false;
    clicked[2] = false;
    reset = false;
    index = -1;
    sa = minim.loadFile("Puz2semagua.wav");
    ca = minim.loadFile("Puz2comagua.wav");
  }
  void Clicked() {
    if (mouseX >= 211 && mouseX <= 306 && mouseY >= 50 && mouseY <= 274) {
      if (clicked[0]) {
        clicked[0] = false;
      } else {
        for (int i = 0; i < clicked.length; i++) {
          if (clicked[i] != clicked[0]) {
            if (clicked[i]) {
              if (frascos[0] < 10) {
                if (frascos[0] + frascos[i] < 10) {
                  frascos[0] = frascos[0] + frascos[i];
                  frascos[i] = 0;
                  if (frascos[0] == 0) {
                    if (sa.isPlaying()) {
                      sa.pause();
                      sa.rewind();
                    }
                    sa.play();
                  } else {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                } else {
                  frascos[i] = frascos[i] - (10 - frascos[0]);
                  frascos[0] = (10 - frascos[0]) + frascos[0];
                  if (frascos[0] != 10) {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                }
              }
              index = i;
              reset = true;
              break;
            }
          }
        }
        if (reset) {
          clicked[index] = false;
          reset = false;
          index = -1;
        } else {
          clicked[0] = true;
        }
      }
    }
    if (mouseX >= 357 && mouseX <= 464 && mouseY >= 157 && mouseY <= 274) {
      if (clicked[1]) {
        clicked[1] = false;
      } else {
        for (int i = 0; i < clicked.length; i++) {
          if (clicked[i] != clicked[1]) {
            if (clicked[i]) {
              if (frascos[1] < 5) {
                if (frascos[1] + frascos[i] < 5) {
                  frascos[1] = frascos[1] + frascos[i];
                  frascos[i] = 0;
                  if (frascos[1] == 0) {
                    if (sa.isPlaying()) {
                      sa.pause();
                      sa.rewind();
                    }
                    sa.play();
                  } else {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                } else {
                  frascos[i] = frascos[i] - (5 - frascos[1]);
                  frascos[1] = (5 - frascos[1]) + frascos[1];
                  if (frascos[1] != 5) {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                }
              }
              index = i;
              reset = true;
              break;
            }
          }
        }
        if (reset) {
          clicked[index] = false;
          reset = false;
          index = -1;
        } else {
          clicked[1] = true;
        }
      }
    }
    if (mouseX >= 507 && mouseX <= 586 && mouseY >= 141 && mouseY <= 274) {
      if (clicked[2]) {
        clicked[2] = false;
      } else {
        for (int i = 0; i < clicked.length; i++) {
          if (clicked[i] != clicked[2]) {
            if (clicked[i]) {
              if (frascos[2] < 6) {
                if (frascos[2] + frascos[i] < 6) {
                  frascos[2] = frascos[2] + frascos[i];
                  frascos[i] = 0;
                  if (frascos[2] == 0) {
                    if (sa.isPlaying()) {
                      sa.pause();
                      sa.rewind();
                    }
                    sa.play();
                  } else {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                } else {
                  frascos[i] = frascos[i] - (6 - frascos[2]);
                  frascos[2] = (6 - frascos[2]) + frascos[2];
                  if (frascos[2] != 6) {
                    if (ca.isPlaying()) {
                      ca.pause();
                      ca.rewind();
                    }
                    ca.play();
                  }
                }
              }
              index = i;
              reset = true;
              break;
            }
          }
        }
        if (reset) {
          clicked[index] = false;
          reset = false;
          index = -1;
        } else {
          clicked[2] = true;
        }
      }
    }
  }
  void TickEntity() {
    image(fundo, 100, 0, 600, 602);
    if (clicked[0]) {
      image(outline.get(40, 25, 121, 247), 198, 25);
    }
    if (clicked[1]) {
      image(outline.get(35, 304, 133, 142), 347, 147);
    }
    if (clicked[2]) {
      image(outline.get(42, 492, 110, 158), 493, 131);
    }
    image(potes.get(ImageTable[0], ImagePos[0], W[0], H[0]), 211, 50);
    image(potes.get(ImageTable[1], ImagePos[1], W[1], H[1]), 357, 157);
    image(potes.get(ImageTable[2], ImagePos[2], W[2], H[2]), 507, 141);
    UpdateFrames();
    if (IsComplete == false) {
      if (frascos[0] == 8) {
        IsComplete = true;
      }
    } else {
      Fundo.Structure[Local].Base[1].Puzzle1Stop.Sniff.pause();
      IsInCutscene = true;
      Cutscenes[3] = true;
      cutscene3.loop();
    }
  }
  void UpdateFrames() {
    if (frascos[0] == 0) {
      ImageTable[0] = 53;
    } else if (frascos[0] == 1) {
      ImageTable[0] = 190;
    } else if (frascos[0] == 2) {
      ImageTable[0] = 327;
    } else if (frascos[0] == 3) {
      ImageTable[0] = 464;
    } else if (frascos[0] == 4) {
      ImageTable[0] = 601;
    } else if (frascos[0] == 5) {
      ImageTable[0] = 738;
    } else if (frascos[0] == 6) {
      ImageTable[0] = 875;
    } else if (frascos[0] == 7) {
      ImageTable[0] = 1012;
    } else if (frascos[0] == 8) {
      ImageTable[0] = 1149;
    } else if (frascos[0] == 9) {
      ImageTable[0] = 1286;
    } else if (frascos[0] == 10) {
      ImageTable[0] = 1423;
    }
    if (frascos[1] == 0) {
      ImageTable[1] = 50;
    } else if (frascos[1] == 1) {
      ImageTable[1] = 183;
    } else if (frascos[1] == 2) {
      ImageTable[1] = 317;
    } else if (frascos[1] == 3) {
      ImageTable[1] = 452;
    } else if (frascos[1] == 4) {
      ImageTable[1] = 585;
    } else if (frascos[1] == 5) {
      ImageTable[1] = 720;
    }
    if (frascos[2] == 0) {
      ImageTable[2] = 60;
    } else if (frascos[2] == 1) {
      ImageTable[2] = 193;
    } else if (frascos[2] == 2) {
      ImageTable[2] = 326;
    } else if (frascos[2] == 3) {
      ImageTable[2] = 458;
    } else if (frascos[2] == 4) {
      ImageTable[2] = 592;
    } else if (frascos[2] == 5) {
      ImageTable[2] = 725;
    } else if (frascos[2] == 6) {
      ImageTable[2] = 858;
    }
    if (!sa.isPlaying()) {
      sa.rewind();
    }
    if (!ca.isPlaying()) {
      ca.rewind();
    }
  }
}
