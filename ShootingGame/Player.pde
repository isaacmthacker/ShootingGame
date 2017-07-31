import java.util.HashSet;
class Player extends Sprite {
  final float jumpVel;
  boolean falling = false;
  float groundStart;
  boolean movingRight;

  Gun gun;

  boolean[] keys = new boolean[4];

  Player(float x, float y, float gs) {
    pos = new Point(x, y);
    vel = new Point(5, 0);
    groundStart = gs;
    g = -10;
    jumpVel = abs(2*g);
    gun = new Gun(x, y, movingRight);
  }

  void run() {
    move();
    display();
    gun.display();
  }

  void move() {
    if (keys[0]) {
      pos.x -= vel.x;
      movingRight = false;
    }
    if (keys[1]) {
      if (!falling) {
        vel.y = jumpVel;
        pos.y -= 1;
        falling = true;
      }
    }
    if (keys[2]) {
      pos.x += vel.x;
      movingRight = true;
    }
    if (keys[3]) {
    }
    if (vel.y > g) {
      vel.y += -1;
    }
    if (pos.y < groundStart) {
      pos.y -= vel.y;
    } else {
      falling = false;
    }
    updateGun();
  }

  void add(int code) {
    if (code == 32) {
      gun.shoot();
    } else {
      if (code >= 37 && code <= 40) {
        keys[code-37] = true;
      }
    }
  }
  void remove(int code) {
    if (code != 32) {
      if (code >= 37 && code <= 40) {
        keys[code-37] = false;
      }
    }
  }


  void updateGun() {
    gun.pos.x = pos.x;
    gun.pos.y = pos.y-50;
    gun.facingRight = movingRight;
  }












  void display() {
    fill(255);
    ellipse(pos.x, pos.y-50, 50, 100);
    gun.display();
  }
}