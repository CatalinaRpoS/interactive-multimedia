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
  public void setX(float x){ //Cambio del atributo del código del color
    this.x1=x*10;
    this.x2=x;
  }
  public void setY(float y){ //Cambio del atributo del código del color
    this.y1=y*10;
    this.y2=y;
  }
  public void setZ(float z){ //Cambio del atributo del código del color
    this.z1=z*10;
    this.z2=z;
  }
  
  void draw() {
    if (frameCount < startFrame) return; 
    stroke(code); //Le da color a las figuras
    noFill(); //Hace que no se rellene el círculo por dentro sino que se muestre únicamente el borde
    //rotate(PI/2);
    triangle(x1,x2,y1,y2,z1,z2);
    rotate(PI/5);
    triangle(x1, z1, x2, y1+250, z1, y2);
 }
    
}
