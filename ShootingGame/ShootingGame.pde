float groundWid;
float groundLen;
Point ground;
color groundColor = color(55);

Player p;


EnemyManager enemies;

PlatformManager platforms;

void setup() {
  size(1000, 500);
  groundWid = height*0.1;
  groundLen = width;
  ground = new Point(0, height-groundWid);
  p = new Player(width/4.0, height/2.0, ground.y);

  enemies = new EnemyManager(10);
  platforms = new PlatformManager(1);
}



void draw() {
  drawScenary();
  enemies.run(p);
  platforms.run(p);
  p.run(platforms.playerIntersect);
}


void drawScenary() {
  background(0);
  fill(groundColor);
  rect(ground.x, ground.y, groundLen, groundWid);
}


void keyPressed() {
  p.add(keyCode);
}

void keyReleased() {
  p.remove(keyCode);
}