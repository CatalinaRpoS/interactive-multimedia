class Circle {
  
  int code; //matiz
  float y;  // Diámetro máximo del círculo
  float outY; // Diámetro del círculo exterior
  int startFrame; // frameCount al comienzo del dibujo
  
  public Circle(int code, float y, int startFrame) {
    this.code = code; 
    this.y = y;
    this.outY = y; 
    this.startFrame = startFrame; 
  }
  
  void draw() {
    if (frameCount < startFrame) return;

    stroke(code);
    noFill();
    ellipse(0, 0, outY*2, outY*2); 
    noStroke();
    
    outY -= outY / (y/2);
    if (frameCount%y-startFrame == 0) outY = y;
  }
  
}
