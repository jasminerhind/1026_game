//race to space
//final code jasmine and qiya
int time;
int score = 0;
String timeString = "0";
int initialTime;
int interval = 1000;
int totalTime = 100000;

//imports sound
import processing.sound.*;

SoundFile file;
  //replace the sample.mp3 with your audio file name here
  String audioName = "Podington_Bear_-_Lake_Victoria.mp3";
  String path;



fall cat;
Human player1;
PImage bg;
PImage img;

//set game over to false
boolean gameOver=false;

void setup(){
  //fullScreen();
  //background image
  bg = loadImage("bg800.png");
  //logo image
  img=loadImage("logo.png");
  size(1280,800);
  player1 = new Human(width/2, height/2);
  //plays the background music
  path = sketchPath("Podington_Bear_-_Lake_Victoria.mp3");
    file = new SoundFile(this, "Podington_Bear_-_Lake_Victoria.mp3");
    file.play();
  
  cat = new fall(2);
  cat.setPlayer(player1);
  
  imageMode(CENTER);
  
  initialTime = millis();
  setupSerial();
  gameOver=false;
}

void draw(){
   if (millis() < 1000) 
   ((java.awt.Canvas) surface.getNative()).requestFocus();
  background(bg);
  image(img, 120,150,250,150);
  player1.display();
  cat.display();
  cat.move();
  
  if (!gameOver) {
    if (millis() - initialTime > interval)
  {
    time = int(millis()/1000);
    timeString = nf(time, 3);
    initialTime = millis();  
  }
 }
  
  textSize(22);
  text("score:  " + score, width/1.15, height/10.8);
  text(timeString + " sec", width/1.15, height/8.2);
  
  if (gameOver) {
    background(0);
    text("GAME OVER", width/2, height/2);
    score=0;
    
    if (keyPressed){
      gameOver=false;
      player1.resetImage();
    }
  }
}

//this code allows you to controll the character
void keyPressed(){
  if (!gameOver) {
    
  switch(keyCode){
    case(RIGHT):
       if (player1.loc.x == 640){
         player1.loc.x=1062.4;
       } 
       if (player1.loc.x == 217.6){
         player1.loc.x=640;
       } 
       break;
    case(LEFT):
       if (player1.loc.x == 640){
         player1.loc.x=217.6;
       } 
       if (player1.loc.x == 1062.4){
         player1.loc.x=640;
       } 
      break;
     default :
         player1.loc.x=640;
     
  }
   
}
}