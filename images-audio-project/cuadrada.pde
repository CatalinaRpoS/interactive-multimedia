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
    this.wh=wh*3;
  }
  
  void draw() {
    if (frameCount < startFrame) return; 
    noFill(); //Hace que no se rellene el círculo por dentro sino que se muestre únicamente el borde
    rectMode(CENTER); // establece el modo de dibujo en el centro
    stroke(code); //Le da color a las figuras
    square(x*(2/3),y*(2/3),wh);
    stroke(code); //Le da color a las figuras
    square(x*(2/3),y*(2/3),wh+100);// dibuja un cuadrado en el centro de la ventana
 
 }
    
}
