class Escada {

  int Location, groundcollision, EscW, EscH, LocalLocal, Skin, compensation;
  boolean detect;
  char Letter;
  PImage Texture;

  Escada (int frame, char digito) {
    EscW = 50;
    EscH = 560;
    Location = 367;
    LocalLocal = frame;
    detect = false;
    Letter = digito;
    if (Cenario == "igreja") {
      if (Letter == 'x') {
        Skin = 0;
        compensation = 120 * 2;
        groundcollision = 560;
      } else if (Letter == 'y') {
        Skin = 1;
        compensation = 0;
        groundcollision = 1110;
      }
    } else if (Cenario == "cemiterio") {
      if (Letter == 'x') {
        Skin = 2;
        compensation = 120 * 2;
        groundcollision = 514;
      } else if (Letter == 'y') {
        Skin = 3;
        compensation = 0;
        groundcollision = 1110;
      }
    } else if (Cenario == "casa") {
      if (Letter == 'x') {
        Skin = 0;
        compensation = 120 * 2;
        groundcollision = 514;
      } else if (Letter == 'y') {
        Skin = 0;
        compensation = 0;
        groundcollision = 1110;
      }
    }
    StartEscada();
  }
  void TickEscada() {
    if (LocalLocal == Local && Letter == 'x') {
      DrawEscada();
      DetectPlayer();
      MakePlayerClimb();
      DetectHog();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
    if (LocalLocal == LocalY && Letter == 'y') {
      DrawEscada();
      DetectPlayer();
      MakePlayerClimb();
      DetectHog();
      if (DebugMode == true) {
        DrawDebug();
      }
    }
  }
  void StartEscada () {
    if (Skin == 0) {
      Texture = loadImage("escadademao0.png");
    } else if (Skin == 1) {
      Texture = loadImage("escadademao0.png");
    } else if (Skin == 2) {
      Texture = loadImage("raiz1.png");
    } else if (Skin == 3) {
      Texture = loadImage("raiz0.png");
    }
    EscW = Texture.width;
    EscH = Texture.height;
  }
  void DrawEscada() {
    image(Texture, Location, groundcollision - EscH, EscW, EscH);
  }
  void DetectPlayer() {
    if (Location <= p.TroncoEnd.x + p.location.x && Location + EscW >= p.location.x + p.TroncoStart.x) {
      if (groundcollision - EscH - compensation <= p.location.y + p.CharH && groundcollision >= p.location.y + p.HeadStart.y) {
        detect = true;
      } else {
        detect = false;
      }
    } else {
      detect = false;
    }
  }
  void MakePlayerClimb() {
    if (detect == true) {
      p.CanClimb = true;
    } else {
      p.CanClimb = false;
    }
  }
  void DetectHog() {
    if (Location <= hog.Hit1End.x - 33 && Location + EscW >= hog.Hit1Start.x + 38) {
      if (hog.CurrentLetter == 'y' && hog.location.y <= 397) {
        hog.CanClimb = false;
      } else {
        hog.CanClimb = true;
      }
    } else {
      hog.CanClimb = false;
    }
  }
  void Restart() {
    detect = false;
  }
  void DrawDebug() {
    rect(Location, groundcollision - EscH, EscW, EscH);
  }
}