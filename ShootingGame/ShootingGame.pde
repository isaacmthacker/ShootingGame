float groundWid;
float groundLen;
Point ground;
color groundColor = color(55);

Player p;

void setup() {
  size(1000, 500);
  groundWid = height*0.1;
  groundLen = width;
  ground = new Point(0, height-groundWid);
  //p = new Player(ground.x, ground.y, ground.y);
  p = new Player(ground.x, height/2.0, ground.y);
}



void draw() {
  drawBackground();
  p.run();
}


void drawBackground() {
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