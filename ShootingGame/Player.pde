import java.util.HashSet;
class Player extends Sprite {
  final float jumpVel;
  boolean falling = false;
  float groundStart;
  boolean movingRight;

  float pHeight = 100;
  float pWidth = 50;

  Gun gun;

  boolean[] keys = new boolean[5];

  Player(float x, float y, float gs) {
    pos = new Point(x, y);
    vel = new Point(5, 0);
    groundStart = gs;
    g = -13.5;
    jumpVel = abs(2*g);
    gun = new Gun(x, y, movingRight);
  }

  void run() {
    move();
    display();
    gun.display();
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void move() {
    println(keys[4]);
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
    for (boolean k : keys) {
      print(k + ", ");
    }
    println("");
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



  boolean intersectGround() {
    if (pos.y+pHeight/2.0 >= groundStart) {
      return true;
    } else {
      return false;
    }
  }



  void drawShield() {
    noFill();
    strokeWeight(3);
    stroke(color(0, 0, 255));
    if (movingRight) {
      arc(pos.x, pos.y, 1.5*pWidth, 1.5*pHeight, -PI/2, PI/2);
    } else {
      arc(pos.x, pos.y, 1.5*pWidth, 1.5*pHeight, PI/2, 3*PI/2);
    }
  }




  void display() {
    fill(255);
    ellipse(pos.x, pos.y, pWidth, pHeight);
    drawShield();
  }
}