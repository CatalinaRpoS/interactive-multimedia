class Triang{
  
  int code; // Código de color
  float x1; //vertices
  float x2; 
  float y1; 
  float y2; 
  float z1; 
  float z2; 
  int startFrame; // frameCount al comienzo del dibujo
  
  public Triang(int code, float x1, float x2, float y1, float y2, float z1, float z2, int startFrame) { //Constructor
    this.code=code;
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.z1 = z1;
    this.z2 = z2;
    this.startFrame = startFrame; 
  }
  public void setCode(int code){ //Cambio del atributo del código del color
    this.code = code;
  }
  
  void draw() {
    if (frameCount < startFrame) return; 
    stroke(code); //Le da color a las figuras
    noFill(); //Hace que no se rellene el círculo por dentro sino que se muestre únicamente el borde
  
    triangle(x1,x2,y1,y2,z1,z2);
    offset += 0.01; //Se incrementa la variable para el noise, esto hace que el "parkinson" de las figuras no sea tan potente
    rotate(PI/4); //Cada elipse se va rotando 45° 
    triangle(0, 0, width/4 + noise(offset) * mouseX/2, y2*2, z1, z2);
    //noStroke(); //Sin borde
    //outY -= outY / (y/2); //Disminuye la dimensión del "círculo"
    //outY_Ellipse -= outY_Ellipse / (y/2); //Disminuye la dimensión de la elípse
    //if (frameCount%y == 0) outY_Ellipse = y; //Reinicia la dimensión de la elípse cada 900 frames
    //if (frameCount%y-startFrame == 0) outY = y; //Reinicia la dimensión del círculo cada y-startFrame multiplo
   
 }
    
}
