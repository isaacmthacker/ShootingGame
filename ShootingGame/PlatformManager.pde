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
    return new Platform(width/4.0, random(height/2.0, height));
  }

  void run(Player p) {
    for (Platform plat : platforms) {
      plat.display();
    }
  }
}