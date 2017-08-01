class Shield {
  Point pos;
  boolean movingRight;
  float w;
  float h;
  float maxHealth = 500;
  float health = maxHealth;
  float healthBarLen = width*0.25;
  float healthBarWid = health*0.05;
  color full = color(0, 0, 255);
  color bad = color(255, 0, 0);
  boolean recharging = false;
  Point statusBar;
  int textSz = 30;
  String label;
  float labelWid;
  float textHeight;
  Shield(float x, float y, float ww, float hh, boolean moveRight) {
    pos = new Point(x, y);
    w = ww;
    h = hh;
    movingRight = moveRight;
    statusBar = new Point(width-1.1*healthBarLen, height - 1.5*healthBarWid);
    textSize(textSz);
    label = "Shield: ";
    labelWid = textWidth(label);
    textHeight = textAscent()+textDescent();
  }
  void display() {
    textSize(textSz);
    println(textAscent(), textDescent());
    text(label, statusBar.x - labelWid, statusBar.y+textHeight/2.0);
    rect(statusBar.x, statusBar.y, healthBarLen, healthBarWid);
  }
}