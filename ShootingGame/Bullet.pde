class Bullet {
  Point pos;
  boolean movingRight; 
  float vel = 10;
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
      pos.x += vel;
    } else {
      pos.x -= vel;
    }
  }

  void display() {
    fill(color(0, 255, 0));
    ellipse(pos.x, pos.y, 5, 5);
  }
}