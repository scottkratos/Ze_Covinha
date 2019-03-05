class ProjLock {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, TargetX, TargetY, MaxSpeed, SpeedX, SpeedY, StartLoc, CompStart, CompEnd, delay, LocX, LocY, frame, ImagePos, ImageTable;
  float Pieces;
  boolean IsLethal, TookDamage, detect, Lock;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff;

  ProjLock (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("projetil" + 1 + ".png");
    EntityW = 30;
    EntityH = 30;
    Direction = 1;
    MaxSpeed = 4;
    delay = 62;
    frame = 0;
    ImagePos = 0;
    ImageTable = 0;
    IsLethal = true;
    TookDamage = false;
    Lock = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("boladefogosoltando2.wav");
  }
  void Hitboxes() {
    CompStart = 2;
    CompEnd = 2;
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH + CompStart);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision - CompEnd);
  }
  void TickEntity() {
    DetectPlayer();
    MoveEntity();
    Animate();
    if (TookDamage == false) {
      StartEntity();
      DoDamage();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    image(Skol.get(ImageTable, ImagePos, EntityW, EntityH), Location, groundcollision - EntityH, EntityW, EntityH);
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH + CompStart);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision - CompEnd);
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
    if (p.IsUsingPa) {
      if (detect == true && TookDamage == false) {
        p.psounds[2].rewind();
        p.psounds[2].play();
        TookDamage = true;
        Sniff.pause();
      }
    } else {
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
  }
  void MoveEntity() {
    if (delay > 0) {
      delay--;
    } else {
      Sniff.play();
      if (Lock == false) {
        TargetX = (int)p.location.x + p.CharW / 2;
        TargetY = (int)p.location.y + p.CharH / 2;
        Lock = true;
        LocX = TargetX - Location;
        LocY = TargetY - groundcollision;
        if (LocX > LocY) {
          Pieces = LocX / MaxSpeed;
        } else {
          Pieces = LocY / MaxSpeed;
        }
        SpeedX = LocX / (int)Pieces;
        SpeedY = LocY / (int)Pieces;
      }
      Location = Location + SpeedX;
      groundcollision = groundcollision + SpeedY;
    }
  }
  void Animate() {
    if (frame >= 4) {
      ImageTable += 30;
      ImagePos = 0;
      if (ImageTable > 60) {
        ImageTable = 0;
      }
      frame = 0;
    } else {
      frame++;
    }
  }
  void Restart() {
    Skol = loadImage("projetil" + 1 + ".png");
    EntityW = 30;
    EntityH = 30;
    Direction = 1;
    MaxSpeed = 4;
    delay = 62;
    frame = 0;
    ImagePos = 0;
    ImageTable = 0;
    IsLethal = true;
    detect = false;
    Lock = false;
    Hitboxes();
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH + CompStart, EntityW - CompEnd, EntityH - CompEnd);
  }
}
