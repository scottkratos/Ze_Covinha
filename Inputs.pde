//Character Related

void keyPressed() {
  if (!IsInMenu && !IsInCutscene && !IsInTutorial) {
    if (p.CanInput == true) {
      if ((int)keyCode != p.ResetAnim && !p.IsCrouching && !p.IsUsingPa) {
        if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
          if (p.ResetAnim != 87 && p.ResetAnim != 38 && p.ResetAnim != 32) {
            if (!p.IsUsingPa) {
              if (!p.IsCrouching) {
                p.ImageTable = 0;
                p.ResetAnim = (int)keyCode;
              }
            }
          }
        } else if (key == 's' || key == 'S' || keyCode == DOWN) {
          if (p.ResetAnim != 83 && p.ResetAnim != 40) {
            if (!p.IsUsingPa) {
              p.ImageTable = 0;
              p.ResetAnim = (int)keyCode;
            }
          }
        } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
          if (p.ResetAnim != 65 && p.ResetAnim != 37) {
            if (!p.IsUsingPa) {
              if (!p.IsCrouching) {
                p.ImageTable = 0;
                p.ResetAnim = (int)keyCode;
              }
            }
          }
        } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
          if (p.ResetAnim != 68 && p.ResetAnim != 39) {
            if (!p.IsUsingPa) {
              if (!p.IsCrouching) {
                p.ImageTable = 0;
                p.ResetAnim = (int)keyCode;
              }
            }
          }
        } else if (key == 'f' || key == 'F') {
          if (p.ResetAnim != 70) {
            if (p.CanInput) {
              if (!p.IsUsingPa) {
                if (p.HaveLamp) {
                  if (p.HaveFuel) {
                    p.ImageTable = 0;
                    p.ResetAnim = (int)keyCode;
                  }
                }
              }
            }
          }
        } else if (key == 'c' || key == 'C') {
          if (p.ResetAnim != 67) {
            if (p.CanInput) {
              if (!p.IsCrouching) {
                if (p.HavePa) {
                  p.ImageTable = 0;
                  p.ResetAnim = (int)keyCode;
                }
              }
            }
          }
        }
      }
      if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
        if (!p.IsCrouching && !p.IsUsingPa) {
          p.CheckW = true;
        }
      } else if (key == 's' || key == 'S' || keyCode == DOWN) {
        if (p.CanClimb == false) {
          if (!p.IsFalling && !p.IsUsingPa) {
            p.IsCrouching = true;
            p.Input = true;
          }
        } else {
          p.InputClimb = true;
          p.ClimbingDown = true;
        }
      } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
        if (!p.IsCrouching && !p.IsUsingPa) {
          p.IsBackward = true;
          p.Input = true;
        }
      } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
        if (!p.IsCrouching && !p.IsUsingPa) {
          p.IsForward = true;
          p.Input = true;
        }
      }
      if (key == 'p' || key == 'P') {
        if (DebugMode == false) {
          DebugMode = true;
        } else {
          DebugMode = false;
        }
      }
      if (key == 'f' || key == 'F') {
        if (p.CanInput) {
          if (!p.IsUsingPa) {
            if (p.HaveLamp) {
              if (p.HaveFuel) {
                if (p.IsUsingLamp) {
                  p.psounds[0].rewind();
                  p.psounds[0].play();
                  p.IsUsingLamp = false;
                } else {
                  p.IsUsingLamp = true;
                  p.psounds[1].rewind();
                  p.psounds[1].play();
                }
              }
            }
          }
        }
      }
      if (key == 'c' || key == 'C') {
        if (p.CanInput) {
          if (!p.IsCrouching && !p.IsFalling) {
            if (p.HavePa) {
              if (p.IsUsingPa) {
                p.IsUsingPa = false;
              } else {
                p.IsUsingPa = true;
                p.IsForward = false;
                p.IsBackward = false;
                p.IsUsingLamp = false;
              }
            }
          }
        }
      }
    }
    if (key == 'e' || key == 'E') {
      if (p.CanInteract) {
        if (Cenario == "igreja") {
          if (!IsPuzzleInteracting) {
            Fundo.BGImage[19] = loadImage("igrejapa.jpg");
            Fundo.Structure[Local].Base[0].PuzzleObj.IsVisible = true;
            p.CanInput = false;
            IsPuzzleInteracting = true;
          } else {
            Fundo.Structure[Local].Base[0].PuzzleObj.IsVisible = false;
            p.CanInput = true;
            IsPuzzleInteracting = false;
          }
        } else if (Cenario == "cemiterio") {
          if (!IsPuzzleInteracting) {
            Fundo.Structure[Local].Base[0].PuzzleObj2.IsVisible = true;
            p.CanInput = false;
            IsPuzzleInteracting = true;
          } else {
            Fundo.Structure[Local].Base[0].PuzzleObj2.IsVisible = false;
            p.CanInput = true;
            IsPuzzleInteracting = false;
          }
        } else if (Cenario == "casa") {
          if (!IsPuzzleInteracting) {
            Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.IsVisible = true;
            p.CanInput = false;
            IsPuzzleInteracting = true;
          } else {
            Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.IsVisible = false;
            p.CanInput = true;
            IsPuzzleInteracting = false;
          }
        }
      }
    }
    if (key == '1') {
      ChangeAmbience("igreja", 8, 20);
      Local = 0;
    }
    if (key == '2') {
      ChangeAmbience("cemiterio", 20, 9);
      LocalY = 0;
    }
    if (key == '3') {
      ChangeAmbience("casa", 20, 8);
      LocalY = 0;
    }
    if (key == 'k') {
      if (GodMode) {
        GodMode = false;
      } else {
        GodMode = true;
      }
    }
  }
  if (IsInTutorial) {
    if (keyCode == ENTER) {
      for (int i = 0; i < Tutoriais.length; i++) {
        if (Tutoriais[i]) {
          TutApp[i] = true;
          Tutoriais[i] = false;
        }
      }
      IsInTutorial = false;
    }
  }
  if (IsInCutscene) {
    if (Cutscenes[0]) {
      IsInCutscene = false;
      Cutscenes[0] = false;
      intro.stop();
    }
    if (Cutscenes[1]) {
      IsInCutscene = false;
      Cutscenes[1] = false;
      cutscene1.stop();
      Fundo = new Cenarios(6, UltimoCenario, Cenario, 4);
      p = new Player();
      p.CanInput = true;
      hog = new Corredor();
      IsInMenu = false;
    }
    if (Cutscenes[2]) {
      IsInCutscene = false;
      Cutscenes[2] = false;
      cutscene2.stop();
    }
    if (Cutscenes[3]) {
      IsInCutscene = false;
      Cutscenes[3] = false;
      cutscene3.stop();
      ChangeAmbience("casa", 20, 9);
    }
    if (Cutscenes[4]) {
      IsInCutscene = false;
      Cutscenes[4] = false;
      cutscene4.stop();
      exit();
    }
  }
  if (IsCreditos) {
    CredPos = -2398;
  }
}

