// Juntian Deng | Nov 28 | Spacegame
import processing.sound.*;
SpaceShip s1;
SoundFile blaster;
SoundFile explosion;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[200];
int score, level, rockRate, rocksPassed, rockCount, laserCount;
boolean play;


void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  puTimer = new Timer(5000);
  puTimer.start();
  rockRate = 2000;
  rockTimer = new Timer(int(random(200, rockRate)));
  rockTimer.start();
  blaster = new SoundFile(this, "blaster.wav");
  explosion = new SoundFile(this, "explosion.wav");

  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  rocksPassed = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    //Level Handling
    if (frameCount %1000 == 10) {
      level ++;
      if (rockRate >= 200) {
        rockRate -= 100;
      } else {
        rockRate = 200;
      }
    }

    background(25);
    //Rendering stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();

    //Add powerups
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println(powerups.size());
    }

    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health += 100;
        } else {
          s1.ammo += 100;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
        rocksPassed++;
      } else {
        pu.display();
        pu.move();
      }
    }
    //render rocks and detect ship collision

    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println(rocks.size());
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-= r.diam;
        score -= r.diam;
        rocks.remove(r);
        //todo call the explosion animation
        //add a sound for explosion
        explosion.stop();
        explosion.play();
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        rocksPassed++;
      } else {
        r.display();
        r.move();
      }
    }

    //Add laser based on event, render lasers on screen

    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j<rocks.size(); j++) {
        Rock r1 = rocks.get(j);
        if (l.intersect(r1)) {
          score += r1.diam;
          //To do: add sound to collision
          //To do: add animation to collision
          //To do: decrement the rock health
          lasers.remove(l);
          r1.diam-=50;
          if (r1.diam<20) {
            rocks.remove(r1);
            explosion.stop();
            explosion.play();
          }
        }
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    s1.display(mouseX, mouseY);
    infoPanel();

    // game over logic
    if (s1.health<1 || rocksPassed > 10) {
      gameOver();
    }
  }
}

void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(244);
  textSize(18);
  text("Spacegame" + " | Rocks Passed:" + rocksPassed +
    " | Health:" + s1.health +
    " | Level:" + level +
    " | Score:" + score +
    " | Ammo:" + s1.ammo, width/2, 40);
}

void mousePressed() {
  blaster.stop();
  blaster.play();
  handleEvent();
  //if (s1.fire() && s1.turretCount == 1) {
  //  lasers.add(new Laser(s1.x, s1.y));
  //  println("Lasers:" + lasers.size());
  //} else if (s1.fire() && s1.turretCount == 2) {
  //  lasers.add(new Laser(s1.x-20, s1.y));
  //  lasers.add(new Laser(s1.x+20, s1.y));
  //  println("Lasers:" + lasers.size());
  //}
}

void keyPressed() {
  if (key == ' ') {
    blaster.stop();
    blaster.play();
    handleEvent();
  }
}

void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin ...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  text("Score: " + score, width/2, height/2 + 30);
  play = false;
  noLoop();
}
