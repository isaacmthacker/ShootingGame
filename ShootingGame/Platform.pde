class Platform {
  float x;
  float y;
  float len;
  float wid;
  color c;

  Platform(float xx, float yy) {
    x = xx;
    y = yy;
    len = random(width/10.0, width/2.0);
    wid = 15;
    c = color(int(random(255)), int(random(255)), int(random(255)));
  }

  void display() {
    fill(c);
    rect(x, y, len, wid);
    ellipse(x, y, 5, 5);
  }
}