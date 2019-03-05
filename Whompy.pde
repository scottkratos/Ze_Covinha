class Whompy {
  
  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, StartGround, CompStart, CompEnd, delay, MaxLenght;
  float SpeedY;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff;
  
  Whompy (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    StartGround = groundcollision;
    Skin = (int)random(Start, End);
    Skol = loadImage("rato" + Skin + ".png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = -1;
    Speed = 1;
    SpeedY = 1;
    MaxSpeed = 5;
    MaxLenght = 300;
    delay = 62;
    IsLethal = false;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("Rato.wav");
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
	  Sounds();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    image(Skol, Location, groundcollision - EntityH, EntityW, EntityH);
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
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
        if (p.MaximumSpeed > 1){
          p.psounds[4].rewind();
          p.psounds[4].play();
          p.MaximumSpeed = p.MaximumSpeed - 1;
          p.ResVel = false;
          p.ResetXVelocity();
        }
        TookDamage = true;
      }
	  Sniff.pause();
    }
  }
  void MoveEntity() {
    if (delay > 0) {
      delay--;
    } else {
	  Sniff.play();
      if (Direction == -1) {
        if (Location > StartLoc - MaxLenght) {
          Location = Location - Speed;
          if (Speed < MaxSpeed) {
            Speed++;
          }
          if (StartLoc - Location >= MaxLenght / 2) {
            groundcollision = groundcollision + (int)SpeedY;
          } else {
            groundcollision = groundcollision - (int)SpeedY;
          }
          if (SpeedY < MaxSpeed) {
            SpeedY += 1;
          }
        } else {
          Speed = 0;
          SpeedY = 0;
          Direction = 1;
          delay = 62;
        }
      } else if (Direction == 1) {
        if (Location < StartLoc) {
          Location = Location + Speed;
          if (Speed < MaxSpeed) {
            Speed++;
          }
          if (StartLoc - Location >= MaxLenght / 2) {
            groundcollision = groundcollision - (int)SpeedY;
          } else {
            groundcollision = groundcollision + (int)SpeedY;
          }
          if (p.CurrentLetter == 'y') {
            if (groundcollision > 514) {
              groundcollision = 514;
            }
          } else {
            if (groundcollision > 514) {
              groundcollision = 514;
            }
          }
          if (SpeedY < MaxSpeed) {
            SpeedY += 1;
          }
        } else {
          Speed = 0;
          SpeedY = 1;
          Direction = -1;
          delay = 62;
        }
      }
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
    }
  }
  void Restart() {
    Skol = loadImage("rato" + Skin + ".png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = -1;
    Speed = 1;
    SpeedY = 1;
    MaxSpeed = 5;
    delay = 62;
    MaxLenght = 300;
    IsLethal = false;
    detect = false;
    Hitboxes();
    Location = StartLoc;
    groundcollision = StartGround;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
