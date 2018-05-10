class Human {
  float x;
  float y;
  PVector loc;
  PImage img;
  PImage bg;
  
  Human(float px, float py) {
    x=px;
    y=py;
    loc = new PVector(x,y);
    
    resetImage();

  }
  
  void setImage(String imageName) {
    img = loadImage(imageName);
  }
  
  void display() {
    fill(255, 233, 200);
    image(img,loc.x,700);
  }
  
  void resetImage() {
    setImage("final alien1.png");
    img.resize (100,150); 
  }

}