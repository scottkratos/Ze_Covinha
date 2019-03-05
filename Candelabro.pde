class Candelabro {

  int Location, groundcollision, Skin, EntityW, EntityH, StartLoc, CompStart, CompEnd, delay, frame, ImagePos, ImageTable;
  boolean IsLethal, TookDamage, detect, CreateProj;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  ProjLock proj;
  AudioPlayer Sniff;

  Candelabro (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("lustre" + Skin + ".png");
    EntityW = 44;
    EntityH = 100;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = true;
    TookDamage = false;
    CreateProj = false;
    delay = 125;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("boladefogosurgindo.wav");
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
      Attack();
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
  void Attack() {
    if (delay > 0) {
      delay--;
    } else {
      if (CreateProj == false) {
        Sniff.play();
        CreateProj = true;
        proj = new ProjLock(Location + 10, groundcollision - EntityH + 34, 1, 1);
      } else {
        proj.TickEntity();
        if (proj.groundcollision > height + proj.EntityH || proj.groundcollision < 0 - proj.EntityH || proj.Location > width + proj.EntityW || proj.Location < 0 - proj.EntityW) {
          delay = 125;
          CreateProj = false;
        }
      }
    }
  }
  void Animate() {
    if (frame >= 4) {
      if (CreateProj) {
        ImageTable = 0;
        ImagePos = 0;
      } else {
        ImageTable += EntityW;
        ImagePos = EntityH;
      }
      if (ImageTable > 88) {
        ImageTable = 0;
      }
      frame = 0;
    } else {
      frame++;
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
    }
  }
  void Restart() {
    Skol = loadImage("lustre" + Skin + ".png");
    EntityW = 44;
    EntityH = 100;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = true;
    CreateProj = false;
    delay = 125;
    detect = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
