class Puzzle1 {

  PImage fundo;
  PVector location;
  int EntityW, EntityH;
  boolean IsComplete;

  PuzzlePiece[] Pieces;

  Puzzle1() {
    Pieces = new PuzzlePiece[8];
    fundo = loadImage("Puzzle1BG.jpg");
    Pieces[0] = new PuzzlePiece('z', 100, 100, 10, new PVector(150, 50), 0);
    Pieces[1] = new PuzzlePiece('x', 200, 100, 10, new PVector(450, 50), 1);
    Pieces[2] = new PuzzlePiece('y', 100, 200, 10, new PVector(150, 150), 2);
    Pieces[3] = new PuzzlePiece('x', 200, 100, 10, new PVector(250, 150), 3);
    Pieces[4] = new PuzzlePiece('x', 200, 100, 10, new PVector(250, 250), 4);
    Pieces[5] = new PuzzlePiece('y', 100, 200, 10, new PVector(550, 150), 5);
    Pieces[6] = new PuzzlePiece('y', 100, 200, 10, new PVector(450, 350), 6);
    Pieces[7] = new PuzzlePiece('x', 300, 100, 10, new PVector(150, 450), 7);
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
    image(fundo, 100 , 0, 600, 602);
    for (int i = 0; i < Pieces.length; i++) {
      Pieces[i].TickEntity();
    }
    if (IsComplete == false) {
      if (Pieces[0].location.x == 550 && Pieces[0].location.y == 450) {
        IsComplete = true;
      }
    } else {
      Fundo.Structure[Local].Base[1].Puzzle1Stop.Sniff.pause();
      ChangeAmbience("cemiterio", 20, 9);
    }
  }
}
