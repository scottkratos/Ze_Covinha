class Cenarios {

  //variables

  PImage[] BGImage, VariacaoImage;
  PImage BG;
  int StartSec;
  String Cen;
  BGData[] Structure, VarStructure;

  Cenarios (int sprites, int cenarios, String Cena, int second) {
    int maxsprites = sprites, maxcenarios = cenarios;
    Cen = Cena;
    BGImage = new PImage[maxcenarios];
    StartSec = second;
    if (Cenario == "igreja") {
      UltimoY = 8;
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < maxcenarios; i++) {
        int numero;
        numero = (int)random(0, (maxsprites - 1));
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        BGImage[i] = loadImage(Cen+numero+".jpg");
      }
      BGImage[19] = loadImage("igrejapf.jpg");
      for (int i = 0; i < VariacaoImage.length; i++) {
        VariacaoImage[i] = loadImage("igrejacima.jpg");
      }
    } else if (Cen == "cemiterio") {
      maxsprites = 3;
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < maxcenarios; i++) {
        int numero;
        numero = (int)random(0, (maxsprites - 1));
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        VariacaoImage[i] = loadImage(Cen+numero+".jpg");
      }
      for (int i = 0, anterior = -1; i < BGImage.length; i++) {
        int numero;
        numero = (int)random(0, 2);
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
          BGImage[i] = loadImage("cemiteriobaixo"+numero+".jpg");
        }
      }
      BGImage[19] = loadImage("cemiterioburaco.jpg");
    } else if (Cen == "casa") {
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < maxcenarios; i++) {
        int numero;
        numero = (int)random(0, (maxsprites - 1));
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        VariacaoImage[i] = loadImage(Cen+numero+".jpg");
      }
      for (int i = 0, anterior = -1; i < BGImage.length; i++) {
        int numero;
        numero = (int)random(0, 2);
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        BGImage[i] = loadImage("casabaixo"+numero+".jpg");
      }
    }
    CreateData();
  }
  //StartTick
  void TickIgreja() {
    GetCurrentBG();
  }

  //KeepTrackOfBG
  void GetCurrentBG() {
    BG = BGImage[0];
    if (p.CurrentLetter == 'x') {
      BG = BGImage[Local];
    } else if (p.CurrentLetter == 'y') {
      BG = VariacaoImage[LocalY];
    }
    image(BG, 0, 0, width, height);
    if (p.CurrentLetter == 'x') {
      Structure[Local].VTNC();
    }
    if (p.CurrentLetter == 'y') {
      VarStructure[LocalY].VTNC();
    }
  }
  //CreateData
  void CreateData() {
    int maxobj = 0, maxhazards = 1, minhazards = 1;
    Structure = new BGData[BGImage.length];
    VarStructure = new BGData[VariacaoImage.length];
    if (Cenario == "igreja") {
      maxobj = 11;
      maxhazards = 4;
    } else if (Cenario == "cemiterio") {
      maxobj = 0;
      maxhazards = 0;
    } else if (Cenario == "casa") {
      maxobj = 0;
      maxhazards = 0;
    }
    for (int i = 0; i < Structure.length; i++) {
      Structure[i] = new BGData((int)random(1, maxobj), (int)random(minhazards, maxhazards + 1), minhazards, i, 0);
    }
    for (int i = 0; i < VarStructure.length; i++) {
      VarStructure[i] = new BGData(0, 0, 0, i, 1);
    }
  }
  //restorehazards
  void Restoration() {
    for (int i = 0; i < Structure.length; i++) {
      Structure[i].restore();
    }
    for (int i = 0; i < VarStructure.length - 1; i++) {
      VarStructure[i].restore();
    }
  }
  void ChangeAmb() {
    int maxsprites;
    maxsprites = 0;
    if (Cenario == "igreja") {
      maxsprites = 5;
    } else if (Cenario == "cemiterio") {
      maxsprites = 3;
    } else if (Cenario == "casa") {
      maxsprites = 3;
    }
    BGImage = new PImage[UltimoCenario];
    if (Cenario == "igreja") {
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < UltimoY; i++) {
        int numero;
        numero = (int)random(0, (maxsprites));
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        BGImage[i] = loadImage(Cen+numero+".jpg");
      }
      for (int i = 0; i < VariacaoImage.length; i++) {
        VariacaoImage[i] = loadImage("igrejacima.jpg");
      }
    } else if (Cenario == "cemiterio") {
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < UltimoY; i++) {
        int numero;
        numero = (int)random(0, (maxsprites - 1));
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        VariacaoImage[i] = loadImage(Cenario+numero+".png");
      }
      VariacaoImage[19] = loadImage("cemiterioburaco.jpg");
      for (int i = 0, anterior = -1; i < BGImage.length; i++) {
        int numero;
        numero = (int)random(0, 2);
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        BGImage[i] = loadImage(Cenario+"baixo"+numero+".jpg");
      }
      BGImage[0] = loadImage("cemiteriocaminho.jpg");
    } else if (Cenario == "casa") {
      VariacaoImage = new PImage[UltimoY];
      for (int i = 0, anterior = -1; i < UltimoY; i++) {
        int numero;
        numero = (int)random(0, 0);
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        anterior = numero;
        VariacaoImage[i] = loadImage("casa"+numero+".jpg");
      }
      for (int i = 0, anterior = -1; i < BGImage.length; i++) {
        int numero;
        numero = (int)random(0, 2);
        if (numero == anterior) {
          if (numero > 0) {
            --numero;
          } else {
            ++numero;
          }
        }
        BGImage[i] = loadImage("casabaixo"+numero+".jpg");
      }
    }
    CreateData();
  }
}