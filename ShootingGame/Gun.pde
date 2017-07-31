class Gun {
  Point pos;
  boolean facingRight = false;
  float vel = 5;
  ArrayList<Bullet> bullets;

  int maxShootCnt = 10;
  int shootCnt = maxShootCnt;

  Gun(float x, float y, boolean faceRight) {
    pos = new Point(x, y);
    facingRight = faceRight;
    bullets = new ArrayList<Bullet>();
  }

  void display() {
    strokeWeight(3);
    stroke(color(0, 0, 255));
    if (facingRight) {
      line(pos.x, pos.y, pos.x+20, pos.y);
    } else {
      line(pos.x, pos.y, pos.x-20, pos.y);
    }
    stroke(0);
    strokeWeight(1);
    drawBullets();

    if (shootCnt < maxShootCnt) {
      ++shootCnt;
    }
  }
  void shoot() {
    if (shootCnt == maxShootCnt) {
      bullets.add(new Bullet(pos.x, pos.y, facingRight));
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