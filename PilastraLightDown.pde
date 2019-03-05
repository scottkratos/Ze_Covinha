class PilastraLightDown {

  int Location, groundcollision, Skin, EntityW, EntityH, StartLoc, CompStart, CompEnd;
  boolean IsLethal, TookDamage, detect, ChangeInstance;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff, Sniff2;

  PilastraLightDown (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(0, 3);
    Skol = loadImage("tent" + Skin + ".png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    IsLethal = false;
    TookDamage = false;
    detect = false;
    Hitboxes();
    ChangeInstance = false;
    Sniff = minim.loadFile("tentaculoaparecendo.wav");
    Sniff2 = minim.loadFile("tentaculosumindo.wav");
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
      Sounds();
      if (!p.IsUsingLamp) {
        DetectPlayer();
      }
      DoDamage();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    if (!p.IsUsingLamp) {
      if (ChangeInstance != p.IsUsingLamp) {
        Sniff.play();
        ChangeInstance = p.IsUsingLamp;
      }
      image(Skol, Location, groundcollision - EntityH, EntityW, EntityH);
      Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
      Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
    } else {
      if (ChangeInstance != p.IsUsingLamp) {
        Sniff2.play();
        ChangeInstance = p.IsUsingLamp;
      }
    }
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
    if (!p.IsUsingLamp) {
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
          Sniff.pause();
          Sniff2.pause();
        }
      }
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
    }
    if (!Sniff2.isPlaying()) {
      Sniff2.pause();
      Sniff2.rewind();
    }
  }
  void Restart() {
    Skol = loadImage("tent" + Skin + ".png");
    EntityW = Skol.width;
    EntityH = Skol.height;
    IsLethal = false;
    detect = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
