class Whomp {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, MaxSpeed, StartLoc, StartGround, CompStart, CompEnd, delay;
  float Speed;
  boolean IsLethal, TookDamage, detect, nerby, activated;
  PImage Skol;
  PVector Hit1Start, Hit1End, DetectBoxStart, DetectBoxEnd;
  AudioPlayer Sniff;

  Whomp (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    StartGround = groundcollision;
    Skin = (int)random(Start, End);
    Skol = loadImage("whomp.png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = 1;
    Speed = 0;
    MaxSpeed = 10;
    delay = 62;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    nerby = false;
    activated = false;
    Hitboxes();
	Sniff = minim.loadFile("pedroso.wav");
  }
  void Hitboxes() {
    CompStart = 0;
    CompEnd = 0;
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
    DetectBoxStart = new PVector(Location - 2 * EntityW, 0);
    DetectBoxEnd = new PVector(Location + 2 * EntityW, 600);
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
    if (p.location.x + p.CharW > DetectBoxStart.x && p.location.x < DetectBoxEnd.x) {
      if (p.location.y + p.CharH > DetectBoxStart.y && p.location.y < DetectBoxEnd.y) {
        nerby = true;
      } else {
        nerby = false;
      }
    } else {
      nerby = false;
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
	  Sniff.pause();
    }
  }
  void MoveEntity() {
    if (p.CurrentLetter == 'x') {
      if (Direction == 1) {
        if (nerby) {
          activated = true;
          if (groundcollision < 514) {
            if (Speed < MaxSpeed) {
              Speed = Speed + 0.5;
            }
            groundcollision += Speed;
          } else {
		    Sniff.play();
            Speed = 0;
            Direction = -1;
          }
        } else if (activated) {
          if (groundcollision < 514) {
            if (Speed < MaxSpeed) {
              Speed = Speed + 0.5;
            }
            groundcollision += Speed;
          } else {
		    Sniff.play();
            Speed = 0;
            Direction = -1;
          }
        }
      } else {
        if (delay > 0) {
          delay--;
        } else {
          activated = false;
          if (groundcollision > StartGround) {
            if (Speed < MaxSpeed / 2) {
              Speed++;
            }
            groundcollision -= Speed;
          } else {
            Direction = 1;
            delay = 62;
          }
        }
      }
    } else {
      if (Direction == 1) {
        if (nerby) {
          activated = true;
          if (groundcollision < 514) {
            if (Speed < MaxSpeed) {
              Speed = Speed + 0.5;
            }
            groundcollision += Speed;
          } else {
            Speed = 0;
            Direction = -1;
          }
        } else if (activated) {
          if (groundcollision < 514) {
            if (Speed < MaxSpeed) {
              Speed = Speed + 0.5;
            }
            groundcollision += Speed;
          } else {
            Speed = 0;
            Direction = -1;
          }
        }
      } else {
        if (delay > 0) {
          delay--;
        } else {
          activated = false;
          if (groundcollision > StartGround) {
            if (Speed < MaxSpeed / 2) {
              Speed++;
            }
            groundcollision -= Speed;
          } else {
            Direction = 1;
            delay = 62;
          }
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
    Skol = loadImage("whomp.png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 10;
    delay = 62;
    Location = StartLoc;
    groundcollision = StartGround; 
    IsLethal = true;
    detect = false;
    nerby = false;
    activated = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
