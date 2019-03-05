class NormalSpider {
  
  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, delay, frame, ImagePos, ImageTable;
  boolean IsLethal, TookDamage, detect, MovingUp;
  PImage Skol;
  PVector Hit1Start, Hit1End, Hit2Start, Hit2End;
  AudioPlayer Subindo, Descendo;
  
  NormalSpider (int locx, int locy, int Start, int End) {
    Location = locx;
    groundcollision = locy;
    StartLoc = groundcollision;
    Skin = (int)random(Start, End);
    Skol = loadImage("aranhanormal" + Skin + ".png");
    EntityW = 79;
    EntityH = 501;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    MovingUp = false;
    delay = 125;
    Hitboxes();
    Subindo = minim.loadFile("aranhasubindo.wav");
    Descendo = minim.loadFile("aranhadescendo.wav");
  }
  void Hitboxes() {
    Hit1Start = new PVector(Location + 37, groundcollision - EntityH);
    Hit1End = new PVector(Location + 40, groundcollision - EntityH + 431);
    Hit2Start = new PVector(Location, groundcollision - EntityH + 431);
    Hit2End = new PVector(Location + EntityW, groundcollision);
  }
  void TickEntity() {
    if (TookDamage == false) {
      StartEntity();
      DetectPlayer();
      MoveEntity();
      DoDamage();
      Animate();
      Sounds();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    image(Skol.get(ImageTable, ImagePos, EntityW, EntityH), Location, groundcollision - EntityH, EntityW, EntityH);
    Hit1Start = new PVector(Location + 37, groundcollision - EntityH);
    Hit1End = new PVector(Location + 40, groundcollision - EntityH + 431);
    Hit2Start = new PVector(Location, groundcollision - EntityH + 431);
    Hit2End = new PVector(Location + EntityW, groundcollision);
  }
  void DetectPlayer() {
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
    if (Hit2Start.x <= p.HeadEnd.x + p.location.x && Hit2End.x >= p.location.x + p.HeadStart.x) {
      if (Hit2Start.y <= p.HeadEnd.y + p.location.y && Hit2End.y >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x <= p.LeftarmEnd.x + p.location.x && Hit2End.x >= p.location.x + p.LeftarmStart.x) {
      if (Hit2Start.y <= p.LeftarmEnd.y + p.location.y && Hit2End.y >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x <= p.RightarmEnd.x + p.location.x && Hit2End.x >= p.location.x + p.RightarmStart.x) {
      if (Hit2Start.y <= p.RightarmEnd.y + p.location.y && Hit2End.y >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x <= p.TroncoEnd.x + p.location.x && Hit2End.x >= p.location.x + p.TroncoStart.x) {
      if (Hit2Start.y <= p.TroncoEnd.y + p.location.y && Hit2End.y >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x <= p.LeftlegEnd.x + p.location.x && Hit2End.x >= p.location.x + p.LeftlegStart.x) {
      if (Hit2Start.y <= p.LeftlegEnd.y + p.location.y && Hit2End.y >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x <= p.RightlegEnd.x + p.location.x && Hit2End.x >= p.location.x + p.RightlegStart.x) {
      if (Hit2Start.y <= p.RightlegEnd.y + p.location.y && Hit2End.y >= p.location.y + p.RightlegStart.y) {
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
        if (p.MaximumSpeed > 1){
          p.psounds[4].rewind();
          p.psounds[4].play();
          p.MaximumSpeed = p.MaximumSpeed - 1;
          p.ResVel = false;
          p.ResetXVelocity();
        } else {
          GameOver();
        }
        TookDamage = true;
      }
      Subindo.pause();
      Descendo.pause();
    }
  }
  void MoveEntity() {
    if (groundcollision <= 495 && groundcollision >= 250) {
      if (MovingUp == true) {
        groundcollision-= 4;
      } else {
        groundcollision+= 4;
      }
    } else {
      if (delay > 0) {
        delay--;
      } else {
        if (MovingUp == true) {
          groundcollision+= 5;
       } else {
         groundcollision-= 5;
       }
       MovingUp = !MovingUp;
       if (MovingUp) {
         Subindo.play();
       } else {
         Descendo.play();
       }
       delay = 125;
      }
    }
  }
  void Animate() {
    if (frame >= 4) {
      ImagePos = 0;
      ImageTable += 79;
      frame = 0;
    } else {
      frame++;
    }
    if (ImageTable > 632) {
      ImageTable = 0;
    }
  }
  void Restart() {
    Skol = loadImage("aranhanormal" + Skin + ".png");
    EntityW = 79;
    EntityH = 501;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = true;
    detect = false;
    MovingUp = false;
    delay = 125;
    Hitboxes();
    groundcollision = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + 37, groundcollision - EntityH, 3, 431);
    rect(Location, groundcollision - EntityH + 431, EntityW, 70);
  }
  void Sounds() {
    if (!Subindo.isPlaying()) {
      Subindo.pause();
      Subindo.rewind();
    }
    if (!Descendo.isPlaying()) {
      Descendo.pause();
      Descendo.rewind();
    }
  }
}