void keyReleased() {
  if (!IsInMenu && !IsInCutscene) {
    if (p.CanInput == true) {
      if (key == 'a' || key == 'A' || keyCode == LEFT) {
        p.IsBackward = false;
        p.ResVel = false;
        p.ResetXVelocity();
      }
      if (key == 'd' || key == 'D' || keyCode == RIGHT) {
        p.IsForward = false;
        p.ResVel = false;
        p.ResetXVelocity();
      }
      if (key == 's' || key == 'S' || keyCode == DOWN) {
        if (p.CanClimb == false) {
          p.IsCrouching = false;
        } else {
          p.ClimbingDown = false;
        }
      }
      if (key == 'w' || key == 'W' || keyCode == UP || key == ' ') {
        p.CheckW = false;
      }
      if (p.IsBackward == false && p.IsForward == false && p.IsJumping == false && p.IsCrouching == false) {
        p.Input = false;
      }
    }
  }
}

void mouseReleased() {
  if (!IsInMenu) {
    if (p.CanInteract) {
      if (Cenario == "igreja") {
        if (Fundo.Structure[Local].Base[0].PuzzleObj.IsVisible) {
          Fundo.Structure[Local].Base[0].PuzzleObj.Puzzle1.Clicked();
        }
      } else if (Cenario == "cemiterio") {
        if (Fundo.Structure[Local].Base[0].PuzzleObj2.IsVisible) {
          Fundo.Structure[Local].Base[0].PuzzleObj2.Puzzle2.Clicked();
        }
      } else if (Cenario == "casa") {
        if (Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.IsVisible) {
          Fundo.VarStructure[LocalY].Base[0].PuzzleObj3.Puzzle3.Clicked();
        }
      }
    }
  } else {
    if (!IsInCutscene) {
      if (!IsCreditos) {
        if (mouseX >= 320 && mouseX <= 475 && mouseY >= 220 && mouseY <= 290) {
          Ambient[MusicIndex].pause();
          Ambient[MusicIndex].rewind();
          MenuButton.play();
          cutscene1.loop();
          Cutscenes[1] = true;
          IsInCutscene = true;
        }
        if (mouseX >= 320 && mouseX <= 475 && mouseY >= 323 && mouseY <= 393) {
          MenuButton.play();
          ScreenDelay = 30;
          CredPos = 0;
          IsCreditos = true;
        }
        if (mouseX >= 320 && mouseX <= 475 && mouseY >= 435 && mouseY <= 505) {
          MenuButton.play();
          exit();
        }
      }
    }
  }
  if (Cutscenes[5]) {
    if (mouseX >= 127 && mouseX <= 455 && mouseY >= 432 && mouseY <= 500) {
      p.vidas = 5;
      IsInCheck = false;
      p.Checkpoint = false;
      Cutscenes[5] = false;
      IsInCutscene = false;
      Local = 0;
      LocalY = 0;
      Fundo.Restoration();
      hog.Restart();
      p.Restart();
    }
    if (mouseX >= 521 && mouseX <= 641 && mouseY >= 432 && mouseY <= 500) {
      exit();
    }
  }
}
