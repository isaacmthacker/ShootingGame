class PlatformManager {
  ArrayList<Platform> platforms;
  boolean playerIntersect = false;
  PlatformManager(int numPlat) {
    platforms = new ArrayList<Platform>();
    for (int i = 0; i < numPlat; ++i) {
      platforms.add(generatePlatform());
    }
  }

  Platform generatePlatform() {
    return new Platform(width+random(0*width), random(height/2.0, height));
  }

  void run(Player p) {
    playerIntersect = false;
    for (int i = 0; i < platforms.size(); ++i) {
      Platform plat = platforms.get(i);
      if (p.moveScenary) {
        plat.x -= p.vel.x;
      }

      playerIntersect = playerIntersect || p.intersectPlatform(plat);
      println(playerIntersect, p.intersectPlatform(plat));
      println(playerIntersect);
      plat.display();
      if (plat.x+plat.len < 0) {
        platforms.set(i, generatePlatform());
      }
    }
  }
}