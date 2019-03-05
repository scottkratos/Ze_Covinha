class Corredor {

  PVector Hit1Start, Hit1End, gravity, velocityX, velocityY, velocityUP, forwardvelocity, backwardvelocity, location, jump;
  boolean LockStairs, CanMove, CanClimb, Input, MaxSpeed, IsFalling, ResVel, StartJump, IsForward, IsBackward, IsCrouching, IsJumping;
  PImage[] jumparray, croucharray, leftarray, rightarray, idlearray, interactarray;
  int direction, CharW, CharH, groundcollision, LocalLocal, ImageTable, ImagePos, frame;
  PImage ActualImage;
  char CurrentLetter;
  float MaximumSpeed;
  AudioPlayer Sniff;

  Corredor() {
    location = new PVector(-800, 100);
    forwardvelocity = new PVector(0.3, 0);
    backwardvelocity = new PVector(-0.3, 0);
    jump = new PVector(0, -3.3);
    gravity = new PVector(0, 0.2);
    velocityY = new PVector(0, 0.5);
    velocityUP = new PVector(0, 0.5);
    velocityX = new PVector(0.5, 0);
    MaxSpeed = false;
    MaximumSpeed = 2;
    ImageTable = 0;
    ImagePos = 0;
    frame = 0;
    CanClimb = false;
    CanMove = true;
    LockStairs = false;
    ActualImage = loadImage("skelly0.png");
    CurrentLetter = p.CurrentLetter;
    direction = 1;
    CharW = 187;
    CharH = 141;
    Sniff = minim.loadFile("chefao.wav");
    if (Cenario == "igreja") {
      groundcollision = 560 - CharH;
    } else {
      groundcollision = 514 - CharH;
    }
    LocalLocal = Local;
    CharacterSetup();
  }
  void TickBot() {
    CharacterSetup();
    if (!IsInTutorial) {
      Gravity();
      Growl();
      KeepVelocity();
      Directions();
      DrawDebug();
      Animate();
    }
  }
  void CharacterSetup() {
    if (!IsPuzzleInteracting) {
      image(ActualImage.get(ImageTable, ImagePos, CharW, CharH), location.x, location.y, CharW, CharH);
    }
  }
  void Animate() {
    if (direction == 1) {
      if (frame < 10) {
        frame++;
      } else {
        ImageTable += 187;
        ImagePos = 0;
        frame = 0;
      }
    } else {
      if (frame < 10) {
        frame++;
      } else {
        ImageTable += 187;
        ImagePos = 141;
        frame = 0;
      }
    }
    if (ImageTable > 561) {
      ImageTable = 0;
    }
  }
  void Gravity() {
    if (location.y < groundcollision) {
      velocityUP.set(0, 0.5);
      location.add(velocityY);
      velocityY.add(gravity);
      IsFalling = true;
    } else {
      if (IsFalling == true) {
        location.set(location.x, groundcollision);
        velocityY.set(0, 0.5);
        IsFalling = false;
      } else {
        velocityY.set(0, 0);
      }
    }
  }
  void KeepVelocity() {
    if (CanMove == true) {
      if (velocityX.x >= MaximumSpeed || velocityX.x <= -MaximumSpeed) {
        MaxSpeed = true;
      } else {
        MaxSpeed = false;
      }
    } else {
      MaximumSpeed = 0;
    }
  }
  void ResetXVelocity() {
    if (ResVel == false) {
      velocityX = new PVector(0.5, 0);
      ResVel = true;
    }
  }
  void Directions() {
    if (CurrentLetter == 'y' && Cenario != "igreja") {
      if (Cenario == "cemiterio") {
        if (LocalY != 19) {
          if (!CanClimb && location.y > 373) {
            location.y = 373;
          }
        }
      } else {
        if (!CanClimb && location.y > 514 - CharH) {
          location.y = 514 - CharH;
          groundcollision = 514 - CharH;
        }
      }
    }
    if (CanMove == true) {
      if (Cenario == "igreja") {
        if (CurrentLetter != p.CurrentLetter) {
          if (p.CurrentLetter == 'y') {
            location.y = location.y + 600;
            groundcollision = 1160 - CharH;
            CurrentLetter = 'y';
          } else {
            location.y = location.y - 600;
            groundcollision = 560 - CharH;
            CurrentLetter = 'x';
          }
        }
      } else if (Cenario == "cemiterio") {
        if (CurrentLetter != p.CurrentLetter) {
          if (p.CurrentLetter == 'y') {
            location.y = location.y + 600;
            groundcollision = 560 - CharH;
            CurrentLetter = 'y';
          } else {
            location.y = location.y - 600;
            groundcollision = 560 - CharH;
            CurrentLetter = 'x';
          }
        }
      } else if (Cenario == "casa") {
        if (CurrentLetter != p.CurrentLetter) {
          if (p.CurrentLetter == 'y') {
            location.y = location.y + 600;
            groundcollision = 560 - CharH;
            CurrentLetter = 'y';
          } else {
            location.y = location.y - 600;
            groundcollision = 560 - CharH;
            CurrentLetter = 'x';
          }
        }
      }
      Hit1Start = new PVector(location.x, groundcollision);
      Hit1End = new PVector(location.x + CharW, groundcollision + CharH);
      if (LockStairs == false) {
        if (location.x < p.location.x - p.CharW) {
          direction = 1;
          if (MaxSpeed == false) {
            location.add(velocityX.x * direction, 0);
            velocityX.add(forwardvelocity);
          } else {
            location.add(velocityX.x * direction, 0);
            ResVel = false;
          }
        } else {
          direction = -1;
          if (MaxSpeed == false) {
            location.add(velocityX.x * direction, 0);
            velocityX.add(forwardvelocity);
          } else {
            location.add(velocityX.x * direction, 0);
            ResVel = false;
          }
        }
      }
      if (Cenario == "igreja") {
        if (CurrentLetter == 'x') {
          if (LocalLocal == Local) {
            if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
              if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                GameOver();
              }
            }
          }
        } else {
          if (CurrentLetter == 'y') {
            if ((LocalLocal - 4) / 2 == LocalY) {
              if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
                if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                  GameOver();
                }
              }
            }
          }
        }
      } else if (Cenario == "cemiterio") {
        if (CurrentLetter == 'x') {
          if ((LocalLocal - 4) / 2 == Local) {
            if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
              if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                GameOver();
              }
            }
          }
        } else {
          if (CurrentLetter == 'y') {
            if (LocalLocal == LocalY) {
              if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
                if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                  GameOver();
                }
              }
            }
          }
        }
      } else if (Cenario == "casa") {
        if (CurrentLetter == 'x') {
          if ((LocalLocal - 4) / 2 == Local) {
            if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
              if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                GameOver();
              }
            }
          }
        } else {
          if (CurrentLetter == 'y') {
            if (LocalLocal == LocalY) {
              if (p.location.x + p.CharW > Hit1Start.x && p.location.x < Hit1End.x) {
                if (Hit1Start.y < p.location.y + CharH && Hit1End.y > p.location.y) {
                  GameOver();
                }
              }
            }
          }
        }
      }
    }
    if (Cenario == "igreja") {
      if (LocalLocal != Local) {
        if (LocalLocal > Local) {
          location.x = location.x + CharW + 800;
          LocalLocal = Local;
          //((LocalLocal - Local) * 800)
        } else {
          location.x = location.x - CharW - 800;
          LocalLocal = Local;
          //((Local - LocalLocal) * 800)
        }
      }
    } else {
      if (LocalLocal != LocalY) {
        if (LocalLocal > LocalY) {
          location.x = location.x + CharW + 800;
          LocalLocal = LocalY;
          //((LocalLocal - Local) * 800)
        } else {
          location.x = location.x - CharW - 800;
          LocalLocal = LocalY;
          //((Local - LocalLocal) * 800)
        }
      }
    }
    if (CanClimb == true) {
      if (p.location.x > 470 || p.location.x < 370) {
        LockStairs = false;
      } else {
        LockStairs = true;
      }
      if (p.HeadStart.y + p.location.y < location.y) {
        groundcollision -= 3;
        location.y -= 3;
      } else {
        if (CurrentLetter == 'x') {
          if (groundcollision < 560 - CharH) {
            groundcollision += 4;
            location.y += 4;
            if (groundcollision > 560 - CharH) {
              groundcollision = 560 - CharH;
              location.y = groundcollision;
            }
          }
        } else {
          if (groundcollision < 514 - CharH) {
            groundcollision += 4;
            location.y += 4;
            if (groundcollision > 514 - CharH) {
              groundcollision = 514 - CharH;
              location.y = groundcollision;
            }
          }
        }
      }
    } else {
      LockStairs = false;
      if (Local != 18) {
        if (location.x < -400) {
          if (p.HeadStart.y + p.location.y < location.y) {
            groundcollision -= 3;
            location.y -= 3;
          } else {
            if (Cenario == "igreja") {
              if (CurrentLetter == 'x') {
                if (groundcollision < 560 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 560 - CharH) {
                    groundcollision = 560 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            } else {
              if (CurrentLetter == 'x') {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            }
          }
        } else if (location.x > 1200) {
          if (p.HeadStart.y + p.location.y < location.y) {
            groundcollision -= 3;
            location.y -= 3;
          } else {
            if (Cenario == "igreja") {
              if (CurrentLetter == 'x') {
                if (groundcollision < 560 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 560 - CharH) {
                    groundcollision = 560 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            } else {
              if (CurrentLetter == 'x') {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            }
          }
        } else {
          if (Cenario == "igreja") {
            if (CurrentLetter == 'x') {
              if (groundcollision < 560 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 560 - CharH) {
                  groundcollision = 560 - CharH;
                  location.y = groundcollision;
                }
              }
            } else {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            }
          } else {
            if (CurrentLetter == 'x') {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            } else {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            }
          }
        }
      } else if (Local != 4) {
        if (location.x < -400) {
          if (p.HeadStart.y + p.location.y < location.y) {
            groundcollision -= 3;
            location.y -= 3;
          } else {
            if (Cenario == "igreja") {
              if (CurrentLetter == 'x') {
                if (groundcollision < 560 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 560 - CharH) {
                    groundcollision = 560 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            } else {
              if (CurrentLetter == 'x') {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            }
          }
        } else if (location.x > 1200) {
          if (p.HeadStart.y + p.location.y < location.y) {
            groundcollision -= 3;
            location.y -= 3;
          } else {
            if (Cenario == "igreja") {
              if (CurrentLetter == 'x') {
                if (groundcollision < 560 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 560 - CharH) {
                    groundcollision = 560 - CharH;
                    location.y = groundcollision;
                  }
                }
              } else {
                if (groundcollision < 514 - CharH) {
                  groundcollision += 4;
                  location.y += 4;
                  if (groundcollision > 514 - CharH) {
                    groundcollision = 514 - CharH;
                    location.y = groundcollision;
                  }
                }
              }
            }
          }
        } else {
          if (Cenario == "igreja") {
            if (CurrentLetter == 'x') {
              if (groundcollision < 560 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 560 - CharH) {
                  groundcollision = 560 - CharH;
                  location.y = groundcollision;
                }
              }
            } else {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            }
          } else {
            if (CurrentLetter == 'x') {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            } else {
              if (groundcollision < 514 - CharH) {
                groundcollision += 4;
                location.y += 4;
                if (groundcollision > 514 - CharH) {
                  groundcollision = 514 - CharH;
                  location.y = groundcollision;
                }
              }
            }
          }
        }
      }
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
      Sniff.play();
    }
  }
  void Growl() {
    if (dist(p.location.x, p.location.y, location.x, location.y) < 300) {
      Sounds();
    }
  }
  void Restart() {
    location = new PVector(-800, 100);
    forwardvelocity = new PVector(0.3, 0);
    backwardvelocity = new PVector(-0.3, 0);
    jump = new PVector(0, -3.3);
    gravity = new PVector(0, 0.2);
    velocityY = new PVector(0, 0.5);
    velocityUP = new PVector(0, 0.5);
    velocityX = new PVector(0.5, 0);
    ImageTable = 0;
    ImagePos = 0;
    frame = 0;
    MaxSpeed = false;
    MaximumSpeed = 2;
    CanClimb = false;
    CanMove = true;
    LockStairs = false;
    direction = 1;
    ActualImage = loadImage("skelly0.png");
    CharW = 187;
    CharH = 141;
    if (Cenario == "igreja") {
      groundcollision = 560 - CharH;
    } else {
      groundcollision = 514 - CharH;
    }
    LocalLocal = 0;
  }
  void DrawDebug() {
    if (DebugMode == true) {
      rect(location.x, groundcollision, CharW, CharH);
    }
  }
}
