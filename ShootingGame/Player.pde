class Player extends Sprite {
  final float jumpVel;
  float groundStart;

  float pHeight = 100;
  float pWidth = 50;

  HashMap<Integer, Integer> keyToIdx = new HashMap<Integer, Integer>();
  private int left = 0;
  private int up = 1;
  private int right = 2;
  private int down = 3;
  private int space = 4;
  private boolean[] keys = new boolean[5]; //left, up, right, down, space

  private int maxJumpCnt = 60;
  private int jumpCnt = maxJumpCnt;

  private boolean intersectPlatform = false;
  private Point intersectedPlatform = new Point(-1, -1);

  Player(float x, float y, float gs) {
    g = -20;
    groundStart = gs;
    pos = new Point(x, y);
    vel = new Point(4, 0);
    jumpVel = abs(1.5*g);
  }

  void run() {
    move();
    display();
  }

  void move() {
    gravity();
    updateJumpCnt();
    if (leftPressed()) {
      moveLeft();
    }
    if (rightPressed()) {
      moveRight();
    }
    if (upPressed()) {
      jump();
    }
    if (downPressed()) {
    }
    if (spacePressed()) {
      //shoot();
    }
  }


  void moveLeft() {
    if (pos.x > pWidth/2.0) {
      pos.x -= vel.x;
    }
  }

  void moveRight() {
    if (pos.x < width/2.0) {
      pos.x += vel.x;
    }
  }

  void jump() {
    if (canJump()) {
      pos.y -= 1;
      vel.y = jumpVel;
      jumpCnt = 0;
    }
  }

  void gravity() {
    if (intersectGround()) {
      pos.y = groundStart-pHeight/2.0;
      jumpCnt = maxJumpCnt;
    } else {
      if (vel.y > g) {
        vel.y -= 1.5;
      }
      pos.y -= vel.y;
    }
  }

  void updateJumpCnt() {
    if (jumpCnt < maxJumpCnt) {
      ++jumpCnt;
    }
  }

  boolean canJump() {
    return jumpCnt >= maxJumpCnt;
  }

  boolean intersectGround() {
    return pos.y+pHeight/2.0 >= groundStart;
  }

  void addKey(int code) {
    toggleKey(code, true);
  }

  void removeKey(int code) {
    toggleKey(code, false);
  }

  void toggleKey(int code, boolean pressed) {
    switch(code) {
    case 37:
      keys[left] = pressed;
      break;
    case 38:
      keys[up] = pressed;
      break;
    case 39:
      keys[right] = pressed;
      break;
    case 40:
      keys[down] = pressed;
      break;
    case 32:
      keys[space] = pressed;
      break;
    default:
      break;
    }
  }


  //void updateGun() {
  // gun.pos.x = pos.x;
  // gun.pos.y = pos.y;
  //gun.facingRight = movingRight;
  // }


  boolean isFalling() {
    return vel.y < 0 && pos.y+pHeight/2.0 < groundStart;
  }

  boolean movingRight() {
    return keys[right];
  }

  boolean moving() {
    return keys[left] || keys[right];
  }

  boolean scenaryMoving() {
    return movingRight();
  }

  boolean leftPressed() {
    return keys[left];
  }
  boolean rightPressed() {    
    return keys[right];
  }
  boolean upPressed() {    
    return keys[up];
  }
  boolean downPressed() {    
    return keys[down];
  }
  boolean spacePressed() {    
    return keys[space];
  }


  boolean intersectPlatform(Platform p) {
    if (isFalling()) {
      if (p.x <= pos.x && pos.x <= p.x+p.len) {
        if (pos.y+pHeight/2.0 < p.y && p.y-pos.y <= pHeight/2.0+p.wid) {
          return true;
        }
      }
    }
    return false;
  }


  void display() {
    fill(255);
    ellipse(pos.x, pos.y, pWidth, pHeight);
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
  }
}