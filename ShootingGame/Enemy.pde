class Enemy extends Sprite {
  Enemy(float x, float y) {
    pos = new Point(x, y);
    vel = new Point(1, 0);
  }
  void run() {
    move();
    display();
  }
  void move() {
    pos.x -= vel.x;
  }
  void display() {
    fill(color(150, 150, 255));
    ellipse(pos.x, pos.y, 50, 50);
  }
}