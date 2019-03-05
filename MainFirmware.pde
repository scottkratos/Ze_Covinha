//SettingVariables
import ddf.minim.*;
import processing.video.*;
Minim minim;
Movie intro, cutscene1, cutscene2, cutscene3, cutscene4;
Player p;
Corredor hog;
Cenarios Fundo;
int Local = 0, LocalY = 0, MenuFrame = 0, MenuDelay = 0, MusicIndex = 10;
int UltimoCenario = 20, UltimoY = 8, ScreenDelay = 0, CredPos = 0;
String Cenario = "igreja";
boolean DebugMode = false, GodMode = false, IsPuzzleInteracting = false, IsInTutorial = false, IsInCutscene = true, IsInMenu = true, IsCreditos = false, IsInCheck = false;
boolean[] Cutscenes = new boolean[7], Tutoriais = new boolean[7], TutApp = new boolean[Tutoriais.length];
PImage[] TutImg = new PImage[Tutoriais.length];
PImage Menu, Creditos, GameOver;
PFont fonte;
AudioPlayer[] Ambient;
AudioPlayer MenuButton, Pointcheck;

//SetupFunctions&Primitives

void setup() {
  size(800, 600);
  minim = new Minim(this);
  Menu = loadImage("menu.png");
  Creditos = loadImage("creditos.jpg");
  GameOver = loadImage("gameover.jpg");
  intro = new Movie(this, "intro.mp4");
  cutscene1 = new Movie(this, "cutscene1.MP4");
  cutscene2 = new Movie(this, "cutscene1.MP4");
  cutscene3 = new Movie(this, "cutscene3.MP4");
  cutscene4 = new Movie(this, "cutscene4.MP4");
  intro.loop();
  fonte = createFont("Vecna.otf", 32);
  for (int i = 0; i > Cutscenes.length; i++) {
    Cutscenes[i] = false;
  }
  Cutscenes[0] = true;
  Ambient = new AudioPlayer[12];
  Ambient[0] = minim.loadFile("Igreja.wav");
  Ambient[1] = minim.loadFile("IgrejaDejavu.wav");
  Ambient[2] = minim.loadFile("cemiterioo.wav");
  Ambient[3] = minim.loadFile("cemiteriodejavu.wav");
  Ambient[4] = minim.loadFile("CAverna.wav");
  Ambient[5] = minim.loadFile("Cavernadejavu.wav");
  Ambient[6] = minim.loadFile("Casaa.wav");
  Ambient[7] = minim.loadFile("CasaDejavu.wav");
  Ambient[8] = minim.loadFile("Puzzlecorreto_01.wav");
  Ambient[9] = minim.loadFile("PuzzleDejavu_01.wav");
  Ambient[10] = minim.loadFile("MenuMusicota.wav");
  Ambient[11] = minim.loadFile("gameover.wav");
  MenuButton = minim.loadFile("MenuTeclinha.wav");
  Pointcheck = minim.loadFile("Save.wav");
  TutImg[0] = loadImage("tutorial.jpg");
  TutImg[1] = loadImage("interagirpuzzle.jpg");
  TutImg[2] = loadImage("puzzle1.jpg");
  TutImg[3] = loadImage("pa.jpg");
  TutImg[4] = loadImage("puzzle2.jpg");
  TutImg[5] = loadImage("lampiao.jpg");
  TutImg[6] = loadImage("puzzle3.jpg");
}
void draw() {
  Jukebox();
  if (!IsInMenu) {
    if (!IsInCutscene) {
      if (!IsInTutorial) {
        Fundo.TickIgreja();
        hog.TickBot();
        p.TickPlayer();
        CheckCheck();
        TutToPlayer();
      } else {
        for (int i = 0; i < Tutoriais.length; i++) {
          if (i == 0) {
            if (Tutoriais[i]) {
              image(TutImg[i], 0, 0, 800, 600);
            }
          } else if (Tutoriais[i]) {
            image(TutImg[i], 0, 50, 800, 200);
          }
        }
      }
      if (GodMode) {
        p.MaximumSpeed = 4;
        p.Fuel = 900;
      }
    }
  } else {
    if (!MenuButton.isPlaying()) {
      MenuButton.pause();
      MenuButton.rewind();
    }
    if (!IsInCutscene) {
      background(255);
      Jukebox();
      if (!IsCreditos) {
        image(Menu.get(MenuFrame, 0, 500, 986), 265, -40, 270, 680);
        if (MenuDelay == 2) {
          if (MenuFrame >= 1995) {
            MenuFrame = 0;
          } else {
            MenuFrame += 500;
          }
          MenuDelay = 0;
        } else {
          MenuDelay++;
        }
      } else {
        if (ScreenDelay > 0) {
          ScreenDelay--;
        } else {
          CredPos--;
        }
        image(Creditos, 0, CredPos);
        textFont(fonte, 32);
        text("Aperte qualquer tecla para pular", 20, 560);
        if (CredPos == -2400) {
          IsCreditos = false;
        }
      }
    }
  }
  if (Cutscenes[0]) {
    image(intro, 0, 0, 800, 600);
  }
  if (Cutscenes[1]) {
    image(cutscene1, 0, 0, 800, 600);
    textFont(fonte, 32);
    text("Aperte qualquer tecla para pular", 20, 560);
  }
  if (Cutscenes[2]) {
    image(cutscene2, 0, 0, 800, 600);
    textFont(fonte, 32);
    text("Aperte qualquer tecla para pular", 20, 560);
  }
  if (Cutscenes[3]) {
    image(cutscene3, 0, 0, 800, 600);
    textFont(fonte, 32);
    text("Aperte qualquer tecla para pular", 20, 560);
  }
  if (Cutscenes[4]) {
    image(cutscene4, 0, 0, 800, 600);
    textFont(fonte, 32);
    text("Aperte qualquer tecla para pular", 20, 560);
  }
  if (Cutscenes[0]) {
    if (intro.time() > 2.8) {
      IsInCutscene = false;
      Cutscenes[0] = false;
      intro.stop();
    }
  }
  if (Cutscenes[1]) {
    if (cutscene1.time() > 31) {
      IsInCutscene = false;
      Cutscenes[1] = false;
      cutscene1.stop();
      Fundo = new Cenarios(6, UltimoCenario, Cenario, 4);
      p = new Player();
      p.CanInput = true;
      hog = new Corredor();
      IsInMenu = false;
    }
  }
  if (Cutscenes[2]) {
    if (cutscene2.time() > 31) {
      IsInCutscene = false;
      Cutscenes[2] = false;
      cutscene2.stop();
    }
  }
  if (Cutscenes[3]) {
    if (cutscene3.time() > 3.8) {
      IsInCutscene = false;
      Cutscenes[3] = false;
      cutscene3.stop();
      ChangeAmbience("casa", 20, 9);
    }
  }
  if (Cutscenes[4]) {
    if (cutscene4.time() > 6.6) {
      IsInCutscene = false;
      Cutscenes[4] = false;
      cutscene4.stop();
      exit();
    }
  }
  if (Cutscenes[5]) {
    image(GameOver, 0, 0, 800, 600);
  }
  if (Cutscenes[6]) {
    if (ScreenDelay < 0) {
      IsInCutscene = false;
      Cutscenes[6] = false;
      Local = 0;
      LocalY = 0;
      Fundo.Restoration();
      hog.Restart();
      p.Restart();
      Checkpoint();
    } else {
      ScreenDelay--;
      background(125);
      textFont(fonte, 128);
      text("x " + p.vidas, 350, 350);
      image(p.cabeca, 200, 240, 100, 100);
    }
    if (ScreenDelay == 60) {
      p.vidas--;
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}
void GameOver() {
  if (GodMode == false) {
    if (p.vidas > 0) {
      p.psounds[5].rewind();
      p.psounds[5].play();
      Cutscenes[6] = true;
      IsInCutscene = true;
      ScreenDelay = 90;
    } else {
      Cutscenes[5] = true;
      IsInCutscene = true;
    }
  }
}
void ChangeAmbience(String Cen, int Y, int X) {
  Cenario = Cen;
  UltimoY = Y;
  UltimoCenario = X;
  Local = 0;
  LocalY = 0;
  Fundo.ChangeAmb();
  p.Checkpoint = false;
  LocalY = 0;
  Local = 0;
  p.vidas = 5;
  p.Restart();
  hog.Restart();
}
void Checkpoint() {
  if (p.Checkpoint) {
    LocalY = p.CheckY;
    Local = p.CheckX;
  }
}
void CheckCheck() {
  if (Cenario == "igreja") {
    if (Local == 8 && p.CurrentLetter == 'x') {
      p.CheckX = Local;
      p.CheckY = LocalY;
      p.Checkpoint = true;
    }
  } else if (Cenario == "cemiterio") {
    if (LocalY == 8 && p.CurrentLetter == 'y') {
      p.CheckX = Local;
      p.CheckY = LocalY;
      p.Checkpoint = true;
    }
  } else if (Cenario == "casa") {
    if (LocalY == 9 && p.CurrentLetter == 'y') {
      p.CheckX = Local;
      p.CheckY = LocalY;
      p.Checkpoint = true;
    }
  }
  if (p.Checkpoint) {
    if (!IsInCheck) {
      ScreenDelay = 120;
      IsInCheck = true;
    } else {
      if (ScreenDelay > 0) {
        ScreenDelay--;
        fill(255, 0, 0);
        textFont(fonte, 128);
        text("Checkpoint", 100, 160);
        Pointcheck.play();
        fill(255);
      }
    }
  }
}
void TutToPlayer() {
  if (Local == 0 && Cenario == "igreja") {
    if (!TutApp[0]) {
      IsInTutorial = true;
      Tutoriais[0] = true;
    }
  }
  if (Local == 19 && Cenario == "igreja" && p.location.x > 100) {
    if (!TutApp[1]) {
      IsInTutorial = true;
      Tutoriais[1] = true;
    }
  }
  if (Local == 19 && Cenario == "igreja" && p.location.x > 400) {
    if (!TutApp[2]) {
      IsInTutorial = true;
      Tutoriais[2] = true;
    }
  }
  if (LocalY == 0 && Cenario == "cemiterio" && p.location.x > 100) {
    if (!TutApp[3]) {
      IsInTutorial = true;
      Tutoriais[3] = true;
    }
  }
  if (Local == 8 && Cenario == "cemiterio" && p.location.x > 400) {
    if (!TutApp[4]) {
      IsInTutorial = true;
      Tutoriais[4] = true;
    }
  }
  if (LocalY == 0 && Cenario == "casa" && p.location.x > 100) {
    if (!TutApp[5]) {
      IsInTutorial = true;
      Tutoriais[5] = true;
    }
  }
  if (LocalY == 19 && Cenario == "casa" && p.location.x > 400) {
    if (!TutApp[6]) {
      IsInTutorial = true;
      Tutoriais[6] = true;
    }
  }
}
void Jukebox() {
  if (MusicIndex != 11) {
    if (!Ambient[MusicIndex].isPlaying()) {
      Ambient[MusicIndex].pause();
      Ambient[MusicIndex].rewind();
      Ambient[MusicIndex].play();
    }
  }
  for (int i = 0; i < Ambient.length; i++) {
    if  (i != MusicIndex) {
      if (Ambient[i].isPlaying()) {
        Ambient[i].pause();
        Ambient[i].rewind();
      }
    }
  }
  if (!IsInCutscene) {
    if (IsInMenu) {
      MusicIndex = 10;
    } else {
      if (Cenario == "igreja" && Local == 19) {
        if (Fundo.Structure[Local].Base[1].Puzzle1Stop.delay < 1860 / 2) {
          MusicIndex = 9;
        } else {
          MusicIndex = 8;
        }
      } else if (Cenario == "cemiterio" && Local == 8) {
        if (Fundo.Structure[Local].Base[1].Puzzle1Stop.delay < 1800) {
          MusicIndex = 9;
        } else {
          MusicIndex = 8;
        }
      } else if (Cenario == "casa" && LocalY == 19) {
        if (Fundo.VarStructure[LocalY].Base[1].Puzzle1Stop.delay < 1800) {
          MusicIndex = 9;
        } else {
          MusicIndex = 8;
        }
      }
      if (Cenario == "igreja" && Local < 19) {
        if (dist(p.location.x, p.location.y, hog.location.x, hog.location.y) > 1200) {
          MusicIndex = 0;
        } else {
          MusicIndex = 1;
        }
      } else if (Cenario == "cemiterio" && Local < 8) {
        if (p.CurrentLetter == 'y') {
          if (dist(p.location.x, p.location.y, hog.location.x, hog.location.y) > 1200) {
            MusicIndex = 2;
          } else {
            MusicIndex = 3;
          }
        } else {
          if (dist(p.location.x, p.location.y, hog.location.x, hog.location.y) > 1200) {
            MusicIndex = 4;
          } else {
            MusicIndex = 5;
          }
        }
      } else if (Cenario == "casa" && LocalY < 19) {
        if (dist(p.location.x, p.location.y, hog.location.x, hog.location.y) > 1200) {
          MusicIndex = 6;
        } else {
          MusicIndex = 7;
        }
      }
    }
  } else {
    if (Cutscenes[5]) {
      MusicIndex = 11;
      Ambient[MusicIndex].play();
    } else {
      Ambient[MusicIndex].pause();
    }
  }
}
