class SpiderArc {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, CompStart, CompEnd, ImagePos, ImageTable;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector Hit1Start, Hit1End, ActualLoc;
  float raio, angulo, frame;
  AudioPlayer Sniff;

  SpiderArc (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("aranhaz" + Skin + ".png");
    EntityW = 93;
    EntityH = 98;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    Direction = 1;
    Speed = 3;
    MaxSpeed = 3;
    ActualLoc = new PVector(Location, raio);
    raio = 220;
    angulo = 0;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("aranhazerinho.wav");
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
    image(Skol.get(ImageTable, ImagePos, EntityW, EntityH), ActualLoc.x, ActualLoc.y - EntityH, EntityW, EntityH);
    Hit1Start = new PVector(ActualLoc.x + CompStart, ActualLoc.y - EntityH);
    Hit1End = new PVector(ActualLoc.x + EntityW - CompEnd, ActualLoc.y);
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
        } else {
          GameOver();
        }
        TookDamage = true;
      }
      Sniff.pause();
    }
  }
  void MoveEntity() {
    ActualLoc.x = Location + raio * sin(angulo);
    ActualLoc.y = groundcollision + raio * cos(angulo);
    angulo+= 0.02;
  }
  void Animate() {
    Sounds();
    if (sin(angulo) < 0 && sin(angulo) > -0.5 && cos(angulo) > -1 && cos(angulo) < -0.8) {
      ImageTable = 0;
      ImagePos = 0;
    }
    if (sin(angulo) < -0.5 && sin(angulo) > -1 && cos(angulo) > -0.8 && cos(angulo) < -0.5) {
      ImageTable = EntityW;
      ImagePos = 0;
    }
    if (sin(angulo) < -0.8 && sin(angulo) > -1 && cos(angulo) > -0.5 && cos(angulo) < 0) {
      ImageTable = EntityW * 2;
      ImagePos = 0;
    }
    if (sin(angulo) > -1 && sin(angulo) < -0.8 && cos(angulo) > 0 && cos(angulo) < 0.5) {
      ImageTable = EntityW * 3;
      ImagePos = 0;
    }
    if (sin(angulo) > -0.8 && sin(angulo) < 0 && cos(angulo) > 0.5 && cos(angulo) < 1) {
      ImageTable = EntityW * 4;
      ImagePos = 0;
    }
    if (sin(angulo) < 0 && sin(angulo) > 0.5 && cos(angulo) < 1 && cos(angulo) > 0.8) {
      ImageTable = EntityW * 5;
      ImagePos = 0;
    }
    if (sin(angulo) > -0.5 && sin(angulo) < 0.3 && cos(angulo) > 0.8 && cos(angulo) < 0.9) {
      ImageTable = EntityW * 6;
      ImagePos = 0;
    }
    if (sin(angulo) > 0.3 && sin(angulo) < 0.7 && cos(angulo) < 0.9 && cos(angulo) > 0.7) {
      ImageTable = EntityW * 7;
      ImagePos = 0;
    }
    if (sin(angulo) < 0.7 && sin(angulo) > 0.9 && cos(angulo)  < 0.7 && cos(angulo) > 0.3) {
      ImageTable = EntityW * 8;
      ImagePos = 0;
    }
    if (sin(angulo) > 0.9 && sin(angulo) < 1 && cos(angulo) < 0.3 && cos(angulo) > 1) {
      ImageTable = EntityW * 9;
      ImagePos = 0;
    }
    if (sin(angulo) < 1 && sin(angulo) > 0.9 && cos(angulo) < 0 && cos(angulo) > -0.3) {
      ImageTable = EntityW * 10;
      ImagePos = 0;
    }
    if (sin(angulo) < 0.9 && sin(angulo) > 0.8 && cos(angulo) < -0.3 && cos(angulo) > -0.5) {
      ImageTable = EntityW * 11;
      ImagePos = 0;
    }
    if (sin(angulo) < 0.8 && sin(angulo) > 0.5 && cos(angulo) < -0.5 && cos(angulo) > -0.8) {
      ImageTable = EntityW * 12;
      ImagePos = 0;
    }
    if (sin(angulo) < 0.5 && sin(angulo) > 0.3 && cos(angulo) < -0.8 && cos(angulo) > -0.9) {
      ImageTable = EntityW * 13;
      ImagePos = 0;
    }
    if (sin(angulo) < 0.3 && sin(angulo) > 0 && cos(angulo) < -0.9 && cos(angulo) > -1) {
      ImageTable = EntityW * 14;
      ImagePos = 0;
    }
  }
  void Restart() {
    Skol = loadImage("aranhaz" + Skin + ".png");
    EntityW = 93;
    EntityH = 98;
    Direction = 1;
    Speed = 3;
    MaxSpeed = 3;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    raio = 220;
    angulo = 0;
    IsLethal = true;
    detect = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
      Sniff.play();
    }
  }
  void DrawDebug() {
    rect(ActualLoc.x + CompStart, ActualLoc.y - EntityH, EntityW - CompEnd, EntityH);
  }
}
