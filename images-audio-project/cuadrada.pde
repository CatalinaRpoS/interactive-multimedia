class Square{
  
  int code; // Código de color
  float x; //vertices
  float y; 
  float wh;
  int startFrame; // frameCount al comienzo del dibujo
  
  public Square(int code, float x,float y,float wh, int startFrame) { //Constructor
    this.code=code;
    this.x = x;
    this.y = y;
    this.wh=wh;
    this.startFrame = startFrame; 
  }
  
  public void setCode(int code){ //Cambio del atributo del código del color
    this.code = code;
  }

  public void setWh(float wh){ //Cambio del atributo del código del color
    this.wh=wh;
  }
  
  void draw() {
    if (frameCount < startFrame) return; 
    noFill(); //Hace que no se rellene el círculo por dentro sino que se muestre únicamente el borde
    //rotate(PI/2);
    rectMode(CENTER); // establece el modo de dibujo en el centro
    stroke(code); //Le da color a las figuras
    //square(x,y,wh);
    square(x*(2/3),y*(2/3),wh);// dibuja un cuadrado en el centro de la ventana
    //rotate(PI/5);
    
    //offset += 0.01; //Se incrementa la variable para el noise, esto hace que el "parkinson" de las figuras no sea tan potente
    //rotate(PI/2); //Cada elipse se va rotando 45° 
    //triangle(25, 175, 175, 175, 100, 25);
    //noStroke(); //Sin borde
    //outY -= outY / (y/2); //Disminuye la dimensión del "círculo"
    //outY_Ellipse -= outY_Ellipse / (y/2); //Disminuye la dimensión de la elípse
    //if (frameCount%y == 0) outY_Ellipse = y; //Reinicia la dimensión de la elípse cada 900 frames
    //if (frameCount%y-startFrame == 0) outY = y; //Reinicia la dimensión del círculo cada y-startFrame multiplo
   
 }
    
}
