class MultiProj {

  int Location, groundcollision, Skin, EntityW, EntityH, StartLoc, CompStart, CompEnd, delay, frame, ImageTable, ImagePos;
  boolean IsLethal, TookDamage, detect, CreateProj;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  ProjKonst proj1, proj2, proj3, proj4, proj5, proj6, proj7, proj8;
  AudioPlayer Sniff;

  MultiProj (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("chu.png");
    EntityW = 54;
    EntityH = 47;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = false;
    delay = 62;
    CreateProj = false;
    TookDamage = false;
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
        proj1 = new ProjKonst(Location - EntityW / 4, groundcollision + EntityH / 2, 0, 0, -4, 4);
        proj2 = new ProjKonst(Location + EntityW / 3, groundcollision + EntityH / 2, 0, 0, 0, 4);
        proj3 = new ProjKonst(Location + EntityW, groundcollision + EntityH / 2, 0, 0, 4, 4);
        proj4 = new ProjKonst(Location - EntityW / 4, groundcollision - EntityH / 2, 0, 0, -4, 0);
        proj5 = new ProjKonst(Location + EntityW, groundcollision - EntityH / 4, 0, 0, 4, 0);
        proj6 = new ProjKonst(Location - EntityW / 4, groundcollision - EntityH - EntityH / 3, 0, 0, -4, -4);
        proj7 = new ProjKonst(Location + EntityW / 3, groundcollision - EntityH - EntityH / 3, 0, 0, 0, -4);
        proj8 = new ProjKonst(Location + EntityW, groundcollision - EntityH - EntityH / 3, 0, 0, 4, -4);
      } else {
        proj1.TickEntity();
        proj2.TickEntity();
        proj3.TickEntity();
        proj4.TickEntity();
        proj5.TickEntity();
        proj6.TickEntity();
        proj7.TickEntity();
        proj8.TickEntity();
        if (proj2.groundcollision > 600 + proj2.EntityH) {
          delay = 62;
          CreateProj = false;
        }
      }
    }
  }
  void Animate() {
    if (frame >= 4) {
      if (!CreateProj) {
        ImageTable += EntityW;
        ImagePos = EntityH;
      } else {
        ImageTable = 0;
        ImagePos = 0;
      }
      if (ImageTable > 108) {
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
    Skol = loadImage("chu.png");
    EntityW = 54;
    EntityH = 47;
    frame = 0;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = false;
    detect = false;
    delay = 62;
    CreateProj = false;
    Hitboxes();
    Location = StartLoc;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
