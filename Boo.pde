class Boo {

  int Location, groundcollision, Skin, EntityW, EntityH, MaxSpeed, StartLoc, StartGround, CompStart, CompEnd, frame, ImagePos, ImageTable;
  float Speed;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff;

  Boo (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    StartGround = groundcollision;
    Skin = (int)random(Start, End);
    Skol = loadImage("boo.png");
    EntityW = 88;
    EntityH = 54;
    Speed = 1;
    MaxSpeed = 1;
    frame = 0;
    ImagePos = 0;
    ImageTable = 0;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("Fantasma.wav");
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
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    image(Skol.get(ImageTable, ImagePos, EntityW, EntityH), Location, groundcollision - EntityH, EntityW, EntityH);
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
    if (p.IsForward || p.IsBackward || p.IsFalling) {
      if (p.location.x + p.CharW / 2 > Location) {
        Location += Speed;
      } else {
        Location -= Speed;
      }
      if (p.location.y + p.CharH / 2 > groundcollision) {
        groundcollision += Speed;
      } else {
        groundcollision -= Speed;
      }
      if (Speed < MaxSpeed) {
        Speed += 0.5;
      }
      Animate();
      Sounds();
    } else {
      if (Location != StartLoc) {
        if (Location > StartLoc) {
          Location -= Speed;
        } else {
          Location += Speed;
        }
      }
      if (groundcollision != StartGround) {
        if (groundcollision > StartGround) {
          groundcollision -= Speed;
        } else {
          groundcollision += Speed;
        }
      }
      Animate();
    }
  }
  void Animate() {
    if (p.IsForward || p.IsBackward || p.IsFalling) {
      if (p.location.x + p.CharW / 2 < Location) {
        if (frame >= 4) {
          ImagePos = 0;
          ImageTable += 88;
          frame = 0;
        }
      } else {
        if (frame >= 4) {
          ImagePos = 54;
          ImageTable += 88;
          frame = 0;
        }
      }
      frame++;
    } else {
      if (groundcollision != StartGround) {
        if (frame >= 4) {
          ImagePos = 54;
          ImageTable += 88;
          frame = 0;
        } else {
          frame++;
        }
      }
    }
    if (ImageTable > 528) {
      ImageTable = 0;
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
      Sniff.play();
    }
  }
  void Restart() {
    Skol = loadImage("boo.png");
    EntityW = 88;
    EntityH = 54;
    Speed = 1;
    MaxSpeed = 1;
    IsLethal = true;
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
