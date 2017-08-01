float groundWid;
float groundLen;
Point ground;
color groundColor = color(55);

Player p;


ArrayList<Point> objects;

Platform plat;

void setup() {
  size(1000, 500);
  groundWid = height*0.1;
  groundLen = width;
  ground = new Point(0, height-groundWid);
  p = new Player(width/4.0, height/2.0, ground.y);

  objects = new ArrayList<Point>();
  plat = new Platform(width+100, height/2.0);
}



void draw() {
  drawBackground();
  p.run();

  if (random(1) < 0.5) {
    objects.add(new Point(width+random(20), random(height)));
  }

  fill(150);
  for (Point obj : objects) {
    if (p.moveScenary) {
      obj.x -= p.vel.x;
    }
    ellipse(obj.x, obj.y, 10, 10);
  }
  if (p.moveScenary) {
    plat.pos.x -= p.vel.x;
  }
  println(plat.pos);
  plat.display();
  if (plat.pos.x < 0) {
    plat = new Platform(width+100, height/2.0);
  }
}


void drawBackground() {
  background(0);
  fill(groundColor);
  rect(ground.x, ground.y, groundLen, groundWid);
}



void keyPressed() {
  //println("pressed: " + keyCode);
  p.add(keyCode);
}

void keyReleased() {
  p.remove(keyCode);
}