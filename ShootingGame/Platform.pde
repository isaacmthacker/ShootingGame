class Platform {
  Point pos;
  float len;
  float wid;
  color c;

  Platform(float x, float y) {
    pos = new Point(x, y);
    len = random(width/10.0, width/2.0);
    wid = 15;
    c = color(int(random(255)), int(random(255)), int(random(255)));
  }

  void display() {
    fill(c);
    rect(pos.x, pos.y, len, wid);
  }
}