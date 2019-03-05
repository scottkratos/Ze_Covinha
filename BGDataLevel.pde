class BGData {
  PImage[] FundoObj, KonstantObj;
  int[] Location, KonstantLoc, LocX, LocY, Tab;
  int maxobjects, groundcollision, MaxHazards, MinHazards, ArrayPos, Current, qtt, X, Y, T;
  boolean IsArrayMounted, IsChangingImage, lock;
  DataBase[] Base;
  Escada Stairs1, Stairs2, Stairs3, Stairs4;
  CusCol Col1, Col2, Col3;

  BGData(int maxobjs, int haz, int min, int LocInArray, int XY) {
    FundoObj = new PImage[maxobjs];
    maxobjects = maxobjs;
    groundcollision = 560;
    MaxHazards = haz;
    MinHazards = min;
    ArrayPos = LocInArray;
    Current = XY;
    IsArrayMounted = false;
    IsChangingImage = false;
    CreateRandomObjs();
  }
  //RandomObjects
  void CreateRandomObjs() {
    if (Cenario == "igreja" && Current == 0) {
      //fundo
      int minobjects = 1;
      int Loops = (int)random(minobjects, maxobjects);
      FundoObj = new PImage[Loops];
      int maxsprites = 7, minsprites = 0;
      String prefix = "vela";
      for (int i = 0; i < Loops; i++) {
        int numero;
        numero = (int)random(minsprites, maxsprites);
        FundoObj[i] = loadImage(prefix+numero+".png");
      }
      int Separation, Konst, Start;
      Separation = (int)((width - 20) / Loops);
      Konst = Separation;
      Start = 20;
      Location = new int[FundoObj.length];
      for (int i = 0; i < FundoObj.length; i++) {
        int number;
        number = (int)random(Start, Separation);
        if (number >= 340 && number <= 660) {
          number = 661;
        }
        Location[i] = number;
        Start = number + FundoObj[i].width;
        Separation = Separation + Konst;
      }
      for (int i = 0; i < Location.length; i++) {
        image (FundoObj[i], Location[i], groundcollision - FundoObj[i].height, FundoObj[i].width, FundoObj[i].height);
      }
      prefix = "velaparede";
      KonstantObj = new PImage[2];
      KonstantLoc = new int[KonstantObj.length];
      for (int i = 0; i < KonstantObj.length; i++) {
        int number;
        number = (int)random(0, 2);
        KonstantObj[i] = loadImage(prefix+number+".png");
      }
      KonstantLoc[0] = 170;
      KonstantLoc[1] = 625;
      //ladders
      Stairs1 = new Escada(4, 'x');
      Stairs2 = new Escada(18, 'x');
      //ground
      Col1 = new CusCol(0, 560, 800, 86);
      //entity
      if (ArrayPos == 0) {
        qtt = 0;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 560;
            T = 0;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 560;
            T = 0;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 560;
            T = 0;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 400;
            Y = 560;
            T = 1;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 710;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 250;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 700;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 400;
            Y = 560;
            T = 0;
          } else if (i == 3) {
            X = 250;
            Y = 560;
            T = 1;
          } else if (i == 4) {
            X = 550;
            Y = 560;
            T = 1;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 400;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 700;
            Y = 560;
            T = 0;
          } else if (i == 3) {
            X = 400;
            Y = 495;
            T = 2;
          } else if (i == 4) {
            X = 550;
            Y = 560;
            T = 1;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 7;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 400;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 700;
            Y = 560;
            T = 0;
          } else if (i == 3) {
            X = 100;
            Y = 495;
            T = 2;
          } else if (i == 4) {
            X = 250;
            Y = 560;
            T = 1;
          } else if (i == 5) {
            X = 550;
            Y = 560;
            T = 1;
          } else if (i == 6) {
            X = 700;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 8) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 700;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 385;
            Y = 75;
            T = 5;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 9) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 700;
            Y = 75;
            T = 5;
          } else if (i == 2) {
            X = 400;
            Y = 560;
            T = 0;
          } else if (i == 3) {
            X = 400;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 10) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 700;
            Y = 560;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 11) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 560;
            T = 4;
          } else if (i == 1) {
            X = 600;
            Y = 495;
            T = 2;
          } else if (i == 2) {
            X = 200;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 12) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 500;
            Y = 560;
            T = 4;
          } else if (i == 1) {
            X = 610;
            Y = 75;
            T = 5;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 13) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 400;
            Y = 560;
            T = 3;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 14) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 3;
          } else if (i == 1) {
            X = 600;
            Y = 560;
            T = 3;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 15) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 560;
            T = 3;
          } else if (i == 1) {
            X = 800;
            Y = 560;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 16) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 3;
          } else if (i == 1) {
            X = 400;
            Y = 560;
            T = 0;
          } else if (i == 2) {
            X = 700;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 17) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 560;
            T = 0;
          } else if (i == 1) {
            X = 200;
            Y = 495;
            T = 2;
          } else if (i == 2) {
            X = 700;
            Y = 560;
            T = 3;
          } else if (i == 3) {
            X = 500;
            Y = 560;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 18) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 560;
            T = 4;
          } else if (i == 1) {
            X = 200;
            Y = 495;
            T = 2;
          } else if (i == 2) {
            X = 160;
            Y = 75;
            T = 5;
          } else if (i == 3) {
            X = 600;
            Y = 560;
            T = 3;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 19) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 300;
            T = 10;
          } else if (i == 1) {
            X = 200;
            Y = 20;
            T = 11;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    } else if (Cenario == "igreja" && Current == 1) {
      //ladders
      Stairs3 = new Escada(0, 'y');
      Stairs4 = new Escada(7, 'y');
      //ground
      Col1 = new CusCol(-80, 514, 180, 20);
      Col2 = new CusCol(315, 514, 180, 20);
      Col3 = new CusCol(710, 514, 180, 20);
      KonstantObj = new PImage[3];
      for (int i = 0; i < KonstantObj.length; i++) {
        KonstantObj[i] = loadImage("plataforma.png");
      }
      //entitys
      if (ArrayPos == 0) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 209;
            Y = 495;
            T = 2;
          } else if (i == 1) {
            X = 529;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 0;
            T = 6;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 0;
            T = 6;
          } else if (i == 1) {
            X = 300;
            Y = 350;
            T = 7;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 0;
            T = 6;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 0;
            Y = 514;
            T = 9;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 350;
            T = 7;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 0;
            Y = 514;
            T = 9;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 350;
            T = 8;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 200;
            Y = 495;
            T = 2;
          } else if (i == 3) {
            X = 600;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 0;
            T = 6;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 0;
            Y = 514;
            T = 9;
          } else if (i == 3) {
            X = 360;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 495;
            T = 2;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 0;
            Y = 514;
            T = 9;
          } else if (i == 3) {
            X = 200;
            Y = 495;
            T = 2;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    } else if (Cenario == "cemiterio" && Current == 0) {
      //ladders
      Stairs1 = new Escada(0, 'x');
      //ground
      Col1 = new CusCol(-800, 514, 2400, 300);
      //entity
      if (ArrayPos == 0) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 155;
            T = 14;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 155;
            T = 14;
          } else if (i == 1) {
            X = 500;
            Y = 514;
            T = 22;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 200;
            Y = 155;
            T = 5;
          } else if (i == 3) {
            X = 600;
            Y = 155;
            T = 5;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 22;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 22;
          } else if (i == 2) {
            X = 700;
            Y = 155;
            T = 16;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 0;
          } else if (i == 3) {
            X = 400;
            Y = 155;
            T = 15;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 514;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 200;
            Y = 155;
            T = 14;
          } else if (i == 2) {
            X = 600;
            Y = 155;
            T = 14;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 514;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 155;
            T = 15;
          } else if (i == 1) {
            X = 600;
            Y = 155;
            T = 15;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 514;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 350;
            T = 7;
          } else if (i == 1) {
            X = 200;
            Y = 155;
            T = 14;
          } else if (i == 2) {
            X = 600;
            Y = 155;
            T = 14;
          } else if (i == 3) {
            X = 700;
            Y = 155;
            T = 16;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 8) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 23;
          } else if (i == 1) {
            X = 200;
            Y = 20;
            T = 11;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    } else if (Cenario == "cemiterio" && Current == 1) {
      //ladders
      Stairs3 = new Escada(4, 'y');
      //ground
      if (ArrayPos != 19) {
        Col1 = new CusCol(-800, 514, 2400, 300);
        Col2 = new CusCol(-800, 514, 2400, 300);
        Col3 = new CusCol(-800, 514, 2400, 300);
      } else {
        Col1 = new CusCol(-800, 514, 1022, 86);
        Col2 = new CusCol(596, 514, 820, 86);
        Col3 = new CusCol(596, 514, 820, 86);
      }
      //entitys
      if (ArrayPos == 0) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 514;
            T = 13;
          } else if (i == 1) {
            X = 300;
            Y = 514;
            T = 0;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 3;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 13;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 100;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 700;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 3) {
            X = 250;
            Y = 514;
            T = 1;
          } else if (i == 4) {
            X = 550;
            Y = 514;
            T = 1;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 13;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 13;
          } else if (i == 2) {
            X = 400;
            Y = 514;
            T = 13;
          } else if (i == 3) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 75;
            T = 5;
          } else if (i == 1) {
            X = 600;
            Y = 75;
            T = 5;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 8) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 0;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 9) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 9;
          } else if (i == 1) {
            X = 600;
            Y = 75;
            T = 5;
          } else if (i == 2) {
            X = 200;
            Y = 75;
            T = 5;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 10) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 9;
          } else if (i == 1) {
            X = 200;
            Y = 514;
            T = 9;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 11) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 13;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 13;
          } else if (i == 2) {
            X = 400;
            Y = 514;
            T = 9;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 12) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 1) {
            X = 200;
            Y = 514;
            T = 9;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 9;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 13) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 75;
            T = 12;
          } else if (i == 1) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 14) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 75;
            T = 12;
          } else if (i == 1) {
            X = 600;
            Y = 75;
            T = 12;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 15) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 75;
            T = 12;
          } else if (i == 1) {
            X = 600;
            Y = 75;
            T = 12;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 3) {
            X = 400;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 16) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 800;
            Y = 350;
            T = 7;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 17) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 0;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 13;
          } else if (i == 2) {
            X = 800;
            Y = 350;
            T = 7;
          } else if (i == 3) {
            X = 400;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 18) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 75;
            T = 12;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 0;
          } else if (i == 2) {
            X = 200;
            Y = 514;
            T = 13;
          } else if (i == 3) {
            X = 600;
            Y = 514;
            T = 13;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    } else if (Cenario == "casa" && Current == 0) {
      //collision
      Col1 = new CusCol(-800, 514, 2400, 300);
      Col2 = new CusCol(-800, 514, 2400, 300);
      Col3 = new CusCol(-800, 514, 2400, 300);
      //ladder
      Stairs1 = new Escada(0, 'x');
      Stairs2 = new Escada(7, 'x');
      //entity
      if (ArrayPos == 0) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 514;
            T = 21;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 3) {
            X = 400;
            Y = 155;
            T = 12;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 400;
            Y = 155;
            T = 15;
          } else if (i == 3) {
            X = 400;
            Y = 514;
            T = 21;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 3;
          } else if (i == 2) {
            X = 400;
            Y = 514;
            T = 20;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 3) {
            X = 400;
            Y = 155;
            T = 15;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 700;
            Y = 155;
            T = 16;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 3) {
            X = 300;
            Y = 155;
            T = 12;
          } else if (i == 4) {
            X = 500;
            Y = 155;
            T = 12;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 700;
            Y = 155;
            T = 16;
          } else if (i == 3) {
            X = 800;
            Y = 514;
            T = 19;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    } else if (Cenario == "casa" && Current == 1) {
      //collision
      Col1 = new CusCol(-800, 514, 2400, 300);
      Col2 = new CusCol(-800, 514, 2400, 300);
      Col3 = new CusCol(-800, 514, 2400, 300);
      //ladder
      Stairs3 = new Escada(4, 'y');
      Stairs4 = new Escada(18, 'y');
      //entity
      if (ArrayPos == 0) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 600;
            Y = 514;
            T = 21;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 1) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 2) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 3) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 20;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 4) {
        qtt = 1;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 5) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 3) {
            X = 700;
            Y = 155;
            T = 17;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 6) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 3) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 4) {
            X = 700;
            Y = 155;
            T = 17;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 7) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 3) {
            X = 700;
            Y = 155;
            T = 18;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 8) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 3) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 4) {
            X = 400;
            Y = 514;
            T = 4;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 9) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 10) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 21;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 400;
            Y = 155;
            T = 12;
          } else if (i == 3) {
            X = 700;
            Y = 155;
            T = 18;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 11) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 155;
            T = 12;
          } else if (i == 1) {
            X = 600;
            Y = 155;
            T = 12;
          } else if (i == 2) {
            X = 800;
            Y = 514;
            T = 19;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 12) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 3) {
            X = 800;
            Y = 514;
            T = 4;
          } else if (i == 4) {
            X = 700;
            Y = 155;
            T = 18;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 13) {
        qtt = 4;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 600;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 300;
            Y = 155;
            T = 12;
          } else if (i == 3) {
            X = 500;
            Y = 155;
            T = 12;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 14) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 19;
          } else if (i == 1) {
            X = 400;
            Y = 155;
            T = 12;
          } else if (i == 2) {
            X = 700;
            Y = 155;
            T = 17;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 15) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 19;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 20;
          } else if (i == 2) {
            X = 700;
            Y = 155;
            T = 17;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 16) {
        qtt = 3;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 19;
          } else if (i == 1) {
            X = 200;
            Y = 155;
            T = 12;
          } else if (i == 2) {
            X = 600;
            Y = 155;
            T = 12;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 17) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 800;
            Y = 514;
            T = 19;
          } else if (i == 1) {
            X = 700;
            Y = 155;
            T = 16;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 18) {
        qtt = 5;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 80;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 200;
            Y = 514;
            T = 20;
          } else if (i == 1) {
            X = 400;
            Y = 514;
            T = 21;
          } else if (i == 2) {
            X = 600;
            Y = 514;
            T = 20;
          } else if (i == 3) {
            X = 700;
            Y = 155;
            T = 17;
          } else if (i == 4) {
            X = 100;
            Y = 155;
            T = 18;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      } else if (ArrayPos == 19) {
        qtt = 2;
        LocX = new int[qtt];
        LocY = new int[qtt];
        Tab = new int[qtt];
        Base = new DataBase[qtt];
        X = 100;
        Y = 560;
        T = 0;
        for (int i = 0; i < qtt; i++) {
          if (i == 0) {
            X = 400;
            Y = 514;
            T = 24;
          } else if (i == 1) {
            X = 200;
            Y = 20;
            T = 11;
          }
          LocX[i] = X;
          LocY[i] = Y;
          Tab[i] = T;
          Base[i] = new DataBase(Tab[i], LocX[i], LocY[i], ArrayPos);
          IsArrayMounted = true;
        }
      }
    }
  }
  void VTNC() {
    if (Cenario == "igreja") {
      if (Current == 0) {
        if (ArrayPos != 19) {
          for (int i = 0; i < KonstantObj.length; i++) {
            image (KonstantObj[i], KonstantLoc[i], 240, KonstantObj[i].width, KonstantObj[i].height);
          }
        }
        for (int i = 0; i < Location.length; i++) {
          image (FundoObj[i], Location[i], groundcollision - FundoObj[i].height, FundoObj[i].width, FundoObj[i].height);
        }
        if (IsArrayMounted == true) {
          for (int i = 0; i < Base.length; i++) {
            Base[i].TickData();
          }
        }
      } else if (Current == 1) {
        if (IsArrayMounted == true) {
          for (int i = 0; i < Base.length; i++) {
            Base[i].TickData();
          }
        }
      }
    } else {
      if (Current == 0) {
        if (Local < 8) {
          if (!IsChangingImage) {
            for (int r = 0; r < Tab.length; r++) {
              if (Tab[r] == 0) {
                Base[r].Object.Skin = 6;
                Base[r].Object.Skol = loadImage("cranio.png");
              }
            }
            IsChangingImage = true;
          }
        }
        if (IsArrayMounted == true) {
          for (int i = 0; i < Base.length; i++) {
            Base[i].TickData();
          }
        }
      } else if (Current == 1) {
        if (IsArrayMounted == true) {
          for (int i = 0; i < Base.length; i++) {
            Base[i].TickData();
          }
        }
      }
    }
    if (Current == 0 && Cenario == "igreja") {
      Stairs1.TickEscada();
      Stairs2.TickEscada();
    }
    if (Current == 0 && Cenario == "cemiterio") {
      Stairs1.TickEscada();
    }
    if (Current == 0 && Cenario == "casa") {
      Stairs1.TickEscada();
      Stairs2.TickEscada();
    }
    if (Current == 0) {
      Col1.TickCollision();
      if (Cenario == "igreja") {
        if (Local != 19) {
          p.groundcollision = 440;
        }
      }
    }
    if (Current == 1 && Cenario == "igreja") {
      Stairs3.TickEscada();
      Stairs4.TickEscada();
    }
    if (Current == 1 && Cenario == "cemiterio") {
      Stairs3.TickEscada();
    }
    if (Current == 1 && Cenario == "casa") {
      Stairs3.TickEscada();
      Stairs4.TickEscada();
    }
    if (Current == 1) {
      Col1.TickCollision();
      Col3.TickCollision();
      if (ArrayPos == 0 || ArrayPos == 4 || ArrayPos == 5 || ArrayPos == 7) {
        Col2.TickCollision();
      }
      lock = false;
      if (ArrayPos == 0 || ArrayPos == 4 || ArrayPos == 5 || ArrayPos == 7) {
        if (Col1.SearchR == true && Col1.SearchL == true && lock == false) {
          p.groundcollision = 600;
        } else {
          p.groundcollision = Col1.LocationY - p.CharH;
          lock = true;
        }
        if (Col2.SearchR == true && Col2.SearchL == true && lock == false) {
          p.groundcollision = 600;
        } else {
          p.groundcollision = Col2.LocationY - p.CharH;
          lock = true;
        }
        if (Col3.SearchR == true && Col3.SearchL == true && lock == false) {
          p.groundcollision = 600;
        } else {
          p.groundcollision = Col3.LocationY - p.CharH;
          lock = true;
        }
        if (Col1.SearchR == true && Col1.SearchL == true && Col2.SearchR == true && Col2.SearchL == true && Col3.SearchR == true && Col3.SearchL == true) {
          lock = false;
        }
        if (Cenario == "igreja") {
          if (ArrayPos == 0) {
            image(KonstantObj[1], 800 - KonstantObj[1].width / 2, 514 - KonstantObj[1].height / 2);
            image(KonstantObj[2], 400 - KonstantObj[2].width / 2, 514 - KonstantObj[2].height / 2);
          } else if (ArrayPos == 7) {
            image(KonstantObj[0], 0 - KonstantObj[0].width / 2, 514 - KonstantObj[0].height / 2);
            image(KonstantObj[2], 400 - KonstantObj[2].width / 2, 514 - KonstantObj[2].height / 2);
          } else {
            image(KonstantObj[0], 0 - KonstantObj[0].width / 2, 514 - KonstantObj[0].height / 2);
            image(KonstantObj[1], 800 - KonstantObj[1].width / 2, 514 - KonstantObj[1].height / 2);
            image(KonstantObj[2], 400 - KonstantObj[2].width / 2, 514 - KonstantObj[2].height / 2);
          }
        }
      } else { 
        if (Col1.SearchR == true && Col1.SearchL == true && lock == false) {
          p.groundcollision = 600;
        } else {
          p.groundcollision = Col1.LocationY - p.CharH;
          lock = true;
        }
        if (Col3.SearchR == true && Col3.SearchL == true && lock == false) {
          p.groundcollision = 600;
        } else {
          p.groundcollision = Col3.LocationY - p.CharH;
          lock = true;
        }
        if (Col1.SearchR == true && Col1.SearchL == true && Col2.SearchR == true && Col2.SearchL == true && Col3.SearchR == true && Col3.SearchL == true) {
          lock = false;
        }
        if (Cenario == "igreja") {
          image(KonstantObj[0], 0 - KonstantObj[0].width / 2, 514 - KonstantObj[0].height / 2);
          image(KonstantObj[1], 800 - KonstantObj[1].width / 2, 514 - KonstantObj[1].height / 2);
        }
      }
    }
  }
  void restore() {
    if (Current == 0) {
      Stairs1.Restart();
    }
    if (Current == 1) {
      Stairs3.Restart();
    }
    if (IsArrayMounted == true) {
      for (int i = 0; i < Base.length; i++) {
        Base[i].ResetData();
      }
    }
  }
}