class Castical {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, delay, frame, ImagePos, ImageTable;
  boolean IsLethal, TookDamage, detect, CreateProj;
  PImage Skol;
  PVector Hit1Start, Hit1End, Hit2Start, Hit2End, Hit3Start, Hit3End;
  ProjUD proj1, proj2, proj3;
  AudioPlayer Sniff;

  Castical (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("castical" + Skin + ".png");
    EntityW = 57;
    EntityH = 93;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    delay = 187;
    IsLethal = false;
    TookDamage = false;
    CreateProj = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("boladefogosurgindo.wav");
  }
  void Hitboxes() {
    Hit1Start = new PVector(Location + 6, groundcollision - EntityH + 20);
    Hit1End = new PVector(Location + 19, groundcollision - EntityH + 54);
    Hit2Start = new PVector(Location + 19, groundcollision - EntityH + 4);
    Hit2End = new PVector(Location + 36, groundcollision);
    Hit3Start = new PVector(Location + 36, groundcollision - EntityH + 20);
    Hit3End = new PVector(Location + EntityW - 6, groundcollision - EntityH + 54);
  }
  void TickEntity() {
    if (TookDamage == false) {
      StartEntity();
      DetectPlayer();
      DoDamage();
      Animate();
      Attack();
      Sounds();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity () {
    image(Skol.get(ImageTable, ImagePos, EntityW, EntityH), Location, groundcollision - EntityH, EntityW, EntityH);
    Hit1Start = new PVector(Location + 6, groundcollision - EntityH + 20);
    Hit1End = new PVector(Location + 19, groundcollision - EntityH + 54);
    Hit2Start = new PVector(Location + 19, groundcollision - EntityH + 18);
    Hit2End = new PVector(Location + 36, groundcollision);
    Hit3Start = new PVector(Location + 36, groundcollision - EntityH + 20);
    Hit3End = new PVector(Location + EntityW - 12, groundcollision - EntityH + 54);
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
    if (Hit3Start.x <= p.HeadEnd.x + p.location.x && Hit3End.x >= p.location.x + p.HeadStart.x) {
      if (Hit3Start.y <= p.HeadEnd.y + p.location.y && Hit3End.y >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x <= p.LeftarmEnd.x + p.location.x && Hit3End.x >= p.location.x + p.LeftarmStart.x) {
      if (Hit3Start.y <= p.LeftarmEnd.y + p.location.y && Hit3End.y >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x <= p.RightarmEnd.x + p.location.x && Hit3End.x >= p.location.x + p.RightarmStart.x) {
      if (Hit3Start.y <= p.RightarmEnd.y + p.location.y && Hit3End.y >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x <= p.TroncoEnd.x + p.location.x && Hit3End.x >= p.location.x + p.TroncoStart.x) {
      if (Hit3Start.y <= p.TroncoEnd.y + p.location.y && Hit3End.y >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x <= p.LeftlegEnd.x + p.location.x && Hit3End.x >= p.location.x + p.LeftlegStart.x) {
      if (Hit3Start.y <= p.LeftlegEnd.y + p.location.y && Hit3End.y >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x <= p.RightlegEnd.x + p.location.x && Hit3End.x >= p.location.x + p.RightlegStart.x) {
      if (Hit3Start.y <= p.RightlegEnd.y + p.location.y && Hit3End.y >= p.location.y + p.RightlegStart.y) {
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
        proj1 = new ProjUD(Location, groundcollision - EntityH, 0, 0, -4, -16);
        proj2 = new ProjUD(Location + 23, groundcollision - EntityH - 14, 0, 0, 0, -16);
        proj3 = new ProjUD(Location + 43, groundcollision - EntityH - 2, 0, 0, 4, -16);
      } else {
        proj1.TickEntity();
        proj2.TickEntity();
        proj3.TickEntity();
        if (proj2.groundcollision > 600 + proj2.EntityH) {
          delay = 187;
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
      if (ImageTable > 114) {
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
    Skol = loadImage("castical" + Skin + ".png");
    EntityW = 57;
    EntityH = 93;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 3;
    delay = 187;
    IsLethal = false;
    TookDamage = false;
    detect = false;
    CreateProj = false;
    Hitboxes();
    Location = StartLoc;
  }
  void DrawDebug() {
    rect(Location + 6, groundcollision - EntityH + 20, 19, 37);
    rect(Location + 19, groundcollision - EntityH + 18, 17, EntityH);
    rect(Location + 36, groundcollision - EntityH + 20, 15, 37);
  }
}
