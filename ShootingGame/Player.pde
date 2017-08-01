import java.util.HashSet;
class Player extends Sprite {
  final float jumpVel;
  boolean falling = false;
  float groundStart;
  boolean movingRight = true;

  float pHeight = 100;
  float pWidth = 50;

  Gun gun;

  Shield shield;

  boolean[] keys = new boolean[5];

  Player(float x, float y, float gs) {
    pos = new Point(x, y);
    vel = new Point(5, 0);
    groundStart = gs;
    g = -13.5;
    jumpVel = abs(2*g);
    gun = new Gun(x, y, movingRight);
    shield = new Shield(x, y, pWidth*1.5, pHeight*1.5, movingRight);
  }

  void run() {
    move();
    display();
    gun.display();
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
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
    if (keys[4]) {
      gun.shoot();
      shield.health -= 1;
    }
    if (vel.y > g) {
      vel.y += -1;
    }
    if (!intersectGround()) {
      pos.y -= vel.y;
    } else {
      falling = false;
      pos.y = groundStart-pHeight/2.0;
    }
    updateGun();
    updateShield();
  }

  void add(int code) {
    if (code == 32) {
      keys[4] = true;
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
    } else {
      keys[4] = false;
    }
  }


  void updateGun() {
    gun.pos.x = pos.x;
    gun.pos.y = pos.y;
    gun.facingRight = movingRight;
  }

  void updateShield() {
    shield.pos = pos;
    shield.movingRight = movingRight;
  }



  boolean intersectGround() {
    if (pos.y+pHeight/2.0 >= groundStart) {
      return true;
    } else {
      return false;
    }
  }




  void display() {
    fill(255);
    ellipse(pos.x, pos.y, pWidth, pHeight);
    shield.display();
  }
}