//code for falling obj
class fall {
  float xpos, ypos;
  float size;
  float speed; 
  Human player1;
  boolean boom;
  PImage img;
  
  fall(int temp) {

    if (temp==1) {
      xpos = width*0.3;
    }
    if (temp==2) {
      xpos = width*0.5;
    }
    if (temp==3) {
      xpos = width*0.7;
    }

    ypos= 50;
    size = 50;
    speed = 8;
    boom=false;
    img = loadImage("catface.png");
    img.resize (250,150);
  }

  void setPlayer(Human player1) {
     this.player1 = player1;
  }
  
  void display () {
//    fill(255);
//    ellipse(xpos, ypos, size, size);
     image(img,xpos,ypos);
}
//code for collision between two objects
  void move() {
    if(!boom) {
      ypos += speed; //ypos=ypos+speed
      checkBottom();
    }
    
    if (gameOver) {
      boom=false;
      cat.ypos =0;
    }
  }

  void checkBottom() {
    if (ypos > player1.loc.y+150 && xpos >= player1.loc.x && xpos <= player1.loc.x+100) {
      boom= true;
      player1.setImage("catto.png");
    }  
    if (ypos>=height&&!boom) { 
      score = score +5;
      ypos= 50;
      float temp = floor(random(1, 4));
      if (temp==1) {
        xpos = width*0.17;
      }
      if (temp==2) {
        xpos = width*0.5;
      }
      if (temp==3) {
        xpos = width*0.83;
      }
    }
    
    if (boom) {
      gameOver=true;
    }
  }
}