class Hazards {

  int Location, groundcollision, Skin, HazW, HazH;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector VetLoc, Hit1Start, Hit1End, Hit2Start, Hit2End, Hit3Start, Hit3End;

  Hazards (int loc, int Yloc, int Start, int End) {
    Location = loc;
    groundcollision = Yloc;
    if (Cenario == "igreja") {
      Skin = 0;
    } else if (Cenario == "cemiterio") {
      Skin = (int)random(2, 6);
    }
    IsLethal = false;
    TookDamage = false;
    StartObject();
    Hit1Start = new PVector(HazW / 2, HazH / 2);
    Hit2Start = new PVector(HazW / 2, HazH / 2);
    Hit3Start = new PVector(HazW / 2, HazH / 2);
    Hit1End = new PVector(HazW, HazH);
    Hit2End = new PVector(HazW, HazH);
    Hit3End = new PVector(HazW, HazH);
    detect = false;
  }
  void DoDamage() {
    TookDamage = true;
    if (IsLethal == true) {
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
    }
  }
  void StartObject() {
    if (Skin == 0) {
      Skol = loadImage("banco.png");
    } else if (Skin == 1) {
      Skol = loadImage("casticalcaido.png");
    } else if (Skin == 2) {
      Skol = loadImage("lapide0.png");
    } else if (Skin == 3) {
      Skol = loadImage("lapide1.png");
    } else if (Skin == 4) {
      Skol = loadImage("lapide2.png");
    } else if (Skin == 5) {
      Skol = loadImage("lapide3.png");
    } else if (Skin == 6) {
      Skol = loadImage("cranio.png");
    }
    HazH = Skol.height;
    HazW = Skol.width;
  }
  void TickHazard() {
    if (TookDamage == false) {
      image(Skol, Location, groundcollision - HazH, HazW, HazH);
      Hitboxes();
      DetectPlayer();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  //DetectPlayer
  void DetectPlayer() {
    if (Hit1Start.x + Location <= p.HeadEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.HeadStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.HeadEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x + Location <= p.LeftarmEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.LeftarmStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.LeftarmEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x + Location <= p.RightarmEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.RightarmStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.RightarmEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x + Location <= p.TroncoEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.TroncoStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.TroncoEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x + Location <= p.LeftlegEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.LeftlegStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.LeftlegEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit1Start.x + Location <= p.RightlegEnd.x + p.location.x && Hit1End.x + Location >= p.location.x + p.RightlegStart.x) {
      if (Hit1Start.y + (groundcollision - HazH) <= p.RightlegEnd.y + p.location.y && Hit1End.y + (groundcollision - HazH) >= p.location.y + p.RightlegStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.HeadEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.HeadStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.HeadEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.LeftarmEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.LeftarmStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.LeftarmEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.RightarmEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.RightarmStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.RightarmEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.TroncoEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.TroncoStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.TroncoEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.LeftlegEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.LeftlegStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.LeftlegEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit2Start.x + Location <= p.RightlegEnd.x + p.location.x && Hit2End.x + Location >= p.location.x + p.RightlegStart.x) {
      if (Hit2Start.y + (groundcollision - HazH) <= p.RightlegEnd.y + p.location.y && Hit2End.y + (groundcollision - HazH) >= p.location.y + p.RightlegStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.HeadEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.HeadStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.HeadEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.HeadStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.LeftarmEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.LeftarmStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.LeftarmEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.LeftarmStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.RightarmEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.RightarmStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.RightarmEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.RightarmStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.TroncoEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.TroncoStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.TroncoEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.TroncoStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.LeftlegEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.LeftlegStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.LeftlegEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.LeftlegStart.y) {
        detect = true;
      }
    }
    if (Hit3Start.x + Location <= p.RightlegEnd.x + p.location.x && Hit3End.x + Location >= p.location.x + p.RightlegStart.x) {
      if (Hit3Start.y + (groundcollision - HazH) <= p.RightlegEnd.y + p.location.y && Hit3End.y + (groundcollision - HazH) >= p.location.y + p.RightlegStart.y) {
        detect = true;
      }
    }
    if (detect == true && TookDamage == false) {
      DoDamage();
    }
  }
  void Hitboxes() {
    if (Skin == 0) {
      Hit1Start = new PVector(10, 47);
      Hit1End = new PVector(66, 93);
      Hit2Start = new PVector(44, 10);
      Hit2End = new PVector(67, 93);
      Hit3Start = new PVector(67, 80);
      Hit3End = new PVector(87, 93);
    }
    if (Skin == 1) {
      Hit1Start = new PVector(10, 27);
      Hit1End = new PVector(66, 93);
      Hit2Start = new PVector(44, 10);
      Hit2End = new PVector(87, 93);
      Hit3Start = new PVector(87, 40);
      Hit3End = new PVector(140, 93);
    }
    if (Skin == 2) {
      Hit1Start = new PVector(10, 37);
      Hit1End = new PVector(66, 93);
      Hit2Start = new PVector(30, 30);
      Hit2End = new PVector(64, 93);
      Hit3Start = new PVector(64, 37);
      Hit3End = new PVector(74, 100);
    }
    if (Skin == 3) {
      Hit1Start = new PVector(9, 21);
      Hit1End = new PVector(34, 41);
      Hit2Start = new PVector(34, 1);
      Hit2End = new PVector(56, 88);
      Hit3Start = new PVector(56, 21);
      Hit3End = new PVector(73, 41);
    }
    if (Skin == 4) {
      Hit1Start = new PVector(19, 35);
      Hit1End = new PVector(34, 88);
      Hit2Start = new PVector(34, 12);
      Hit2End = new PVector(53, 88);
      Hit3Start = new PVector(53, 35);
      Hit3End = new PVector(69, 88);
    }
    if (Skin == 5) {
      Hit1Start = new PVector(8, 31);
      Hit1End = new PVector(28, 88);
      Hit2Start = new PVector(28, 15);
      Hit2End = new PVector(61, 88);
      Hit3Start = new PVector(61, 31);
      Hit3End = new PVector(76, 88);
    }
    if (Skin == 6) {
      Hit1Start = new PVector(8, 31);
      Hit1End = new PVector(28, 88);
      Hit2Start = new PVector(28, 15);
      Hit2End = new PVector(61, 88);
      Hit3Start = new PVector(61, 31);
      Hit3End = new PVector(76, 88);
    }
  }
  void ResetHazard() {
    detect = false;
    TookDamage = false;
  }
  void DrawDebug() {
    rect(Location + Hit1Start.x, (groundcollision - HazH) + Hit1Start.y, Hit1End.x - Hit1Start.x, Hit1End.y - Hit1Start.y);
    rect(Location + Hit2Start.x, (groundcollision - HazH) + Hit2Start.y, Hit2End.x - Hit2Start.x, Hit2End.y - Hit2Start.y);
    rect(Location + Hit3Start.x, (groundcollision - HazH) + Hit3Start.y, Hit3End.x - Hit3Start.x, Hit3End.y - Hit3Start.y);
  }
}
