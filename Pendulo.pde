class Pendulo {
  PVector origem, bob, StartLoc;
  float armlen, angulo, aAcc, aVel;
  int delay;
  boolean CanGrab;
  PImage rep;
  CusCol Col;
  AudioPlayer Sniff;

  Pendulo(int locx, int locy, int Start, int End) {
    armlen = 500;
    CanGrab = true;
    delay = 35;
    origem = new PVector(locx, locy);
    bob = new PVector(locx, armlen);
    rep = loadImage("pendulo.png");
    StartLoc = new PVector(origem.x, origem.y);
    aVel = 0.02;
    Sniff = minim.loadFile("COrrentes.wav");
  }
  void TickEntity() {
    MoveEntity();
    UpdatePlayerPos();
    DebugMode();
    Sounds();
  }
  void MoveEntity() {
    float gravity = 0.8;
    bob.x = origem.x + armlen * sin(angulo);
    bob.y = origem.y + armlen * cos(angulo);
    aAcc = (-1 * gravity / armlen) * sin(angulo);
    aVel += aAcc;
    angulo+= aVel;
    line(origem.x, origem.y, bob.x, bob.y);
    image(rep, bob.x - 50, bob.y);
    Col = new CusCol((int)bob.x - 50, (int)bob.y, 100, 50);
    Col.TickCollision();
    while (aVel > 0.02) {
      aVel = 0.02;
    }
    while (aVel < -0.02) {
      aVel = -0.02;
    }
  }
  void UpdatePlayerPos() {
    if (p.IsJumping == true) {
      CanGrab = false;
      delay = 35;
    }
    if (delay > 0) {
      delay--;
    } else {
      CanGrab = true;
    }
    if (CanGrab == true) {
      if (p.location.x > bob.x - 100 && p.location.x < bob.x + 100) {
        if (p.location.y < bob.y + 25) {
          p.IsArc = true;
          Sniff.play();
          p.location.x = bob.x - p.CharW / 2;
          p.location.y = bob.y - p.CharH;
        }
      }
    } else {
      p.IsArc = false;
    }
  }
  void Sounds() {
    if (!Sniff.isPlaying()) {
      Sniff.pause();
      Sniff.rewind();
    }
  }
  void Restart() {
    armlen = 500;
    origem = new PVector(StartLoc.x, StartLoc.y);
    bob = new PVector(StartLoc.x, armlen);
    StartLoc = new PVector(origem.x, origem.y);
    aVel = 0.02;
  }
  void DebugMode() {
    if (DebugMode) {
      rect(bob.x - 50, bob.y, 100, 50);
    }
  }
}