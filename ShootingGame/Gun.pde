class Gun {
  Point pos;
  boolean facingRight = false;
  float vel = 5;
  ArrayList<Bullet> bullets;
  float gunLen;
  float gunWid;
  float gunCurve;

  int maxShootCnt = 10;
  int shootCnt = maxShootCnt;

  Gun(float x, float y, boolean faceRight) {
    pos = new Point(x, y);
    facingRight = faceRight;
    bullets = new ArrayList<Bullet>();
    gunLen = 50;
    gunWid = 15;
    gunCurve = 10;
  }

  void run() {
    display();
    drawBullets();
    if (shootCnt < maxShootCnt) {
      ++shootCnt;
    }
  }

  void display() {
    fill(255);
    rect(pos.x, pos.y-gunWid/2.0, (facingRight) ? gunLen : -gunLen, gunWid, gunCurve);
  }

  void shoot() {
    if (shootCnt == maxShootCnt) {
      float offset = (facingRight) ? gunLen : -gunLen;
      bullets.add(new Bullet(pos.x+offset, pos.y, facingRight));
      shootCnt = 0;
    }
  }

  void drawBullets() {
    ArrayList<Integer> toRemove = new ArrayList<Integer>();
    for (int i  = 0; i < bullets.size(); ++i) {
      bullets.get(i).run();
      if (bullets.get(i).pos.x > width || bullets.get(i).pos.y < 0) {
        toRemove.add(i);
      }
    }
    for (Integer i : toRemove) {
      bullets.remove(i);
    }
  }
}