class Goomba {

  int Location, groundcollision, Skin, EntityW, EntityH, Direction, Speed, MaxSpeed, StartLoc, CompStart, CompEnd, ImageTable, ImagePos;
  boolean IsLethal, TookDamage, detect;
  PImage Skol;
  PVector Hit1Start, Hit1End;
  AudioPlayer Sniff;

  Goomba (int locx, int locy, int Start, int End) {
    Location = locx;
    StartLoc = Location;
    groundcollision = locy;
    Skin = (int)random(Start, End);
    Skol = loadImage("esqueletinho" + Skin + ".png");
    EntityW = 49;
    EntityH = 70;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 2;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = false;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Sniff = minim.loadFile("muleke.wav");
  }
  void Hitboxes() {
    CompStart = 15;
    CompEnd = 0;
    Hit1Start = new PVector(Location + CompStart, groundcollision - EntityH);
    Hit1End = new PVector(Location + EntityW - CompEnd, groundcollision);
  }
  void TickEntity() {
    if (TookDamage == false) {
      StartEntity();
      DetectPlayer();
      DetectHazard();
      MoveEntity();
      DoDamage();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEntity() {
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
  void DetectHazard() {
    if (Local >= 0) {
      if (Fundo.Structure[Local].IsArrayMounted == true) {
        for (int i = 0; i < Fundo.Structure[Local].Base.length; i++) {
          if (Fundo.Structure[Local].Base[i].HaveHazard == true) {
            if (Fundo.Structure[Local].Base[i].Object.TookDamage == false) {
              if (Fundo.Structure[Local].Base[i].Object.Location < StartLoc) {
                if (Fundo.Structure[Local].Base[i].Object.Hit3End.x + Fundo.Structure[Local].Base[i].Object.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.Structure[Local].Base[i].Object.Location > StartLoc) { 
                if (Fundo.Structure[Local].Base[i].Object.Hit1Start.x + Fundo.Structure[Local].Base[i].Object.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.Structure[Local].Base[i].HaveMuleke == true) {
            if (Fundo.Structure[Local].Base[i].Muleke.StartLoc != StartLoc) {
              if (Fundo.Structure[Local].Base[i].Muleke.TookDamage == false) {
                if (Fundo.Structure[Local].Base[i].Muleke.StartLoc < StartLoc) {
                  if (Fundo.Structure[Local].Base[i].Muleke.Hit1End.x > Hit1Start.x) {
                    Direction = Direction * -1;
                  }
                } else if (Fundo.Structure[Local].Base[i].Muleke.Hit1Start.x < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.Structure[Local].Base[i].HavePilastraLightUp == true) {
            if (Fundo.Structure[Local].Base[i].PilastraLightUp.TookDamage == false) {
              if (Fundo.Structure[Local].Base[i].PilastraLightUp.Location < StartLoc) {
                if (Fundo.Structure[Local].Base[i].PilastraLightUp.Hit1End.x + Fundo.Structure[Local].Base[i].PilastraLightUp.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.Structure[Local].Base[i].PilastraLightUp.Location > StartLoc) { 
                if (Fundo.Structure[Local].Base[i].PilastraLightUp.Hit1Start.x + Fundo.Structure[Local].Base[i].PilastraLightUp.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.Structure[Local].Base[i].HavePilastraLightDown == true) {
            if (Fundo.Structure[Local].Base[i].PilastraLightDown.TookDamage == false) {
              if (Fundo.Structure[Local].Base[i].PilastraLightDown.Location < StartLoc) {
                if (Fundo.Structure[Local].Base[i].PilastraLightDown.Hit1End.x + Fundo.Structure[Local].Base[i].PilastraLightDown.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.Structure[Local].Base[i].PilastraLightDown.Location > StartLoc) { 
                if (Fundo.Structure[Local].Base[i].PilastraLightDown.Hit1Start.x + Fundo.Structure[Local].Base[i].PilastraLightDown.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          }
        }
      }
    }
    if (LocalY >= 0) {
      if (Fundo.VarStructure[LocalY].IsArrayMounted == true) {
        for (int i = 0; i < Fundo.VarStructure[LocalY].Base.length; i++) {
          if (Fundo.VarStructure[LocalY].Base[i].HaveHazard == true) {
            if (Fundo.VarStructure[LocalY].Base[i].Object.TookDamage == false) {
              if (Fundo.VarStructure[LocalY].Base[i].Object.Location < StartLoc) {
                if (Fundo.VarStructure[LocalY].Base[i].Object.Hit3End.x + Fundo.VarStructure[LocalY].Base[i].Object.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.VarStructure[LocalY].Base[i].Object.Location > StartLoc) { 
                if (Fundo.VarStructure[LocalY].Base[i].Object.Hit1Start.x + Fundo.VarStructure[LocalY].Base[i].Object.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.VarStructure[LocalY].Base[i].HaveMuleke == true) {
            if (Fundo.VarStructure[LocalY].Base[i].Muleke.StartLoc != StartLoc) {
              if (Fundo.VarStructure[LocalY].Base[i].Muleke.TookDamage == false) {
                if (Fundo.VarStructure[LocalY].Base[i].Muleke.StartLoc < StartLoc) {
                  if (Fundo.VarStructure[LocalY].Base[i].Muleke.Hit1End.x > Hit1Start.x) {
                    Direction = Direction * -1;
                  }
                } else if (Fundo.VarStructure[LocalY].Base[i].Muleke.Hit1Start.x < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.VarStructure[LocalY].Base[i].HavePilastraLightUp == true) {
            if (Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.TookDamage == false) {
              if (Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Location < StartLoc) {
                if (Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Hit1End.x + Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Location > StartLoc) { 
                if (Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Hit1Start.x + Fundo.VarStructure[LocalY].Base[i].PilastraLightUp.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          } else if (Fundo.VarStructure[LocalY].Base[i].HavePilastraLightDown == true) {
            if (Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.TookDamage == false) {
              if (Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Location < StartLoc) {
                if (Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Hit1End.x + Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Location > Hit1Start.x) {
                  Direction = Direction * -1;
                }
              } else if (Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Location > StartLoc) { 
                if (Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Hit1Start.x + Fundo.VarStructure[LocalY].Base[i].PilastraLightDown.Location < Hit1End.x) {
                  Direction = Direction * -1;
                }
              }
            }
          }
        }
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
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
      Sniff.play();
    }
  }
  void Restart() {
    Skol = loadImage("esqueletinho" + Skin + ".png");
    EntityW = 49;
    EntityH = 70;
    Direction = 1;
    Speed = 1;
    MaxSpeed = 2;
    ImageTable = 0;
    ImagePos = 0;
    IsLethal = false;
    TookDamage = false;
    detect = false;
    Hitboxes();
    Location = StartLoc;
  }
  void MoveEntity() {
    if (Speed < MaxSpeed && Speed > 0) {
      Speed = Speed + 1;
    } else if (Speed > -MaxSpeed && Speed < 0) {
      Speed = Speed + 1;
    } else {
      Speed = MaxSpeed;
    }
    Location = Location + Speed * Direction;
    Animate();
  }
  void Animate() {
    if (Direction == 1) {
      ImagePos = 0;
      ImageTable += 49;
    } else {
      ImagePos = 70;
      ImageTable += 49;
    }
    if (ImageTable > 392) {
      ImageTable = 0;
    }
    Sounds();
  }
  void DrawDebug() {
    rect(Location + CompStart, groundcollision - EntityH, EntityW - CompEnd, EntityH);
  }
}
