class Puzzle3 {

  PImage fundo;
  PVector location;
  int EntityW, EntityH;
  boolean IsComplete;

  PuzzlePiece3[] Pieces;

  Puzzle3() {
    Pieces = new PuzzlePiece3[15];
    fundo = loadImage("Puzzle3BG.jpg");
    Pieces[0] = new PuzzlePiece3(125, 125, new PVector(275, 50), 0);
    Pieces[1] = new PuzzlePiece3(125, 125, new PVector(400, 300), 1);
    Pieces[2] = new PuzzlePiece3(125, 125, new PVector(150, 425), 2);
    Pieces[3] = new PuzzlePiece3(125, 125, new PVector(150, 50), 3);
    Pieces[4] = new PuzzlePiece3(125, 125, new PVector(275, 175), 4);
    Pieces[5] = new PuzzlePiece3(125, 125, new PVector(525, 175), 5);
    Pieces[6] = new PuzzlePiece3(125, 125, new PVector(275, 425), 6);
    Pieces[7] = new PuzzlePiece3(125, 125, new PVector(150, 300), 7);
    Pieces[8] = new PuzzlePiece3(125, 125, new PVector(400, 175), 8);
    Pieces[9] = new PuzzlePiece3(125, 125, new PVector(400, 50), 9);
    Pieces[10] = new PuzzlePiece3(125, 125, new PVector(525, 50), 10);
    Pieces[11] = new PuzzlePiece3(125, 125, new PVector(150, 175), 11);
    Pieces[12] = new PuzzlePiece3(125, 125, new PVector(275, 300), 12);
    Pieces[13] = new PuzzlePiece3(125, 125, new PVector(525, 300), 13);
    Pieces[14] = new PuzzlePiece3(125, 125, new PVector(400, 425), 14);
    location = new PVector(150, 50);
    EntityW = 500;
    EntityH = 500;
    IsComplete = false;
  }
  void Clicked() {
    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].Clicked();
    }
  }
  void TickEntity() {
    image(fundo, 121, 21, 560, 560);
    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].TickEntity();
    }
    if (IsComplete == false) {
      if (Pieces[0].location.x == 150 && Pieces[0].location.y == 50) {
        if (Pieces[1].location.x == 275 && Pieces[1].location.y == 50) {
          if (Pieces[2].location.x == 150 && Pieces[2].location.y == 175) {
            if (Pieces[3].location.x == 275 && Pieces[3].location.y == 175) {
              if (Pieces[4].location.x == 275 && Pieces[4].location.y == 300 || Pieces[4].location.x == 400 && Pieces[4].location.y == 425) {
                if (Pieces[5].location.x == 400 && Pieces[5].location.y == 300) {
                  if (Pieces[6].location.x == 525 && Pieces[6].location.y == 300) {
                    if (Pieces[7].location.x == 275 && Pieces[7].location.y == 300 || Pieces[7].location.x == 400 && Pieces[7].location.y == 425) {
                      if (Pieces[8].location.x == 525 && Pieces[8].location.y == 425) {
                        IsComplete = true;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    } else {
      Fundo.VarStructure[LocalY].Base[1].Puzzle1Stop.Sniff.pause();
      IsInCutscene = true;
      Cutscenes[4] = true;
      cutscene4.loop();
    }
  }
}
