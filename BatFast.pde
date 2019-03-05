class BatFast {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, CompStart, CompEnd, ImagePos, ImageTable, frame;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff;

  BatFast (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("morcego" + Skin + ".png");
    EntityW = 118;
    EntityH = 58;
    Direction = -1;
    Speed = 1;
    MaxSpeed = 10;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    IsLethal = true;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("Batman.wav");
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
      Sounds();
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
        } else {
          GameOver();
        }
        TookDamage = true;
      }
      Sniff.pause();
    }
  }
  void MoveEntity() {
    if (Location < 0 - EntityW - 2) {
      Location = 800 + EntityW;
    }
    if (Location > 800 + EntityW + 2) {
      Location = 0 - EntityW;
    }
    Location = Location + Speed * Direction;
    if (Speed < MaxSpeed) {
      Speed++;
    }
  }
  void Animate() {
    if (frame < 4) {
      frame++;
    } else {
      if (Direction == 1) {
        ImagePos = 58;
        ImageTable += 118;
        frame = 0;
      } else {
        ImagePos = 0;
        ImageTable += 118;
        frame = 0;
      }
      if (ImageTable > 826) {
        ImageTable = 0;
        Sniff.play();
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
    Skol = loadImage("morcego" + Skin + ".png");
    EntityW = 118;
    EntityH = 58;
    Direction = -1;
    Speed = 1;
    MaxSpeed = 8;
    ImagePos = 0;
    ImageTable = 0;
    frame = 0;
    IsLethal = true;
    detect = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
