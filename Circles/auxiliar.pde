class Circle {

  float y;  // Diámetro máximo del círculo
  float outY; // Diámetro del círculo exterior
  int startFrame; // frameCount al comienzo del dibujo
  int i=0;
  
  public Circle(float y, int startFrame) {
    this.y = y;
    this.outY = y; 
    this.startFrame = startFrame; 
  }
  
  void draw() {
    if (frameCount < startFrame) return;
    //rotate(radians(28)*(frameCount+startFrame));
    if (startFrame<200){
      palette = (int) random(4);
      i=0; 
    }
    else if(startFrame<400 && startFrame>=200){ 
      i=1;
    }
    else if(startFrame<600 && startFrame>=400){
      i=2;
    }
    else{
      i=3;
    }
    stroke(colors[palette][i]);
    noFill();
    ellipse(0, 0, outY*2, outY*2); 
    noStroke();
    
    outY -= outY / (y/2);
    if (frameCount%y-startFrame == 0) outY = y;
  }
  
}
