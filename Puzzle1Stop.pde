class Puzzle1Stop {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, StartGround, CompStart, CompEnd, delay, frame, ImageTable, ImagePos;
  boolean IsLethal, TookDamage, detect, detectBot, Past;
  PImage Skol, fogo;
  PVector Hit1Start, Hit1End;
  CusCol Col1;
  AudioPlayer Sniff, Sniff2;

  Puzzle1Stop (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    StartGround = groundcollision; 
    Skin = (int)random(Start, End);
    if (Cenario == "igreja") {
      Skol = loadImage("pendulo.png");
    } else if (Cenario == "cemiterio") {
      Skol = loadImage("whomp.png");
    } else if (Cenario == "casa") {
      Skol = loadImage("balde.png");
    }
    fogo = loadImage("fogo.png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    detectBot = false;
    Past = false;
    if (Cenario == "igreja") {
      delay = 1860;
    } else if (Cenario == "cemiterio") {
      delay = 9000;
    } else if (Cenario == "casa") {
      delay = 9000;
    }
    Hitboxes();
    Sniff = minim.loadFile("pedroso.wav");
    Sniff2 = minim.loadFile("antes.wav");
  }
  void Hitboxes() {
    CompStart = 0;
    CompEnd = 0;
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
  }
  void TickEntity() {
    if (TookDamage == false) {
      StartEntity();
      DetectPlayer();
      MoveEntity();
      DoDamage();
      Animate();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    if (!IsPuzzleInteracting) {
      image(Skol, Location, groundcollision - EntityH, EntityW, EntityH);
    }
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
  }
  void DetectPlayer() {
    if (Hit1End.x <= p.location.x) {
      Past = true;
    }
    if (Hit1End.x >= hog.location.x && Hit1Start.x <= hog.location.x + hog.CharW) {
      detectBot = true;
    } else {
      detectBot = false;
    }
    if (Hit1Start.x <= p.HeadEnd.x + p.location.x && Hit1End.x >= p.location.x + p.HeadStart.x) {
      if (Hit1Start.y <= p.HeadEnd.y + p.location.y && Hit1End.y >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x <= p.LeftarmEnd.x + p.location.x && Hit1End.x >= p.location.x + p.LeftarmStart.x) {
      if (Hit1Start.y <= p.LeftarmEnd.y + p.location.y && Hit1End.y >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x <= p.RightarmEnd.x + p.location.x && Hit1End.x >= p.location.x + p.RightarmStart.x) {
      if (Hit1Start.y <= p.RightarmEnd.y + p.location.y && Hit1End.y >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x <= p.TroncoEnd.x + p.location.x && Hit1End.x >= p.location.x + p.TroncoStart.x) {
      if (Hit1Start.y <= p.TroncoEnd.y + p.location.y && Hit1End.y >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x <= p.LeftlegEnd.x + p.location.x && Hit1End.x >= p.location.x + p.LeftlegStart.x) {
      if (Hit1Start.y <= p.LeftlegEnd.y + p.location.y && Hit1End.y >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x <= p.RightlegEnd.x + p.location.x && Hit1End.x >= p.location.x + p.RightlegStart.x) {
      if (Hit1Start.y <= p.RightlegEnd.y + p.location.y && Hit1End.y >= p.location.y + p.RightlegStart.y) {
        detect = true;
      }
    }
  }
  void DoDamage() {
    if (detect == true && TookDamage == false) {
      if (IsLethal == true) {
        TookDamage = true;
        GameOver();
      } else {
        if (p.MaximumSpeed > 1) {
          p.psounds[4].rewind();
          p.psounds[4].play();
          p.MaximumSpeed = p.MaximumSpeed - 1;
          p.ResVel = false;
          p.ResetXVelocity();
        }
        TookDamage = true;
      }
    }
    if (detectBot) {
      if (delay > 0) {
        hog.CanMove = false;
        delay--;
        p.Fuel = 900;
      } else {
        hog.CanMove = true;
      }
    }
  }
  void MoveEntity() {
    if (Cenario == "igreja") {
      if (Past) {
        if (groundcollision - EntityH <= 514) {
          groundcollision+= 10;
        } else {
          Sniff.play();
          if (p.location.x <= Location + EntityW) {
            p.location.x = Location + EntityW + 1;
          }
        }
      }
    } else {
      if (Past) {
        if (groundcollision - EntityH <= 400) {
          groundcollision+= 10;
        } else {
          Sniff.play();
          if (p.location.x <= Location + EntityW + 10) {
            p.location.x = Location + EntityW + 10;
          }
        }
      }
    }
  }
  void Animate() {
    if (Cenario == "igreja") {
      if (groundcollision - EntityH >= 514 && delay > 0) {
        Sounds();
        if (!IsPuzzleInteracting) {
          image(fogo.get(ImageTable, ImagePos, 100, 100), Location, groundcollision - EntityH * 2, EntityW, EntityH * 2);
        }
        if (frame >= 4) {
          ImageTable += 100;
          ImagePos = 0;
          frame = 0;
        } else {
          frame++;
        }
        if (ImageTable > 200) {
          ImageTable = 0;
        }
      }
    } else {
      if (groundcollision - EntityH >= 400 && delay > 0) {
        Sounds();
        if (!IsPuzzleInteracting) {
          image(fogo.get(ImageTable, ImagePos, 100, 100), Location, groundcollision - EntityH * 2, EntityW, EntityH * 2);
        }
        if (frame >= 4) {
          ImageTable += 100;
          ImagePos = 0;
          frame = 0;
        } else {
          frame++;
        }
        if (ImageTable > 200) {
          ImageTable = 0;
        }
      }
    }
  }
  void Sounds() {
    if (Cenario == "igreja") {
      if (!Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.IsComplete) {
        if (!Sniff2.isPlaying()) {
          Sniff2.pause();
          Sniff2.rewind();
          Sniff2.play();
        }
      } else {
        Sniff2.pause();
      }
    } else if (Cenario == "cemiterio") {
      if (!Fundo.Structure[Local].Base[0].PuzzleObj2.Puzzle2.IsComplete) {
        if (!Sniff2.isPlaying()) {
          Sniff2.pause();
          Sniff2.rewind();
          Sniff2.play();
        }
      } else {
        Sniff2.pause();
      }
    } else if (Cenario == "casa") {
      if (!Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.IsComplete) {
        if (!Sniff2.isPlaying()) {
          Sniff2.pause();
          Sniff2.rewind();
          Sniff2.play();
        }
      } else {
        Sniff2.pause();
      }
    }
  }
  void Restart() {
    if (Cenario == "igreja") {
      Skol = loadImage("pendulo.png");
    } else if (Cenario == "cemiterio") {
      Skol = loadImage("whomp.png");
    } else if (Cenario == "casa") {
      Skol = loadImage("balde.png");
    }
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    IsLethal = true;
    detect = false;
    detectBot = false;
    Hitboxes();
    Location = StartLoc;
    groundcollision = StartGround;
    TookDamage = false;
    Past = false;
    detectBot = false;
    if (Cenario == "igreja") {
      delay = 1860;
    } else if (Cenario == "cemiterio") {
      delay = 9000;
    } else if (Cenario == "casa") {
      delay = 9000;
    }
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
