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

  boolean moveScenary = false;

  boolean[] keys = new boolean[5];

  boolean intersectPlatform = false;

  Player(float x, float y, float gs) {
    pos = new Point(x, y);
    vel = new Point(3, 0);
    groundStart = gs;
    g = -13.5;
    jumpVel = abs(2*g);
    gun = new Gun(x, y, movingRight);
    //shield = new Shield(x, y, pWidth*1.5, pHeight*1.5, movingRight);
  }

  void run(boolean intersectPlat) {
    intersectPlatform = intersectPlat;
    move();
    display();
    gun.run();
  }

  void move() {
    moveScenary = false;
    if (keys[0]) {
      if (pos.x > pWidth) {
        pos.x -= vel.x;
      }
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
      movingRight = true;
      if (pos.x <= width/2.0) {
        pos.x += vel.x;
      } else {
        moveScenary = true;
      }
      // moveScenary = true;
    }
    if (keys[3]) {
    }
    if (keys[4]) {
      gun.shoot();
    }
    if (vel.y > g && !intersectPlatform) {
      vel.y += -1;
    }
    if (!intersectGround() && !intersectPlatform) {
      pos.y -= vel.y;
    } else {
      falling = false;
      vel.y = 0;
      if (intersectGround()) {
        pos.y = groundStart-pHeight/2.0;
      }
    }
    updateGun();
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

  boolean intersectPlatform(Platform plat) {
    if (vel.y > 0) {
      println("first if");
      if (plat.x <= pos.x && plat.x+plat.len >= pos.x) {
        println("second if");
        ellipse(plat.x, plat.y, 5, 5);
        ellipse(pos.x, pos.y+pHeight/2.0, 5, 5);
        if ((pos.y+pHeight/2.0) - plat.y <= plat.wid) {
          println("third if");
          intersectPlatform = true;
          return true;
        }
      }
    } 
    println("fFalse");
    return false;
  }


  void display() {
    fill(255);
    ellipse(pos.x, pos.y, pWidth, pHeight);
    text(vel.toString(), pos.x, pos.y-pHeight);
  }
}