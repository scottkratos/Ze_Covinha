class CusCol {

  int LocationX, LocationY, ColW, ColH;
  boolean SearchL, SearchR;

  CusCol(int locx, int locy, int w, int h) {
    LocationX = locx;
    LocationY = locy;
    ColW = w;
    ColH = h;
    SearchL = false;
    SearchR = false;
  }
  void TickCollision() {
    DetectPlayer();
    if (DebugMode == true) {
      DrawDebug();
    }
  }
  void DrawDebug() {
    rect(LocationX, LocationY, ColW, ColH);
  }
  void DetectPlayer() {
    if (LocationX <= p.LeftlegEnd.x + p.location.x && LocationX + ColW >= p.location.x + p.LeftlegStart.x && LocationY + ColH / 2 > p.location.y) {
      SearchL = false;
    } else {
      SearchL = true;
    }
    if (LocationX <= p.RightlegEnd.x + p.location.x && LocationX + ColW >= p.location.x + p.RightlegStart.x && LocationY + ColH / 2 > p.location.y) {
      SearchR = false;
    } else {
      SearchR = true;
    }
  }
}