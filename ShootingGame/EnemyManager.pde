class EnemyManager {
  ArrayList<Enemy> enemies;
  int numEnemies;

  EnemyManager(int numEn) {
    numEnemies = numEn;
    enemies = new ArrayList<Enemy>();
    for (int i = 0; i < numEnemies; ++i) {
      enemies.add(generateEnemy());
    }
  }

  void run(Player p) {
    for (int i = 0; i < enemies.size(); ++i) {
      if (p.moveScenary) {
        enemies.get(i).pos.x -= p.vel.x;
      }
      enemies.get(i).move();
      enemies.get(i).display();
      if (enemies.get(i).pos.x < 0) {
        enemies.set(i, generateEnemy());
      }
    }
  }


  void increaseNumEnemies() {
    for (int i = 0; i < 5; ++i) {
      enemies.add(generateEnemy());
    }
  }

  Enemy generateEnemy() {
    return new Enemy(width+random(5*width), height/2.0);
  }
}