class Bullet {
  Point pos;
  boolean movingRight; 
  Bullet(float x, float y, boolean moveRight) {
    pos = new Point(x, y);
    movingRight = moveRight;
  }

  void run() {
    move();
    display();
  }

  void move() {
    if (movingRight) {
      pos.x += 5;
    } else {
      pos.x -= 5;
    }
  }

  void display() {
    fill(color(0, 255, 0));
    ellipse(pos.x, pos.y, 5, 5);
  }
}