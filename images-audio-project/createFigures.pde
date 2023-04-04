class Circle {
  
  int code; // Código de color
  float y;  // Diámetro máximo del círculo
  float outY; // Diámetro del círculo exterior
  float outY_Ellipse; //Calcula medida de la altura de la elípse
  int startFrame; // frameCount al comienzo del dibujo
  
  public Circle(int code, float y, int startFrame) { //Constructor
    this.code=code;
    this.y = y;
    this.outY = y; 
    this.outY_Ellipse = y; 
    this.startFrame = startFrame; 
  }
  public void setCode(int code){ //Cambio del atributo del código del color
    this.code = code;
  }
  public void setOutY(float outY){ //Cambio del atributo del código del color
    this.outY = outY;
  }
  public void setOutY_Ellipse(float outY_Ellipse){ //Cambio del atributo del código del color
    this.outY_Ellipse = outY_Ellipse;
  }
  
  void draw() {
    if (frameCount < startFrame) return; 
    stroke(code); //Le da color a las figuras
    noFill(); //Hace que no se rellene el círculo por dentro sino que se muestre únicamente el borde
    ellipse(0, 0, outY*2, outY*2); //Se le asignan posición y dimensiones a la elípse
    
    offset += 0.01; //Se incrementa la variable para el noise, esto hace que el "parkinson" de las figuras no sea tan potente
    rotate(PI/2); //Cada elipse se va rotando 45° 
    ellipse(0, 0, width/4 + noise(offset) * 2, outY_Ellipse*2); //Se le asignan posición y dimensiones a la elípse, aunque en este caso se tiene en cuenta la posición del puntero y se le agrega el elemento noise
   
    //noStroke(); //Sin borde
    //outY -= outY / (y/2); //Disminuye la dimensión del "círculo"
    //outY_Ellipse -= outY_Ellipse / (y/2); //Disminuye la dimensión de la elípse
    //if (frameCount%y == 0) outY_Ellipse = y; //Reinicia la dimensión de la elípse cada 900 frames
    //if (frameCount%y-startFrame == 0) outY = y; //Reinicia la dimensión del círculo cada y-startFrame multiplo
   
 }
    
}
