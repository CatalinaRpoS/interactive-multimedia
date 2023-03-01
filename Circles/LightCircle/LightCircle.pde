class Circle {
  
  int hue; //matiz
  float y;  //Diámetro máximo del círculo
  float outY; //diámetro del círculo exterior
  float inY; //diámetro del círculo interior
  int startFrame; //frameCount al comienzo del dibujo
  
  public Circle(int hue, float y, int startFrame) {
    this.hue = hue; 
    this.y = y;
    this.outY = y; 
    this.startFrame = startFrame; 
  }
  
  void draw() {
    if (frameCount < startFrame) return;
    print(startFrame+"\n");
    pushMatrix();
    rotate(radians(28)*(frameCount+startFrame));
    fill(hue, 150, 200);
    //rect(0, outY, outY*0.1, outY*0.1);
    stroke(hue, 150, 360);
    noFill();
    ellipse(0, 0, random(900), random(900)); //ellipse(0, 0, outY, outY*2);
    noStroke();
    popMatrix();
    
    outY -= outY / (y/2);
    if (frameCount%y-startFrame == 0) outY = y;
  }
  
}
