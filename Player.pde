class Player {

  //SettingVariables

  PVector HeadStart, HeadEnd, LeftarmStart, LeftarmEnd, RightarmStart, RightarmEnd, TroncoStart, TroncoEnd, LeftlegStart, LeftlegEnd, RightlegStart, RightlegEnd, gravity, velocityX, velocityY, velocityUP, forwardvelocity, backwardvelocity, location, jump;
  PImage[] jumparray, croucharray, leftarray, rightarray, idlearray, interactarray;
  char facingdirection, CurrentLetter;
  boolean Checkpoint, HaveFuel, HaveLamp, HavePa, IsUsingPa, IsUsingLamp, CanInteract, IsArc, CheckW, ClimbingUp, ClimbingDown, InputClimb, CanClimb, CanInput, Input, MaxSpeed, IsFalling, ResVel, StartJump, IsForward, IsBackward, IsCrouching, IsJumping;
  int vidas, ResetAnim, R, G, B, CheckY, CheckX, frame, Fuel, delay, ClimbPosition, ImageTable, ImagePos, MaximumSpeed, CharW, CharH, jumpframe, crouchframe, moveleftframe, moverightframe, idleframe, interactframe, groundcollision;
  PImage ActualImage, darkness, cabeca, lampiao;
  PGraphics mask;
  float bar;
  AudioPlayer[] passos, psounds;

  //SetupFunctions&Primitives

  Player () {
    location = new PVector(0, 350);
    forwardvelocity = new PVector(0.3, 0);
    backwardvelocity = new PVector(-0.3, 0);
    jump = new PVector(0, -3.4);
    gravity = new PVector(0, 0.2);
    velocityY = new PVector(0, 0.5);
    velocityUP = new PVector(0, 0.5);
    velocityX = new PVector(0.5, 0);
    facingdirection = 'd';
    ClimbPosition = 350;
    Input = false;
    MaxSpeed = false;
    IsFalling = true;
    ResVel = false;
    StartJump = false;
    IsForward = false;
    IsBackward = false;
    IsCrouching = false;
    IsJumping = false;
    CanClimb = false;
    CanInput = false;
    IsArc = false;
    CanInteract = false;
    IsUsingLamp = false;
    IsUsingPa = false;
    if (Cenario == "cemiterio") {
      HaveLamp = false;
      HavePa = true;
      HaveFuel = false;
      Fuel = 0;
    } else if (Cenario == "casa") {
      HaveLamp = true;
      HavePa = true;
      HaveFuel = true;
      Fuel = 900;
    } else {
      HaveLamp = false;
      HavePa = false;
      HaveFuel = false;
      Fuel = 0;
    }
    Checkpoint = false;
    CheckY = 0;
    CheckX = 0;
    jumpframe = 0;
    crouchframe = 0;
    moveleftframe = 0;
    moverightframe = 0;
    idleframe = 0;
    interactframe = 0;
    vidas = 5;
    MaximumSpeed = 4;
    delay = 0;
    bar = ((delay / 125) + MaximumSpeed) * 10;
    R = 0;
    G = 255;
    B = 0;
    ResetAnim = 0;
    frame = 0;
    ImagePos = 0;
    ImageTable = 0;
    idlearray = new PImage[1];
    rightarray = new PImage[1];
    leftarray = new PImage[1];
    CurrentLetter = 'x';
    for (int i = 0; i < idlearray.length; i++) {
      idlearray[i] = loadImage("charparado" + i + ".png");
    }
    for (int i = 0; i < rightarray.length; i++) {
      rightarray[i] = loadImage("charcorrendodir" + i + ".png");
    }
    for (int i = 0; i < leftarray.length; i++) {
      leftarray[i] = loadImage("charcorrendoesq" + i + ".png");
    }
    ActualImage = loadImage("char0.png");
    darkness = loadImage("darkness.png");
    cabeca = loadImage("cabeca.png");
    lampiao = loadImage("lampiao.png");
    mask = createGraphics(800, 600);
    mask.beginDraw();
    CharW = 107;
    CharH = 120;
    groundcollision = 560 - CharH;
    HeadStart = new PVector(0, 0);
    HeadEnd = new PVector(0, 0);
    LeftarmStart = new PVector(0, 0);
    LeftarmEnd = new PVector(0, 0);
    RightarmStart = new PVector(0, 0);
    RightarmEnd = new PVector(0, 0);
    TroncoStart = new PVector(0, 0);
    TroncoEnd = new PVector(0, 0);
    LeftlegStart = new PVector(0, 0);
    LeftlegEnd = new PVector(0, 0);
    RightlegStart = new PVector(0, 0);
    RightlegEnd = new PVector(0, 0);
    ImageTable = 0;
    passos = new AudioPlayer[8];
    if (Cenario == "igreja") {
      passos[0] = minim.loadFile("passo0igreja.wav");
      passos[1] = minim.loadFile("passo1igreja.wav");
      passos[2] = minim.loadFile("passo2igreja.wav");
      passos[3] = minim.loadFile("passo3igreja.wav");
      passos[4] = minim.loadFile("passo4igreja.wav");
      passos[5] = minim.loadFile("passo5igreja.wav");
      passos[6] = minim.loadFile("passo6igreja.wav");
      passos[7] = minim.loadFile("passo7igreja.wav");
    } else if (Cenario == "cemiterio") {
      passos[0] = minim.loadFile("passo0cemiterio.wav");
      passos[1] = minim.loadFile("passo1cemiterio.wav");
      passos[2] = minim.loadFile("passo2cemiterio.wav");
      passos[3] = minim.loadFile("passo3cemiterio.wav");
      passos[4] = minim.loadFile("passo4cemiterio.wav");
      passos[5] = minim.loadFile("passo5cemiterio.wav");
      passos[6] = minim.loadFile("passo6cemiterio.wav");
      passos[7] = minim.loadFile("passo7cemiterio.wav");
    } else if (Cenario == "casa") {
      passos[0] = minim.loadFile("passo0casa.wav");
      passos[1] = minim.loadFile("passo1casa.wav");
      passos[2] = minim.loadFile("passo2casa.wav");
      passos[3] = minim.loadFile("passo3casa.wav");
      passos[4] = minim.loadFile("passo4casa.wav");
      passos[5] = minim.loadFile("passo5casa.wav");
      passos[6] = minim.loadFile("passo6casa.wav");
      passos[7] = minim.loadFile("passo7casa.wav");
    }
    psounds = new AudioPlayer[7];
    psounds[0] = minim.loadFile("aplamp.wav");
    psounds[1] = minim.loadFile("aslamp.wav");
    psounds[2] = minim.loadFile("pa.wav");
    psounds[3] = minim.loadFile("escada.wav");
    psounds[4] = minim.loadFile("hit.wav");
    psounds[5] = minim.loadFile("death.wav");
    psounds[6] = minim.loadFile("pulo.wav");
  }

  void TickPlayer() {
    CharacterSetup();
    if (!IsInTutorial) {
      Gravity();
      KeepVelocity();
      LockWindow();
      UpdateImage();
      TrackClimbMovement();
      if (Input == true && CanInput) {
        if (!IsUsingPa && !IsCrouching) {
          Directions();
        }
      } else {
        RecoverStamina();
      }
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  //StartCharacter
  void CharacterSetup() {
    if (!IsPuzzleInteracting) {
      if (HaveLamp) {
        if (!IsUsingLamp) {
          image(darkness, 0, 0);
          mask.background(255);
          mask.fill(0);
          mask.ellipse((int)location.x + 50, (int)location.y + 50, 400, 400);
          darkness.mask(mask);
        }
        fill(0, 0, 255);
        image(lampiao, 0, 20, 20, 20);
        rect(20, 20, ((float)Fuel / (float)900) * 70 * 4, 20);
        fill(255);
        if (IsUsingLamp) {
          if (Fuel > 0) {
            Fuel--;
          } else {
            IsUsingLamp = false;
            HaveFuel = false;
          }
        }
      }
      image(ActualImage.get(ImageTable, ImagePos, CharW, CharH), location.x, location.y, CharW, CharH);
    }
    bar = (((float)delay / (float)125) + MaximumSpeed) * 70;
    if (MaximumSpeed >= 4) {
      R = 0;
      G = 255;
      B = 0;
    }
    if (MaximumSpeed >= 3 && MaximumSpeed < 4) {
      R = 255;
      G = 255;
      B = 0;
    }
    if (MaximumSpeed <= 2) {
      R = 255;
      G = 0;
      B = 0;
    }
    fill(R, G, B);
    image(cabeca, 0, 0, 20, 20);
    rect(20, 0, bar, 20);
    fill(255);
    image(cabeca, 740, 0, 20, 20);
    textFont(fonte, 16);
    text("x "+ vidas, 770, 15);
  }
  void RecoverStamina() {
    if (delay < 125 && MaximumSpeed < 4) {
      delay++;
    } else {
      if (MaximumSpeed < 4) {
        MaximumSpeed++;
        delay = 0;
      }
    }
  }
  //StayGravity
  void Gravity() {
    if (location.y < groundcollision && CanClimb == false) {
      if (IsArc == false) {
        velocityUP.set(0, 0.5);
        location.add(velocityY);
        velocityY.add(gravity);
        IsFalling = true;
      } else {
        velocityY.set(0, 0);
      }
    } else {
      if (IsFalling == true) {
        if (IsArc == false) {
          location.set(location.x, groundcollision);
          velocityY.set(0, 0.5);
          IsFalling = false;
        }
      } else {
        velocityY.set(0, 0);
      }
    }
  }

  //LockVelocity
  void KeepVelocity() {
    if (velocityX.x >= MaximumSpeed || velocityX.x <= -MaximumSpeed) {
      MaxSpeed = true;
    } else {
      MaxSpeed = false;
    }
  }
  void ResetXVelocity() {
    if (ResVel == false) {
      velocityX = new PVector(0.5, 0);
      ResVel = true;
    }
  }

  //AddMovement

  void Directions() {
    if (IsForward == true && IsBackward == false && IsArc == false) {
      facingdirection = 'd';
      if (location.x < (800 - CharW) || Local < UltimoCenario) {
        if (MaxSpeed == false || facingdirection == 'a') {
          location.add(velocityX.x, 0);
          velocityX.add(forwardvelocity);
        } else {
          location.add(velocityX.x, 0);
          ResVel = false;
        }
      }
    }
    if (IsBackward == true && IsForward == false && IsArc == false) {
      facingdirection = 'a';
      if (location.x > -CharW || Local > 0) {
        if (MaxSpeed == false || facingdirection == 'd') {
          location.add(velocityX.x, 0);
          velocityX.add(backwardvelocity);
        } else {
          location.add(velocityX.x, 0);
          ResVel = false;
        }
      }
    }
    if (IsJumping == true) {
      if (!psounds[6].isPlaying() && !IsFalling) {
        psounds[6].rewind();
        psounds[6].play();
      }
      if (IsFalling == false ) {
        IsFalling = true;
        if (velocityUP.y < -2.9) {
          velocityUP.y = -2.9;
        }
        location.add(0, velocityUP.y);
        velocityUP.add(jump);
        velocityY.set(velocityUP);
      }
    }
  }
  //ResetLocation
  void LockWindow() {
    if (Cenario == "igreja") {
      if (location.x >= 801) {
        if (CurrentLetter == 'x' && Local < UltimoCenario - 1) {
          location.x = -CharW;
          Local++;
          if (Local >= 4) {
            LocalY = (Local - 4) / 2;
          }
        } else if (CurrentLetter == 'y' && LocalY < UltimoY) {
          location.x = -CharW;
          Local = Local + 2;
          LocalY++;
        } else if (CurrentLetter == 'x' && Local == UltimoCenario - 1) {
          location.x = 800;
        }
      } else if (location.x <= -CharW -1 && Local > 0) {
        if (CurrentLetter == 'x' && Local > 0) {
          location.x = 800;
          Local--;
          if (Local <= 19) {
            LocalY = (Local - 4) / 2;
          }
        } else if (CurrentLetter == 'y' && LocalY > 0) {
          location.x = 800;
          Local = Local - 2;
          LocalY--;
        }
      }
    } else if (Cenario == "cemiterio") {
      if (Local == 0 && CurrentLetter == 'x') {
        if (location.x <= 400) {
          location.x = 401;
        }
      }
      if (location.x >= 801) {
        if (CurrentLetter == 'x' && Local < UltimoCenario - 1) {
          location.x = -CharW;
          Local++;
          LocalY = LocalY + 2;
        } else if (CurrentLetter == 'y' && LocalY < UltimoY) {
          location.x = -CharW;
          LocalY++;
          if (LocalY >= 4) {
            Local = (LocalY - 4) / 2;
          }
        } else if (CurrentLetter == 'x' && Local == UltimoCenario - 1) {
          location.x = 800;
        }
      } else if (location.x <= -CharW -1) {
        if (CurrentLetter == 'x' && Local > 0) {
          location.x = 800;
          Local--;
          LocalY = LocalY - 2;
        } else if (CurrentLetter == 'y' && LocalY > 0) {
          location.x = 800;
          LocalY--;
          if (Local <= 19) {
            Local = (LocalY - 4) / 2;
          }
        }
      }
    } else if (Cenario == "casa") {
      if (Local == 0 && CurrentLetter == 'x') {
        if (location.x <= 400) {
          location.x = 401;
        }
      }
      if (location.x >= 801) {
        if (CurrentLetter == 'x' && Local < UltimoCenario - 1) {
          location.x = -CharW;
          Local++;
          LocalY = LocalY + 2;
        } else if (CurrentLetter == 'y' && LocalY < UltimoY) {
          location.x = -CharW;
          LocalY++;
          if (LocalY >= 4) {
            Local = (LocalY - 4) / 2;
          }
        } else if (CurrentLetter == 'x' && Local == UltimoCenario - 1) {
          location.x = 800;
        }
      } else if (location.x <= -CharW -1) {
        if (CurrentLetter == 'x' && Local > 0) {
          location.x = 800;
          Local--;
          LocalY = LocalY - 2;
        } else if (CurrentLetter == 'y' && LocalY > 0) {
          location.x = 800;
          LocalY--;
          if (Local <= 19) {
            Local = (LocalY - 4) / 2;
          }
        }
      }
    }
    if (CurrentLetter == 'y' && Cenario != "igreja") {
      if (Cenario == "cemiterio") {
        if (LocalY != 19) {
          if (!CanClimb && location.y > 514 - CharH) {
            location.y = 514 - CharH;
          }
        }
      } else {
        if (!CanClimb && location.y > 514 - CharH) {
          location.y = 514 - CharH;
        }
      }
    }
    if (CanClimb == true && CurrentLetter == 'x') {
      if (location.y + CharH < 0) {
        CurrentLetter = 'y';
        ClimbPosition = 400 + CharH - 10;
      }
    }
    if (CanClimb == true && CurrentLetter == 'y') {
      if (location.y > groundcollision + CharH) {
        CurrentLetter = 'x';
        ClimbPosition = 0 - CharH + 10;
      }
    }
    if (location.x > 800 - CharW && Local == UltimoCenario - 1 && CurrentLetter == 'x') {
      location.x = 800 - CharW - 1;
    }
    if (location.x < 0 && Local == 0 && CurrentLetter == 'x') {
      location.x = 1;
    }
    if (location.x > 800 - CharW && LocalY == UltimoY - 1 && CurrentLetter == 'y') {
      location.x = 800 - CharW - 1;
    }
    if (location.x < 0 && LocalY == 0 && CurrentLetter == 'y') {
      location.x = 1;
    }
    if (Cenario == "igreja") {
      if (CurrentLetter == 'x') {
        if (location.y + CharH > 560) {
          location.y = 560 - CharH;
        }
        if (ClimbPosition + CharH > 560) {
          ClimbPosition = 560 - CharH;
        }
      }
    } else if (Cenario == "cemiterio") {
      if (CurrentLetter == 'x') {
        if (location.y + CharH > 514) {
          location.y = 514 - CharH;
        }
        if (ClimbPosition + CharH > 514) {
          ClimbPosition = 514 - CharH;
        }
      } else {
        if (CanClimb == false && location.y > 600) {
          CurrentLetter = 'x';
          location.y = 0 - CharH + 10;
          Fundo.VarStructure[Fundo.VarStructure.length - 1].lock = true;
          p.groundcollision = 514 - CharH;
        }
      }
    } else if (Cenario == "casa") {
      if (CurrentLetter == 'x') {
        if (location.y + CharH > 514) {
          location.y = 514 - CharH;
        }
        if (ClimbPosition + CharH > 514) {
          ClimbPosition = 514 - CharH;
        }
      }
    }
    if (CurrentLetter == 'y' && CanClimb == false && location.y > 600 && Cenario == "igreja") {
      GameOver();
    }
  }
  //UpdateImage
  void UpdateImage() {
    if (IsForward == true && IsBackward == false && IsArc == false && !IsFalling && !IsCrouching && !IsUsingLamp) {
      if (frame < 4) {
        frame++;
      } else {
        ImagePos = 0;
        ImageTable += 107;
        frame = 0;
      }
    }
    if (IsForward == false && IsBackward == true && IsArc == false && !IsFalling && !IsCrouching && !IsUsingLamp) {
      if (frame < 4) {
        frame++;
      } else {
        ImagePos = 121;
        ImageTable -= 107;
        frame = 0;
      }
    }
    if (IsFalling && !IsUsingLamp && !IsArc) {
      if (facingdirection == 'd') {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 241;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 375;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsForward == false && IsBackward == false && IsArc == false && !IsFalling && !IsCrouching && !IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 509;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 638;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsForward == true && IsBackward == true && IsArc == false && !IsFalling && !IsCrouching && !IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 509;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 638;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsCrouching && !IsFalling && !IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 767;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 894;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsUsingPa) {
      if (facingdirection == 'd') {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 1021;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 1150;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsForward == true && IsBackward == false && IsArc == false && !IsFalling && !IsCrouching && IsUsingLamp) {
      if (frame < 4) {
        frame++;
      } else {
        ImagePos = 1278;
        ImageTable += 107;
        frame = 0;
      }
    }
    if (IsForward == false && IsBackward == true && IsArc == false && !IsFalling && !IsCrouching && IsUsingLamp) {
      if (frame < 4) {
        frame++;
      } else {
        ImagePos = 1396;
        ImageTable += 107;
        frame = 0;
      }
    }
    if (IsFalling && IsUsingLamp && !IsArc) {
      if (facingdirection == 'd') {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 1514;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 1651;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsForward == false && IsBackward == false && IsArc == false && !IsFalling && !IsCrouching && IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 1789;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 1918;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsForward == true && IsBackward == true && IsArc == false && !IsFalling && !IsCrouching && IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 1789;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 1918;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsCrouching && !IsFalling && IsUsingLamp) {
      if (facingdirection == 'd') {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 2047;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 4) {
          frame++;
        } else {
          ImagePos = 2173;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    if (IsArc) {
      if (facingdirection == 'd') {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 509;
          ImageTable += 107;
          frame = 0;
        }
      } else {
        if (frame < 10) {
          frame++;
        } else {
          ImagePos = 638;
          ImageTable += 107;
          frame = 0;
        }
      }
    }
    //framereset
    if (ImageTable > 749 && ImagePos == 0) {
      ImageTable = 0;
    }
    if (ImageTable < 0 && ImagePos == 121) {
      ImageTable = 749;
    }
    if (ImageTable > 428 && ImagePos == 509) {
      ImageTable = 0;
    }
    if (ImageTable > 428 && ImagePos == 638) {
      ImageTable = 0;
    }
    if (ImageTable > 321 && ImagePos == 767) {
      ImageTable = 321;
    }
    if (ImageTable > 321 && ImagePos == 894) {
      ImageTable = 321;
    }
    if (ImageTable > 321 && ImagePos == 1021) {
      ImageTable = 321;
    }
    if (ImageTable > 321 && ImagePos == 1150) {
      ImageTable = 321;
    }
    if (IsFalling) {
      if (Cenario == "igreja") {
        if (CurrentLetter == 'x') {
          if (location.y < 390) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          } else {
            if (ImageTable < 856) {
              ImageTable = 856;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          }
        }
      } else if (Cenario == "cemiterio") {
        if (CurrentLetter == 'x') {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          }
        }
      } else if (Cenario == "casa") {
        if (CurrentLetter == 'x') {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 241) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 375) {
              ImageTable = 321;
            }
          }
        }
      }
      if (ImageTable > 1070) {
        ImageTable = 0;
      }
    }
    if (ImageTable > 749 && ImagePos == 1278) {
      ImageTable = 0;
    }
    if (ImageTable > 749 && ImagePos == 1396) {
      ImageTable = 0;
    }
    if (ImageTable > 428 && ImagePos == 1789) {
      ImageTable = 0;
    }
    if (ImageTable > 428 && ImagePos == 1918) {
      ImageTable = 0;
    }
    if (ImageTable > 321 && ImagePos == 2047) {
      ImageTable = 321;
    }
    if (ImageTable > 321 && ImagePos == 2173) {
      ImageTable = 321;
    }
    if (IsFalling) {
      if (Cenario == "igreja") {
        if (CurrentLetter == 'x') {
          if (location.y < 390) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          } else {
            if (ImageTable < 856) {
              ImageTable = 856;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          }
        }
      } else if (Cenario == "cemiterio") {
        if (CurrentLetter == 'x') {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          }
        }
      } else if (Cenario == "casa") {
        if (CurrentLetter == 'x') {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          }
        } else {
          if (location.y < 314) {
            if (ImageTable > 749 && ImagePos == 1514) {
              ImageTable = 321;
            }
            if (ImageTable > 749 && ImagePos == 1651) {
              ImageTable = 321;
            }
          }
        }
      }
    }
    CharW = 107;
    CharH = 120;
    //coll
    if (ImagePos == 0 && ImageTable == 0) {
      HeadStart = new PVector(73, 0);
      HeadEnd = new PVector(105, 42);
      LeftarmStart = new PVector(71, 43);
      LeftarmEnd = new PVector(101, 60);
      RightarmStart = new PVector(24, 41);
      RightarmEnd = new PVector(39, 60);
      TroncoStart = new PVector(38, 28);
      TroncoEnd = new PVector(77, 81);
      LeftlegStart = new PVector(1, 81);
      LeftlegEnd = new PVector(48, 105);
      RightlegStart = new PVector(71, 81);
      RightlegEnd = new PVector(106, 109);
    }
    if (ImagePos == 0 && ImageTable == 107) {
      HeadStart = new PVector(69, 0);
      HeadEnd = new PVector(101, 42);
      LeftarmStart = new PVector(72, 63);
      LeftarmEnd = new PVector(84, 76);
      RightarmStart = new PVector(36, 33);
      RightarmEnd = new PVector(69, 77);
      TroncoStart = new PVector(35, 26);
      TroncoEnd = new PVector(72, 80);
      LeftlegStart = new PVector(4, 80);
      LeftlegEnd = new PVector(52, 100);
      RightlegStart = new PVector(56, 80);
      RightlegEnd = new PVector(85, 120);
    }
    if (ImagePos == 0 && ImageTable == 214) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(61, 3);
      HeadEnd = new PVector(93, 45);
      LeftarmStart = new PVector(13, 83);
      LeftarmEnd = new PVector(64, 83);
      RightarmStart = new PVector(13, 83);
      RightarmEnd = new PVector(64, 83);
      TroncoStart = new PVector(28, 29);
      TroncoEnd = new PVector(64, 83);
      LeftlegStart = new PVector(13, 83);
      LeftlegEnd = new PVector(28, 108);
      RightlegStart = new PVector(25, 83);
      RightlegEnd = new PVector(54, 120);
    }
    if (ImagePos == 0 && ImageTable == 321) {
      HeadStart = new PVector(69, 3);
      HeadEnd = new PVector(121, 45);
      LeftarmStart = new PVector(27, 56);
      LeftarmEnd = new PVector(31, 72);
      RightarmStart = new PVector(72, 62);
      RightarmEnd = new PVector(90, 75);
      TroncoStart = new PVector(35, 29);
      TroncoEnd = new PVector(72, 72);
      LeftlegStart = new PVector(9, 85);
      LeftlegEnd = new PVector(35, 117);
      RightlegStart = new PVector(35, 85);
      RightlegEnd = new PVector(65, 120);
    }
    if (ImagePos == 0 && ImageTable == 428) {
      HeadStart = new PVector(74, 3);
      HeadEnd = new PVector(107, 45);
      LeftarmStart = new PVector(28, 40);
      LeftarmEnd = new PVector(41, 58);
      RightarmStart = new PVector(0, 0);
      RightarmEnd = new PVector(0, 0);
      TroncoStart = new PVector(41, 28);
      TroncoEnd = new PVector(78, 69);
      LeftlegStart = new PVector(69, 84);
      LeftlegEnd = new PVector(103, 113);
      RightlegStart = new PVector(0, 69);
      RightlegEnd = new PVector(41, 91);
    }
    if (ImagePos == 0 && ImageTable == 535) {
      HeadStart = new PVector(66, 5);
      HeadEnd = new PVector(98, 47);
      LeftarmStart = new PVector(35, 30);
      LeftarmEnd = new PVector(69, 79);
      RightarmStart = new PVector(69, 61);
      RightarmEnd = new PVector(83, 75);
      TroncoStart = new PVector(35, 30);
      TroncoEnd = new PVector(69, 79);
      LeftlegStart = new PVector(53, 79);
      LeftlegEnd = new PVector(85, 120);
      RightlegStart = new PVector(5, 79);
      RightlegEnd = new PVector(53, 102);
    }
    if (ImagePos == 0 && ImageTable == 642) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(63, 0);
      HeadEnd = new PVector(96, 41);
      LeftarmStart = new PVector(31, 25);
      LeftarmEnd = new PVector(67, 68);
      RightarmStart = new PVector(31, 25);
      RightarmEnd = new PVector(67, 68);
      TroncoStart = new PVector(31, 25);
      TroncoEnd = new PVector(67, 68);
      LeftlegStart = new PVector(28, 68);
      LeftlegEnd = new PVector(54, 120);
      RightlegStart = new PVector(54, 68);
      RightlegEnd = new PVector(66, 88);
    }
    if (ImagePos == 0 && ImageTable == 749) {
      HeadStart = new PVector(62, 0);
      HeadEnd = new PVector(94, 41);
      LeftarmStart = new PVector(65, 52);
      LeftarmEnd = new PVector(86, 61);
      RightarmStart = new PVector(28, 25);
      RightarmEnd = new PVector(65, 67);
      TroncoStart = new PVector(28, 25);
      TroncoEnd = new PVector(65, 67);
      LeftlegStart = new PVector(11, 67);
      LeftlegEnd = new PVector(45, 120);
      RightlegStart = new PVector(53, 67);
      RightlegEnd = new PVector(79, 115);
    }
    if (ImagePos == 1278 && ImageTable == 0) {
      HeadStart = new PVector(73, 0);
      HeadEnd = new PVector(105, 42);
      LeftarmStart = new PVector(71, 43);
      LeftarmEnd = new PVector(101, 60);
      RightarmStart = new PVector(24, 41);
      RightarmEnd = new PVector(39, 60);
      TroncoStart = new PVector(38, 28);
      TroncoEnd = new PVector(77, 81);
      LeftlegStart = new PVector(1, 81);
      LeftlegEnd = new PVector(48, 105);
      RightlegStart = new PVector(71, 81);
      RightlegEnd = new PVector(106, 109);
    }
    if (ImagePos == 1278 && ImageTable == 107) {
      HeadStart = new PVector(69, 0);
      HeadEnd = new PVector(101, 42);
      LeftarmStart = new PVector(72, 63);
      LeftarmEnd = new PVector(84, 76);
      RightarmStart = new PVector(36, 33);
      RightarmEnd = new PVector(69, 77);
      TroncoStart = new PVector(35, 26);
      TroncoEnd = new PVector(72, 80);
      LeftlegStart = new PVector(4, 80);
      LeftlegEnd = new PVector(52, 100);
      RightlegStart = new PVector(56, 80);
      RightlegEnd = new PVector(85, 120);
    }
    if (ImagePos == 1278 && ImageTable == 214) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(61, 3);
      HeadEnd = new PVector(93, 45);
      LeftarmStart = new PVector(13, 83);
      LeftarmEnd = new PVector(64, 83);
      RightarmStart = new PVector(13, 83);
      RightarmEnd = new PVector(64, 83);
      TroncoStart = new PVector(28, 29);
      TroncoEnd = new PVector(64, 83);
      LeftlegStart = new PVector(13, 83);
      LeftlegEnd = new PVector(28, 108);
      RightlegStart = new PVector(25, 83);
      RightlegEnd = new PVector(54, 120);
    }
    if (ImagePos == 1278 && ImageTable == 321) {
      HeadStart = new PVector(69, 3);
      HeadEnd = new PVector(121, 45);
      LeftarmStart = new PVector(27, 56);
      LeftarmEnd = new PVector(31, 72);
      RightarmStart = new PVector(72, 62);
      RightarmEnd = new PVector(90, 75);
      TroncoStart = new PVector(35, 29);
      TroncoEnd = new PVector(72, 72);
      LeftlegStart = new PVector(9, 85);
      LeftlegEnd = new PVector(35, 117);
      RightlegStart = new PVector(35, 85);
      RightlegEnd = new PVector(65, 120);
    }
    if (ImagePos == 1278 && ImageTable == 428) {
      HeadStart = new PVector(74, 3);
      HeadEnd = new PVector(107, 45);
      LeftarmStart = new PVector(28, 40);
      LeftarmEnd = new PVector(41, 58);
      RightarmStart = new PVector(0, 0);
      RightarmEnd = new PVector(0, 0);
      TroncoStart = new PVector(41, 28);
      TroncoEnd = new PVector(78, 69);
      LeftlegStart = new PVector(69, 84);
      LeftlegEnd = new PVector(103, 113);
      RightlegStart = new PVector(0, 69);
      RightlegEnd = new PVector(41, 91);
    }
    if (ImagePos == 1278 && ImageTable == 535) {
      HeadStart = new PVector(66, 5);
      HeadEnd = new PVector(98, 47);
      LeftarmStart = new PVector(35, 30);
      LeftarmEnd = new PVector(69, 79);
      RightarmStart = new PVector(69, 61);
      RightarmEnd = new PVector(83, 75);
      TroncoStart = new PVector(35, 30);
      TroncoEnd = new PVector(69, 79);
      LeftlegStart = new PVector(53, 79);
      LeftlegEnd = new PVector(85, 120);
      RightlegStart = new PVector(5, 79);
      RightlegEnd = new PVector(53, 102);
    }
    if (ImagePos == 1278 && ImageTable == 642) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(63, 0);
      HeadEnd = new PVector(96, 41);
      LeftarmStart = new PVector(31, 25);
      LeftarmEnd = new PVector(67, 68);
      RightarmStart = new PVector(31, 25);
      RightarmEnd = new PVector(67, 68);
      TroncoStart = new PVector(31, 25);
      TroncoEnd = new PVector(67, 68);
      LeftlegStart = new PVector(28, 68);
      LeftlegEnd = new PVector(54, 120);
      RightlegStart = new PVector(54, 68);
      RightlegEnd = new PVector(66, 88);
    }
    if (ImagePos == 1278 && ImageTable == 749) {
      HeadStart = new PVector(62, 0);
      HeadEnd = new PVector(94, 41);
      LeftarmStart = new PVector(65, 52);
      LeftarmEnd = new PVector(86, 61);
      RightarmStart = new PVector(28, 25);
      RightarmEnd = new PVector(65, 67);
      TroncoStart = new PVector(28, 25);
      TroncoEnd = new PVector(65, 67);
      LeftlegStart = new PVector(11, 67);
      LeftlegEnd = new PVector(45, 120);
      RightlegStart = new PVector(53, 67);
      RightlegEnd = new PVector(79, 115);
    }
    if (ImagePos == 121 && ImageTable == 0) {
      HeadStart = new PVector(2, 0);
      HeadEnd = new PVector(30, 42);
      LeftarmStart = new PVector(7, 43);
      LeftarmEnd = new PVector(28, 60);
      RightarmStart = new PVector(68, 41);
      RightarmEnd = new PVector(83, 60);
      TroncoStart = new PVector(31, 28);
      TroncoEnd = new PVector(68, 81);
      LeftlegStart = new PVector(1, 67);
      LeftlegEnd = new PVector(37, 105);
      RightlegStart = new PVector(68, 81);
      RightlegEnd = new PVector(106, 109);
    }
    if (ImagePos == 121 && ImageTable == 107) {
      HeadStart = new PVector(13, 0);
      HeadEnd = new PVector(45, 42);
      LeftarmStart = new PVector(21, 63);
      LeftarmEnd = new PVector(42, 76);
      RightarmStart = new PVector(42, 26);
      RightarmEnd = new PVector(77, 80);
      TroncoStart = new PVector(42, 26);
      TroncoEnd = new PVector(77, 80);
      LeftlegStart = new PVector(28, 80);
      LeftlegEnd = new PVector(54, 100);
      RightlegStart = new PVector(62, 80);
      RightlegEnd = new PVector(95, 120);
    }
    if (ImagePos == 121 && ImageTable == 214) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(11, 3);
      HeadEnd = new PVector(44, 45);
      LeftarmStart = new PVector(40, 29);
      LeftarmEnd = new PVector(76, 83);
      RightarmStart = new PVector(40, 29);
      RightarmEnd = new PVector(76, 83);
      TroncoStart = new PVector(40, 29);
      TroncoEnd = new PVector(76, 83);
      LeftlegStart = new PVector(41, 83);
      LeftlegEnd = new PVector(53, 108);
      RightlegStart = new PVector(53, 83);
      RightlegEnd = new PVector(80, 120);
    }
    if (ImagePos == 121 && ImageTable == 321) {
      HeadStart = new PVector(9, 3);
      HeadEnd = new PVector(41, 45);
      LeftarmStart = new PVector(21, 56);
      LeftarmEnd = new PVector(38, 72);
      RightarmStart = new PVector(39, 29);
      RightarmEnd = new PVector(74, 72);
      TroncoStart = new PVector(39, 29);
      TroncoEnd = new PVector(74, 72);
      LeftlegStart = new PVector(22, 85);
      LeftlegEnd = new PVector(51, 117);
      RightlegStart = new PVector(55, 85);
      RightlegEnd = new PVector(102, 120);
    }
    if (ImagePos == 121 && ImageTable == 428) {
      HeadStart = new PVector(0, 3);
      HeadEnd = new PVector(33, 45);
      LeftarmStart = new PVector(5, 40);
      LeftarmEnd = new PVector(29, 58);
      RightarmStart = new PVector(66, 40);
      RightarmEnd = new PVector(84, 59);
      TroncoStart = new PVector(29, 28);
      TroncoEnd = new PVector(66, 69);
      LeftlegStart = new PVector(3, 84);
      LeftlegEnd = new PVector(29, 113);
      RightlegStart = new PVector(66, 69);
      RightlegEnd = new PVector(107, 91);
    }
    if (ImagePos == 121 && ImageTable == 535) {
      HeadStart = new PVector(6, 5);
      HeadEnd = new PVector(38, 47);
      LeftarmStart = new PVector(17, 30);
      LeftarmEnd = new PVector(35, 79);
      RightarmStart = new PVector(35, 30);
      RightarmEnd = new PVector(71, 79);
      TroncoStart = new PVector(35, 30);
      TroncoEnd = new PVector(71, 79);
      LeftlegStart = new PVector(42, 79);
      LeftlegEnd = new PVector(74, 120);
      RightlegStart = new PVector(74, 79);
      RightlegEnd = new PVector(98, 102);
    }
    if (ImagePos == 121 && ImageTable == 642) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(15, 0);
      HeadEnd = new PVector(45, 41);
      LeftarmStart = new PVector(42, 25);
      LeftarmEnd = new PVector(79, 68);
      RightarmStart = new PVector(0, 25);
      RightarmEnd = new PVector(42, 68);
      TroncoStart = new PVector(79, 25);
      TroncoEnd = new PVector(79, 68);
      LeftlegStart = new PVector(52, 68);
      LeftlegEnd = new PVector(94, 120);
      RightlegStart = new PVector(52, 68);
      RightlegEnd = new PVector(94, 120);
    }
    if (ImagePos == 121 && ImageTable == 749) {
      HeadStart = new PVector(6, 0);
      HeadEnd = new PVector(38, 41);
      LeftarmStart = new PVector(23, 52);
      LeftarmEnd = new PVector(35, 61);
      RightarmStart = new PVector(35, 25);
      RightarmEnd = new PVector(72, 67);
      TroncoStart = new PVector(35, 25);
      TroncoEnd = new PVector(72, 67);
      LeftlegStart = new PVector(23, 67);
      LeftlegEnd = new PVector(51, 120);
      RightlegStart = new PVector(65, 67);
      RightlegEnd = new PVector(103, 115);
    }
    if (ImagePos == 1396 && ImageTable == 0) {
      HeadStart = new PVector(2, 0);
      HeadEnd = new PVector(30, 42);
      LeftarmStart = new PVector(7, 43);
      LeftarmEnd = new PVector(28, 60);
      RightarmStart = new PVector(68, 41);
      RightarmEnd = new PVector(83, 60);
      TroncoStart = new PVector(31, 28);
      TroncoEnd = new PVector(68, 81);
      LeftlegStart = new PVector(1, 67);
      LeftlegEnd = new PVector(37, 105);
      RightlegStart = new PVector(68, 81);
      RightlegEnd = new PVector(106, 109);
    }
    if (ImagePos == 1396 && ImageTable == 107) {
      HeadStart = new PVector(13, 0);
      HeadEnd = new PVector(45, 42);
      LeftarmStart = new PVector(21, 63);
      LeftarmEnd = new PVector(42, 76);
      RightarmStart = new PVector(42, 26);
      RightarmEnd = new PVector(77, 80);
      TroncoStart = new PVector(42, 26);
      TroncoEnd = new PVector(77, 80);
      LeftlegStart = new PVector(28, 80);
      LeftlegEnd = new PVector(54, 100);
      RightlegStart = new PVector(62, 80);
      RightlegEnd = new PVector(95, 120);
    }
    if (ImagePos == 1396 && ImageTable == 214) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(11, 3);
      HeadEnd = new PVector(44, 45);
      LeftarmStart = new PVector(40, 29);
      LeftarmEnd = new PVector(76, 83);
      RightarmStart = new PVector(40, 29);
      RightarmEnd = new PVector(76, 83);
      TroncoStart = new PVector(40, 29);
      TroncoEnd = new PVector(76, 83);
      LeftlegStart = new PVector(41, 83);
      LeftlegEnd = new PVector(53, 108);
      RightlegStart = new PVector(53, 83);
      RightlegEnd = new PVector(80, 120);
    }
    if (ImagePos == 1396 && ImageTable == 321) {
      HeadStart = new PVector(9, 3);
      HeadEnd = new PVector(41, 45);
      LeftarmStart = new PVector(21, 56);
      LeftarmEnd = new PVector(38, 72);
      RightarmStart = new PVector(39, 29);
      RightarmEnd = new PVector(74, 72);
      TroncoStart = new PVector(39, 29);
      TroncoEnd = new PVector(74, 72);
      LeftlegStart = new PVector(22, 85);
      LeftlegEnd = new PVector(51, 117);
      RightlegStart = new PVector(55, 85);
      RightlegEnd = new PVector(102, 120);
    }
    if (ImagePos == 1396 && ImageTable == 428) {
      HeadStart = new PVector(0, 3);
      HeadEnd = new PVector(33, 45);
      LeftarmStart = new PVector(5, 40);
      LeftarmEnd = new PVector(29, 58);
      RightarmStart = new PVector(66, 40);
      RightarmEnd = new PVector(84, 59);
      TroncoStart = new PVector(29, 28);
      TroncoEnd = new PVector(66, 69);
      LeftlegStart = new PVector(3, 84);
      LeftlegEnd = new PVector(29, 113);
      RightlegStart = new PVector(66, 69);
      RightlegEnd = new PVector(107, 91);
    }
    if (ImagePos == 1396 && ImageTable == 535) {
      HeadStart = new PVector(6, 5);
      HeadEnd = new PVector(38, 47);
      LeftarmStart = new PVector(17, 30);
      LeftarmEnd = new PVector(35, 79);
      RightarmStart = new PVector(35, 30);
      RightarmEnd = new PVector(71, 79);
      TroncoStart = new PVector(35, 30);
      TroncoEnd = new PVector(71, 79);
      LeftlegStart = new PVector(42, 79);
      LeftlegEnd = new PVector(74, 120);
      RightlegStart = new PVector(74, 79);
      RightlegEnd = new PVector(98, 102);
    }
    if (ImagePos == 1396 && ImageTable == 642) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(15, 0);
      HeadEnd = new PVector(45, 41);
      LeftarmStart = new PVector(42, 25);
      LeftarmEnd = new PVector(79, 68);
      RightarmStart = new PVector(0, 25);
      RightarmEnd = new PVector(42, 68);
      TroncoStart = new PVector(79, 25);
      TroncoEnd = new PVector(79, 68);
      LeftlegStart = new PVector(52, 68);
      LeftlegEnd = new PVector(94, 120);
      RightlegStart = new PVector(52, 68);
      RightlegEnd = new PVector(94, 120);
    }
    if (ImagePos == 1396 && ImageTable == 749) {
      HeadStart = new PVector(6, 0);
      HeadEnd = new PVector(38, 41);
      LeftarmStart = new PVector(23, 52);
      LeftarmEnd = new PVector(35, 61);
      RightarmStart = new PVector(35, 25);
      RightarmEnd = new PVector(72, 67);
      TroncoStart = new PVector(35, 25);
      TroncoEnd = new PVector(72, 67);
      LeftlegStart = new PVector(23, 67);
      LeftlegEnd = new PVector(51, 120);
      RightlegStart = new PVector(65, 67);
      RightlegEnd = new PVector(103, 115);
    }
    if (ImagePos == 241 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 241 && ImageTable == 107) {
      HeadStart = new PVector(47, 7);
      HeadEnd = new PVector(87, 45);
      LeftarmStart = new PVector(22, 37);
      LeftarmEnd = new PVector(65, 120);
      RightarmStart = new PVector(22, 37);
      RightarmEnd = new PVector(65, 120);
      TroncoStart = new PVector(22, 37);
      TroncoEnd = new PVector(65, 120);
      LeftlegStart = new PVector(22, 37);
      LeftlegEnd = new PVector(65, 120);
      RightlegStart = new PVector(22, 37);
      RightlegEnd = new PVector(65, 120);
    }
    if (ImagePos == 241 && ImageTable == 214) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 241 && ImageTable == 321) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 241 && ImageTable == 428) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(62, 30);
      LeftarmEnd = new PVector(97, 50);
      RightarmStart = new PVector(62, 30);
      RightarmEnd = new PVector(97, 50);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 241 && ImageTable == 535) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 241 && ImageTable == 642) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(62, 30);
      LeftarmEnd = new PVector(97, 50);
      RightarmStart = new PVector(62, 30);
      RightarmEnd = new PVector(97, 50);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 241 && ImageTable == 749) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 241 && ImageTable == 856) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 241 && ImageTable == 963) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 241 && ImageTable == 1070) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1514 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1514 && ImageTable == 107) {
      HeadStart = new PVector(47, 7);
      HeadEnd = new PVector(87, 45);
      LeftarmStart = new PVector(22, 37);
      LeftarmEnd = new PVector(65, 120);
      RightarmStart = new PVector(22, 37);
      RightarmEnd = new PVector(65, 120);
      TroncoStart = new PVector(22, 37);
      TroncoEnd = new PVector(65, 120);
      LeftlegStart = new PVector(22, 37);
      LeftlegEnd = new PVector(65, 120);
      RightlegStart = new PVector(22, 37);
      RightlegEnd = new PVector(65, 120);
    }
    if (ImagePos == 1514 && ImageTable == 214) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1514 && ImageTable == 321) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1514 && ImageTable == 428) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(62, 30);
      LeftarmEnd = new PVector(97, 50);
      RightarmStart = new PVector(62, 30);
      RightarmEnd = new PVector(97, 50);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 1514 && ImageTable == 535) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 1514 && ImageTable == 642) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(62, 30);
      LeftarmEnd = new PVector(97, 50);
      RightarmStart = new PVector(62, 30);
      RightarmEnd = new PVector(97, 50);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 1514 && ImageTable == 749) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 1514 && ImageTable == 856) {
      HeadStart = new PVector(37, 0);
      HeadEnd = new PVector(79, 31);
      LeftarmStart = new PVector(32, 28);
      LeftarmEnd = new PVector(62, 74);
      RightarmStart = new PVector(32, 28);
      RightarmEnd = new PVector(62, 74);
      TroncoStart = new PVector(32, 28);
      TroncoEnd = new PVector(62, 74);
      LeftlegStart = new PVector(45, 67);
      LeftlegEnd = new PVector(75, 89);
      RightlegStart = new PVector(45, 67);
      RightlegEnd = new PVector(75, 89);
    }
    if (ImagePos == 1514 && ImageTable == 963) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1514 && ImageTable == 1070) {
      HeadStart = new PVector(42, 17);
      HeadEnd = new PVector(54, 55);
      LeftarmStart = new PVector(3, 61);
      LeftarmEnd = new PVector(18, 41);
      RightarmStart = new PVector(3, 61);
      RightarmEnd = new PVector(18, 41);
      TroncoStart = new PVector(18, 55);
      TroncoEnd = new PVector(51, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 375 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 375 && ImageTable == 107) {
      HeadStart = new PVector(12, 0);
      HeadEnd = new PVector(51, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 375 && ImageTable == 214) {
      HeadStart = new PVector(0, 17);
      HeadEnd = new PVector(47, 55);
      LeftarmStart = new PVector(73, 61);
      LeftarmEnd = new PVector(88, 41);
      RightarmStart = new PVector(73, 61);
      RightarmEnd = new PVector(88, 41);
      TroncoStart = new PVector(40, 55);
      TroncoEnd = new PVector(72, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 375 && ImageTable == 321) {
      HeadStart = new PVector(0, 17);
      HeadEnd = new PVector(47, 55);
      LeftarmStart = new PVector(73, 61);
      LeftarmEnd = new PVector(88, 41);
      RightarmStart = new PVector(73, 61);
      RightarmEnd = new PVector(88, 41);
      TroncoStart = new PVector(40, 55);
      TroncoEnd = new PVector(72, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 375 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(58, 30);
      LeftarmEnd = new PVector(93, 50);
      RightarmStart = new PVector(58, 30);
      RightarmEnd = new PVector(93, 50);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 375 && ImageTable == 535) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 375 && ImageTable == 642) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(58, 30);
      LeftarmEnd = new PVector(93, 50);
      RightarmStart = new PVector(58, 30);
      RightarmEnd = new PVector(93, 50);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 375 && ImageTable == 749) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 375 && ImageTable == 856) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 375 && ImageTable == 963) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(38, 17);
      HeadEnd = new PVector(50, 55);
      LeftarmStart = new PVector(0, 61);
      LeftarmEnd = new PVector(14, 41);
      RightarmStart = new PVector(0, 61);
      RightarmEnd = new PVector(14, 41);
      TroncoStart = new PVector(14, 55);
      TroncoEnd = new PVector(47, 91);
      LeftlegStart = new PVector(24, 91);
      LeftlegEnd = new PVector(59, 133);
      RightlegStart = new PVector(24, 91);
      RightlegEnd = new PVector(59, 133);
    }
    if (ImagePos == 375 && ImageTable == 1070) {
      HeadStart = new PVector(38, 17);
      HeadEnd = new PVector(50, 55);
      LeftarmStart = new PVector(0, 61);
      LeftarmEnd = new PVector(14, 41);
      RightarmStart = new PVector(0, 61);
      RightarmEnd = new PVector(14, 41);
      TroncoStart = new PVector(14, 55);
      TroncoEnd = new PVector(47, 91);
      LeftlegStart = new PVector(24, 91);
      LeftlegEnd = new PVector(59, 133);
      RightlegStart = new PVector(24, 91);
      RightlegEnd = new PVector(59, 133);
    }
    if (ImagePos == 1651 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1651 && ImageTable == 107) {
      HeadStart = new PVector(12, 0);
      HeadEnd = new PVector(51, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1651 && ImageTable == 214) {
      HeadStart = new PVector(0, 17);
      HeadEnd = new PVector(47, 55);
      LeftarmStart = new PVector(73, 61);
      LeftarmEnd = new PVector(88, 41);
      RightarmStart = new PVector(73, 61);
      RightarmEnd = new PVector(88, 41);
      TroncoStart = new PVector(40, 55);
      TroncoEnd = new PVector(72, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1651 && ImageTable == 321) {
      HeadStart = new PVector(0, 17);
      HeadEnd = new PVector(47, 55);
      LeftarmStart = new PVector(73, 61);
      LeftarmEnd = new PVector(88, 41);
      RightarmStart = new PVector(73, 61);
      RightarmEnd = new PVector(88, 41);
      TroncoStart = new PVector(40, 55);
      TroncoEnd = new PVector(72, 91);
      LeftlegStart = new PVector(28, 91);
      LeftlegEnd = new PVector(63, 133);
      RightlegStart = new PVector(28, 91);
      RightlegEnd = new PVector(63, 133);
    }
    if (ImagePos == 1651 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(58, 30);
      LeftarmEnd = new PVector(93, 50);
      RightarmStart = new PVector(58, 30);
      RightarmEnd = new PVector(93, 50);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(58, 30);
      LeftarmEnd = new PVector(93, 50);
      RightarmStart = new PVector(58, 30);
      RightarmEnd = new PVector(93, 50);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 535) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 642) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(58, 30);
      LeftarmEnd = new PVector(93, 50);
      RightarmStart = new PVector(58, 30);
      RightarmEnd = new PVector(93, 50);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 749) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 856) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(75, 31);
      LeftarmStart = new PVector(28, 28);
      LeftarmEnd = new PVector(58, 74);
      RightarmStart = new PVector(28, 28);
      RightarmEnd = new PVector(58, 74);
      TroncoStart = new PVector(28, 28);
      TroncoEnd = new PVector(58, 74);
      LeftlegStart = new PVector(41, 67);
      LeftlegEnd = new PVector(71, 89);
      RightlegStart = new PVector(41, 67);
      RightlegEnd = new PVector(71, 89);
    }
    if (ImagePos == 1651 && ImageTable == 963) {
      int r = (int)random(passos.length);
      passos[r].rewind();
      passos[r].play();
      HeadStart = new PVector(38, 17);
      HeadEnd = new PVector(50, 55);
      LeftarmStart = new PVector(0, 61);
      LeftarmEnd = new PVector(14, 41);
      RightarmStart = new PVector(0, 61);
      RightarmEnd = new PVector(14, 41);
      TroncoStart = new PVector(14, 55);
      TroncoEnd = new PVector(47, 91);
      LeftlegStart = new PVector(24, 91);
      LeftlegEnd = new PVector(59, 133);
      RightlegStart = new PVector(24, 91);
      RightlegEnd = new PVector(59, 133);
    }
    if (ImagePos == 1651 && ImageTable == 1070) {
      HeadStart = new PVector(38, 17);
      HeadEnd = new PVector(50, 55);
      LeftarmStart = new PVector(0, 61);
      LeftarmEnd = new PVector(14, 41);
      RightarmStart = new PVector(0, 61);
      RightarmEnd = new PVector(14, 41);
      TroncoStart = new PVector(14, 55);
      TroncoEnd = new PVector(47, 91);
      LeftlegStart = new PVector(24, 91);
      LeftlegEnd = new PVector(59, 133);
      RightlegStart = new PVector(24, 91);
      RightlegEnd = new PVector(59, 133);
    }
    if (ImagePos == 1789 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1789 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1021 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 509 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 509 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 509 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 509 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 509 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 638 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 638 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 638 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 638 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 638 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1150 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1150 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1150 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1150 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1150 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1918 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1918 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1918 && ImageTable == 214) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1918 && ImageTable == 321) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 1918 && ImageTable == 428) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 767 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 767 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 767 && ImageTable == 214) {
      HeadStart = new PVector(52, 21);
      HeadEnd = new PVector(86, 59);
      LeftarmStart = new PVector(28, 49);
      LeftarmEnd = new PVector(68, 120);
      RightarmStart = new PVector(28, 49);
      RightarmEnd = new PVector(68, 120);
      TroncoStart = new PVector(28, 49);
      TroncoEnd = new PVector(68, 120);
      LeftlegStart = new PVector(28, 49);
      LeftlegEnd = new PVector(68, 120);
      RightlegStart = new PVector(28, 49);
      RightlegEnd = new PVector(68, 120);
    }
    if (ImagePos == 767 && ImageTable == 321) {
      HeadStart = new PVector(52, 33);
      HeadEnd = new PVector(86, 71);
      LeftarmStart = new PVector(28, 59);
      LeftarmEnd = new PVector(68, 120);
      RightarmStart = new PVector(28, 59);
      RightarmEnd = new PVector(68, 120);
      TroncoStart = new PVector(28, 59);
      TroncoEnd = new PVector(68, 120);
      LeftlegStart = new PVector(28, 59);
      LeftlegEnd = new PVector(68, 120);
      RightlegStart = new PVector(28, 59);
      RightlegEnd = new PVector(68, 120);
    }
    if (ImagePos == 2047 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 2047 && ImageTable == 107) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 2047 && ImageTable == 214) {
      HeadStart = new PVector(52, 21);
      HeadEnd = new PVector(86, 59);
      LeftarmStart = new PVector(28, 49);
      LeftarmEnd = new PVector(68, 120);
      RightarmStart = new PVector(28, 49);
      RightarmEnd = new PVector(68, 120);
      TroncoStart = new PVector(28, 49);
      TroncoEnd = new PVector(68, 120);
      LeftlegStart = new PVector(28, 49);
      LeftlegEnd = new PVector(68, 120);
      RightlegStart = new PVector(28, 49);
      RightlegEnd = new PVector(68, 120);
    }
    if (ImagePos == 2047 && ImageTable == 321) {
      HeadStart = new PVector(52, 33);
      HeadEnd = new PVector(86, 71);
      LeftarmStart = new PVector(28, 59);
      LeftarmEnd = new PVector(68, 120);
      RightarmStart = new PVector(28, 59);
      RightarmEnd = new PVector(68, 120);
      TroncoStart = new PVector(28, 59);
      TroncoEnd = new PVector(68, 120);
      LeftlegStart = new PVector(28, 59);
      LeftlegEnd = new PVector(68, 120);
      RightlegStart = new PVector(28, 59);
      RightlegEnd = new PVector(68, 120);
    }
    if (ImagePos == 894 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 894 && ImageTable == 107) {
      HeadStart = new PVector(32, 0);
      HeadEnd = new PVector(75, 35);
      LeftarmStart = new PVector(31, 35);
      LeftarmEnd = new PVector(72, 131);
      RightarmStart = new PVector(31, 35);
      RightarmEnd = new PVector(72, 131);
      TroncoStart = new PVector(31, 35);
      TroncoEnd = new PVector(71, 131);
      LeftlegStart = new PVector(31, 35);
      LeftlegEnd = new PVector(72, 131);
      RightlegStart = new PVector(31, 35);
      RightlegEnd = new PVector(72, 131);
    }
    if (ImagePos == 894 && ImageTable == 214) {
      HeadStart = new PVector(22, 21);
      HeadEnd = new PVector(56, 59);
      LeftarmStart = new PVector(27, 49);
      LeftarmEnd = new PVector(67, 120);
      RightarmStart = new PVector(27, 49);
      RightarmEnd = new PVector(67, 120);
      TroncoStart = new PVector(27, 49);
      TroncoEnd = new PVector(67, 120);
      LeftlegStart = new PVector(27, 49);
      LeftlegEnd = new PVector(67, 120);
      RightlegStart = new PVector(27, 49);
      RightlegEnd = new PVector(67, 120);
    }
    if (ImagePos == 894 && ImageTable == 321) {
      HeadStart = new PVector(22, 33);
      HeadEnd = new PVector(56, 71);
      LeftarmStart = new PVector(27, 59);
      LeftarmEnd = new PVector(67, 120);
      RightarmStart = new PVector(27, 59);
      RightarmEnd = new PVector(67, 120);
      TroncoStart = new PVector(27, 59);
      TroncoEnd = new PVector(67, 120);
      LeftlegStart = new PVector(27, 59);
      LeftlegEnd = new PVector(67, 120);
      RightlegStart = new PVector(27, 59);
      RightlegEnd = new PVector(67, 120);
    }
    if (ImagePos == 2173 && ImageTable == 0) {
      HeadStart = new PVector(33, 0);
      HeadEnd = new PVector(76, 35);
      LeftarmStart = new PVector(32, 35);
      LeftarmEnd = new PVector(73, 131);
      RightarmStart = new PVector(32, 35);
      RightarmEnd = new PVector(73, 131);
      TroncoStart = new PVector(32, 35);
      TroncoEnd = new PVector(73, 131);
      LeftlegStart = new PVector(32, 35);
      LeftlegEnd = new PVector(73, 131);
      RightlegStart = new PVector(32, 35);
      RightlegEnd = new PVector(73, 131);
    }
    if (ImagePos == 2173 && ImageTable == 107) {
      HeadStart = new PVector(32, 0);
      HeadEnd = new PVector(75, 35);
      LeftarmStart = new PVector(31, 35);
      LeftarmEnd = new PVector(72, 131);
      RightarmStart = new PVector(31, 35);
      RightarmEnd = new PVector(72, 131);
      TroncoStart = new PVector(31, 35);
      TroncoEnd = new PVector(71, 131);
      LeftlegStart = new PVector(31, 35);
      LeftlegEnd = new PVector(72, 131);
      RightlegStart = new PVector(31, 35);
      RightlegEnd = new PVector(72, 131);
    }
    if (ImagePos == 2173 && ImageTable == 214) {
      HeadStart = new PVector(22, 21);
      HeadEnd = new PVector(56, 59);
      LeftarmStart = new PVector(27, 49);
      LeftarmEnd = new PVector(67, 120);
      RightarmStart = new PVector(27, 49);
      RightarmEnd = new PVector(67, 120);
      TroncoStart = new PVector(27, 49);
      TroncoEnd = new PVector(67, 120);
      LeftlegStart = new PVector(27, 49);
      LeftlegEnd = new PVector(67, 120);
      RightlegStart = new PVector(27, 49);
      RightlegEnd = new PVector(67, 120);
    }
    if (ImagePos == 2173 && ImageTable == 321) {
      HeadStart = new PVector(22, 33);
      HeadEnd = new PVector(56, 71);
      LeftarmStart = new PVector(27, 59);
      LeftarmEnd = new PVector(67, 120);
      RightarmStart = new PVector(27, 59);
      RightarmEnd = new PVector(67, 120);
      TroncoStart = new PVector(27, 59);
      TroncoEnd = new PVector(67, 120);
      LeftlegStart = new PVector(27, 59);
      LeftlegEnd = new PVector(67, 120);
      RightlegStart = new PVector(27, 59);
      RightlegEnd = new PVector(67, 120);
    }
  }
  void Restart() {
    if (Cenario == "igreja") {
      CurrentLetter = 'x';
    } else {
      CurrentLetter = 'y';
    }
    location = new PVector(0, 350);
    forwardvelocity = new PVector(0.3, 0);
    backwardvelocity = new PVector(-0.3, 0);
    jump = new PVector(0, -3.3);
    gravity = new PVector(0, 0.2);
    velocityY = new PVector(0, 0.5);
    velocityUP = new PVector(0, 0.5);
    velocityX = new PVector(0.5, 0);
    facingdirection = 'd';
    Input = false;
    MaxSpeed = false;
    IsFalling = true;
    ResVel = false;
    StartJump = false;
    IsForward = false;
    IsBackward = false;
    IsCrouching = false;
    IsJumping = false;
    IsArc = false;
    CanClimb = false;
    CanInput = true;
    CanInteract = false;
    IsUsingLamp = false;
    IsUsingPa = false;
    if (Cenario == "cemiterio") {
      HaveLamp = false;
      HavePa = true;
      HaveFuel = false;
      Fuel = 0;
    } else if (Cenario == "casa") {
      HaveLamp = true;
      HavePa = true;
      HaveFuel = true;
      Fuel = 900;
    } else {
      HaveLamp = false;
      HavePa = false;
      HaveFuel = false;
      Fuel = 0;
    }
    jumpframe = 0;
    crouchframe = 0;
    moveleftframe = 0;
    moverightframe = 0;
    idleframe = 0;
    interactframe = 0;
    MaximumSpeed = 4;
    ResetAnim = 0;
    delay = 0;
    bar = ((delay / 125) + MaximumSpeed) * 10;
    R = 0;
    G = 255;
    B = 0;
    idlearray = new PImage[1];
    rightarray = new PImage[1];
    leftarray = new PImage[1];
    for (int i = 0; i < idlearray.length; i++) {
      idlearray[i] = loadImage("charparado" + i + ".png");
    }
    for (int i = 0; i < rightarray.length; i++) {
      rightarray[i] = loadImage("charcorrendodir" + i + ".png");
    }
    for (int i = 0; i < leftarray.length; i++) {
      leftarray[i] = loadImage("charcorrendoesq" + i + ".png");
    }
    ActualImage = loadImage("char0.png");
    darkness = loadImage("darkness.png");
    mask = createGraphics(800, 600);
    mask.beginDraw();
    CharW = 107;
    CharH = 120;
    groundcollision = 560 - CharH;
    HeadStart = new PVector(0, 0);
    HeadEnd = new PVector(0, 0);
    LeftarmStart = new PVector(0, 0);
    LeftarmEnd = new PVector(0, 0);
    RightarmStart = new PVector(0, 0);
    RightarmEnd = new PVector(0, 0);
    TroncoStart = new PVector(0, 0);
    TroncoEnd = new PVector(0, 0);
    LeftlegStart = new PVector(0, 0);
    LeftlegEnd = new PVector(0, 0);
    RightlegStart = new PVector(0, 0);
    RightlegEnd = new PVector(0, 0);
    passos = new AudioPlayer[8];
    if (Cenario == "igreja") {
      passos[0] = minim.loadFile("passo0igreja.wav");
      passos[1] = minim.loadFile("passo1igreja.wav");
      passos[2] = minim.loadFile("passo2igreja.wav");
      passos[3] = minim.loadFile("passo3igreja.wav");
      passos[4] = minim.loadFile("passo4igreja.wav");
      passos[5] = minim.loadFile("passo5igreja.wav");
      passos[6] = minim.loadFile("passo6igreja.wav");
      passos[7] = minim.loadFile("passo7igreja.wav");
    } else if (Cenario == "cemiterio") {
      passos[0] = minim.loadFile("passo0cemiterio.wav");
      passos[1] = minim.loadFile("passo1cemiterio.wav");
      passos[2] = minim.loadFile("passo2cemiterio.wav");
      passos[3] = minim.loadFile("passo3cemiterio.wav");
      passos[4] = minim.loadFile("passo4cemiterio.wav");
      passos[5] = minim.loadFile("passo5cemiterio.wav");
      passos[6] = minim.loadFile("passo6cemiterio.wav");
      passos[7] = minim.loadFile("passo7cemiterio.wav");
    } else if (Cenario == "casa") {
      passos[0] = minim.loadFile("passo0casa.wav");
      passos[1] = minim.loadFile("passo1casa.wav");
      passos[2] = minim.loadFile("passo2casa.wav");
      passos[3] = minim.loadFile("passo3casa.wav");
      passos[4] = minim.loadFile("passo4casa.wav");
      passos[5] = minim.loadFile("passo5casa.wav");
      passos[6] = minim.loadFile("passo6casa.wav");
      passos[7] = minim.loadFile("passo7casa.wav");
    }
    psounds = new AudioPlayer[7];
    psounds[0] = minim.loadFile("aplamp.wav");
    psounds[1] = minim.loadFile("aslamp.wav");
    psounds[2] = minim.loadFile("pa.wav");
    psounds[3] = minim.loadFile("escada.wav");
    psounds[4] = minim.loadFile("hit.wav");
    psounds[5] = minim.loadFile("death.wav");
    psounds[6] = minim.loadFile("pulo.wav");
  }
  void DrawDebug () {
    rect(location.x + HeadStart.x, location.y + HeadStart.y, HeadEnd.x - HeadStart.x, HeadEnd.y - HeadStart.y);
    rect(location.x + LeftlegStart.x, location.y + LeftlegStart.y, LeftlegEnd.x - LeftlegStart.x, LeftlegEnd.y - LeftlegStart.y);
    rect(location.x + RightlegStart.x, location.y + RightlegStart.y, RightlegEnd.x - RightlegStart.x, RightlegEnd.y - RightlegStart.y);
    rect(location.x + LeftarmStart.x, location.y + LeftarmStart.y, LeftarmEnd.x - LeftarmStart.x, LeftarmEnd.y - LeftarmStart.y);
    rect(location.x + TroncoStart.x, location.y + TroncoStart.y, TroncoEnd.x - TroncoStart.x, TroncoEnd.y - TroncoStart.y);
    rect(location.x + RightarmStart.x, location.y + RightarmStart.y, RightarmEnd.x - RightarmStart.x, RightarmEnd.y - RightarmStart.y);
  }
  void TrackClimbMovement() {
    if (p.ClimbingUp == false && p.ClimbingDown == false) {
      p.InputClimb = false;
      psounds[3].pause();
    }
    if (CanClimb == false) {
      InputClimb = false;
      ClimbingUp = false;
      ClimbingDown = false;
    }
    if (CheckW == true) {
      if (CanClimb == true) {
        InputClimb = true;
        ClimbingUp = true;
      } else {
        IsJumping = true;
        Input = true;
      }
      if (CanClimb == true) {
        if (IsJumping == true) {
          IsJumping = false;
        }
        if (IsFalling == true) {
          IsFalling = false;
        }
      }
    }
    if (CheckW == false) {
      if (CanClimb == false) {
        IsJumping = false;
      } else {
        ClimbingUp = false;
        if (ClimbingDown == false) {
          InputClimb = false;
        }
      }
    }
    if (CheckW == false) {
      if (CanClimb == true) {
        if (InputClimb == false) {
          location.y = ClimbPosition;
        }
      }
    }
    if (CanClimb == false) {
      ClimbPosition = (int)location.y;
    } else {
      velocityY = new PVector(0, 0.5);
      velocityUP = new PVector(0, 0.5);
      if (InputClimb == true) {
        if (ClimbingDown == true) {
          if (CurrentLetter == 'x' && ClimbPosition + CharH < 560 + Fundo.VarStructure[LocalY].Col1.ColH / 2) {
            ClimbPosition = ClimbPosition + 3;
            location.y = ClimbPosition;
          } else if (CurrentLetter == 'y') {
            ClimbPosition = ClimbPosition + 3;
            location.y = ClimbPosition;
          }
        }
      }
      if (CheckW == true) {
        if (InputClimb == true) {
          if (ClimbingUp == true) {
            ClimbPosition = ClimbPosition - 3;
            location.y = ClimbPosition;
            if (!psounds[3].isPlaying()) {
              psounds[3].pause();
              psounds[3].rewind();
              psounds[3].play();
            }
          }
        }
      }
      if (ClimbingDown) {
        if (!psounds[3].isPlaying()) {
          psounds[3].pause();
          psounds[3].rewind();
          psounds[3].play();
        }
      }
    }
  }
}
