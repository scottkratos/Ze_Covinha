class DataBase {

  boolean HaveHazard, HaveMuleke, HaveAranha, HaveGroundCast, HaveMulekeZica, HaveAirCast, HavePendulo, HaveBatman, HaveBatmanPuto, HaveZerinho, HavePuzzle1, HaveObst, HaveCandelabroRajada, HaveShyGuy, HaveWhomp, HavePuzzle1Stop, HaveMultiProj, HaveBoo, HaveBooLightUp, HaveBooLightDown, HaveZikaDiferenciado, HavePilastraLightUp, HavePilastraLightDown, HaveWhompy, HavePuzzle2, HavePuzzle3;
  int DataTable, LocationX, LocationY, PosInArray;
  Hazards Object;
  Goomba Muleke;
  NormalSpider Aranha;
  Castical GroundCast;
  TPSkelly MulekeZica;
  Candelabro AirCast;
  Pendulo Pendulo;
  Bat Morcego;
  BatFast Batman;
  SpiderArc Zerinho;
  PuzzleObj PuzzleObj;
  Puzzle1Stop Puzzle1Stop;
  CandelabroRajada CandelabroRajada;
  Hidden ShyGuy;
  Whomp Whomp;
  MultiProj MultiProj;
  Boo Boo;
  BooLightUp BooLightUp;
  BooLightDown BooLightDown;
  ZikaDiferenciado ZikaDiferenciado;
  PilastraLightUp PilastraLightUp;
  PilastraLightDown PilastraLightDown;
  Whompy Whompy;
  PuzzleObj2 PuzzleObj2;
  PuzzleObj3 PuzzleObj3;

  DataBase(int table, int LocX, int LocY, int array) {
    DataTable = table;
    LocationX = LocX;
    LocationY = LocY;
    PosInArray = array;
    HaveHazard = false;
    HaveMuleke = false;
    HaveAranha = false;
    HaveGroundCast = false;
    HaveMulekeZica = false;
    HaveAirCast = false;
    HavePendulo = false;
    HaveBatman = false;
    HaveBatmanPuto = false;
    HaveZerinho = false;
    HavePuzzle1 = false;
    HaveCandelabroRajada = false;
    HaveShyGuy = false;
    HaveWhomp = false;
    HaveMultiProj = false;
    HaveBoo = false;
    HaveBooLightUp = false;
    HaveBooLightDown = false;
    HaveZikaDiferenciado = false;
    HavePilastraLightUp = false;
    HavePilastraLightDown = false;
    HavePuzzle1Stop = false;
    HavePuzzle2 = false;
    HavePuzzle3 = false;
    if (DataTable == 0) {
      Object = new Hazards(LocationX, LocationY, 0, 0);
      HaveHazard = true;
    } else if (DataTable == 1) {
      Muleke = new Goomba(LocationX, LocationY, 0, 0);
      HaveMuleke = true;
    } else if (DataTable == 2) {
      Aranha = new NormalSpider(LocationX, LocationY, 0, 0);
      HaveAranha = true;
    } else if (DataTable == 3) {
      GroundCast = new Castical(LocationX, LocationY, 0, 0);
      HaveGroundCast = true;
    } else if (DataTable == 4) {
      MulekeZica = new TPSkelly(LocationX, LocationY, 0, 0);
      HaveMulekeZica = true;
    } else if (DataTable == 5) {
      AirCast = new Candelabro(LocationX, LocationY, 0, 0);
      HaveAirCast = true;
    } else if (DataTable == 6) {
      Pendulo = new Pendulo(LocationX, LocationY, 0, 0);
      HavePendulo = true;
    } else if (DataTable == 7) {
      Morcego = new Bat(LocationX, LocationY, 0, 0);
      HaveBatman = true;
    } else if (DataTable == 8) {
      Batman = new BatFast(LocationX, LocationY, 0, 0);
      HaveBatmanPuto = true;
    } else if (DataTable == 9) {
      Zerinho = new SpiderArc(LocationX, LocationY, 0, 0);
      HaveZerinho = true;
    } else if (DataTable == 10) {
      PuzzleObj = new PuzzleObj(new PVector(LocationX, LocationY));
      HavePuzzle1 = true;
    } else if (DataTable == 11) {
      Puzzle1Stop = new Puzzle1Stop(LocationX, LocationY, 0, 0);
      HavePuzzle1Stop = true;
    } else if (DataTable == 12) {
      CandelabroRajada = new CandelabroRajada(LocationX, LocationY, 0, 0);
      HaveCandelabroRajada = true;
    } else if (DataTable == 13) {
      ShyGuy = new Hidden(LocationX, LocationY, 0, 0);
      HaveShyGuy = true;
    } else if (DataTable == 14) {
      Whomp = new Whomp(LocationX, LocationY, 0, 0);
      HaveWhomp = true;
    } else if (DataTable == 15) {
      MultiProj = new MultiProj(LocationX, LocationY, 0, 0);
      HaveMultiProj = true;
    } else if (DataTable == 16) {
      Boo = new Boo(LocationX, LocationY, 0, 0);
      HaveBoo = true;
    } else if (DataTable == 17) {
      BooLightUp = new BooLightUp(LocationX, LocationY, 0, 0);
      HaveBooLightUp = true;
    } else if (DataTable == 18) {
      BooLightDown = new BooLightDown(LocationX, LocationY, 0, 0);
      HaveBooLightDown = true;
    } else if (DataTable == 19) {
      ZikaDiferenciado = new ZikaDiferenciado(LocationX, LocationY, 0, 0);
      HaveZikaDiferenciado = true;
    } else if (DataTable == 20) {
      PilastraLightUp = new PilastraLightUp(LocationX, LocationY, 0, 0);
      HavePilastraLightUp = true;
    } else if (DataTable == 21) {
      PilastraLightDown = new PilastraLightDown(LocationX, LocationY, 0, 0);
      HavePilastraLightDown = true;
    } else if (DataTable == 22) {
      Whompy = new Whompy(LocationX, LocationY, 0, 0);
      HaveWhompy = true;
    } else if (DataTable == 23) {
      PuzzleObj2 = new PuzzleObj2(new PVector(LocationX, LocationY));
      HavePuzzle2 = true;
    } else if (DataTable == 24) {
      PuzzleObj3 = new PuzzleObj3(new PVector(LocationX, LocationY));
      HavePuzzle3 = true;
    }
  }
  void TickData() {
    if (HaveHazard == true) {
      Object.TickHazard();
    }
    if (HaveMuleke == true) {
      Muleke.TickEntity();
    }
    if (HaveAranha == true) {
      Aranha.TickEntity();
    }
    if (HaveGroundCast == true) {
      GroundCast.TickEntity();
    }
    if (HaveMulekeZica == true) {
      MulekeZica.TickEntity();
    }
    if (HaveAirCast == true) {
      AirCast.TickEntity();
    }
    if (HaveBatman == true) {
      Morcego.TickEntity();
    }
    if (HaveBatmanPuto == true) {
      Batman.TickEntity();
    }
    if (HavePendulo == true) {
      Pendulo.TickEntity();
    }
    if (HaveZerinho == true) {
      Zerinho.TickEntity();
    }
    if (HavePuzzle1 == true) {
      PuzzleObj.TickEntity();
    }
    if (HaveCandelabroRajada == true) {
      CandelabroRajada.TickEntity();
    }
    if (HaveShyGuy == true) {
      ShyGuy.TickEntity();
    }
    if (HaveWhomp == true) {
      Whomp.TickEntity();
    }
    if (HaveMultiProj == true) {
      MultiProj.TickEntity();
    }
    if (HaveBoo == true) {
      Boo.TickEntity();
    }
    if (HaveBooLightUp == true) {
      BooLightUp.TickEntity();
    }
    if (HaveBooLightDown == true) {
      BooLightDown.TickEntity();
    }
    if (HaveZikaDiferenciado == true) {
      ZikaDiferenciado.TickEntity();
    }
    if (HavePilastraLightUp == true) {
      PilastraLightUp.TickEntity();
    }
    if (HavePilastraLightDown == true) {
      PilastraLightDown.TickEntity();
    }
    if (HaveWhompy == true) {
      Whompy.TickEntity();
    }
    if (HavePuzzle1Stop == true) {
      Puzzle1Stop.TickEntity();
    }
    if (HavePuzzle2 == true) {
      PuzzleObj2.TickEntity();
    }
    if (HavePuzzle3 == true) {
      PuzzleObj3.TickEntity();
    }
  }
  void ResetData() {
    if (HaveHazard == true) {
      Object.ResetHazard();
    }
    if (HaveMuleke == true) {
      Muleke.Restart();
    }
    if (HaveAranha == true) {
      Aranha.Restart();
    }
    if (HaveGroundCast == true) {
      GroundCast.Restart();
    }
    if (HaveMulekeZica == true) {
      MulekeZica.Restart();
    }
    if (HaveAirCast == true) {
      AirCast.Restart();
    }
    if (HaveBatman == true) {
      Morcego.Restart();
    }
    if (HaveBatmanPuto == true) {
      Batman.Restart();
    }
    if (HavePendulo == true) {
      Pendulo.Restart();
    }
    if (HaveZerinho == true) {
      Zerinho.Restart();
    }
    if (HavePuzzle1 == true) {
      PuzzleObj.Restart();
    }
    if (HaveCandelabroRajada == true) {
      CandelabroRajada.Restart();
    }
    if (HaveShyGuy == true) {
      ShyGuy.Restart();
    }
    if (HaveWhomp == true) {
      Whomp.Restart();
    }
    if (HaveMultiProj == true) {
      MultiProj.Restart();
    }
    if (HaveBoo == true) {
      Boo.Restart();
    }
    if (HaveBooLightUp == true) {
      BooLightUp.Restart();
    }
    if (HaveBooLightDown == true) {
      BooLightDown.Restart();
    }
    if (HaveZikaDiferenciado == true) {
      ZikaDiferenciado.Restart();
    }
    if (HavePilastraLightUp == true) {
      PilastraLightUp.Restart();
    }
    if (HavePilastraLightDown == true) {
      PilastraLightDown.Restart();
    }
    if (HaveWhompy == true) {
      Whompy.Restart();
    }
    if (HavePuzzle1Stop == true) {
      Puzzle1Stop.Restart();
    }
    if (HavePuzzle2 == true) {
      PuzzleObj2.Restart();
    }
    if (HavePuzzle3 == true) {
      PuzzleObj3.Restart();
    }
  }
}