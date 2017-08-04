float groundWid;
float groundLen;
Point ground;
color groundColor = color(55);

Player p;


EnemyManager enemies;

PlatformManager platforms;

Platform plat;

void setup() {
  size(1000, 500);
  groundWid = height*0.1;
  groundLen = width;
  ground = new Point(0, height-groundWid);
  p = new Player(width/4.0, height/2.0, ground.y);

  enemies = new EnemyManager(10);
  platforms = new PlatformManager(1);

  plat = new Platform(width/4.0, height/2.0);
}



void draw() {
  drawScenary();
  //enemies.run(p);
  //platforms.run(p);
  p.run();
  plat.display();
  println(p.intersectPlatform(plat));
}


void drawScenary() {
  background(0);
  fill(groundColor);
  rect(ground.x, ground.y, groundLen, groundWid);
}


void keyPressed() {
  p.addKey(keyCode);
}

void keyReleased() {
  p.removeKey(keyCode);
}