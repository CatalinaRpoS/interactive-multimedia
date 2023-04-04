import netP5.*;
import oscP5.*;

ArrayList<Circle> circles; //Definimos un array de objeto círculo
ArrayList<Triang> triangles; //Definimos un array de objeto círculo
int [][] colors; //Definimos una matriz de colores para las paletas
int palette; //Elemento random de tipo entero para escoger la paleta de colores
float offset = 0.0; //Argumento del noise en la creación de la elipse
float notes;

void setup() {  //Metodo setup para definir la configuración inicial del proyecto
  fullScreen(); //Pantalla completa
  noStroke(); //Sin borde
  frameRate(120); //Tasa de actualización de los frames. 120 fps
  
  OscP5 oscP5 = new OscP5(this, 11111); // Variable para conexión osc con PureData
    
  background(0); //fondo color negro
  
  colors = new int[10][4]; //Definimos el objeto matriz colors de tamaño 10x4
  //Todas las paletas de colores
  colors[0][0] = #30E3DF;
  colors[0][1] = #FCE22A;
  colors[0][2] = #F94A29;
  colors[0][3] = #D61355;
  
  colors[1][0] = #3795BD;
  colors[1][1] = #2F58CD;
  colors[1][2] = #4E31AA;
  colors[1][3] = #3A1078;
  
  colors[2][0] = #FF5200;
  colors[2][1] = #FA9905;
  colors[2][2] = #F21170;
  colors[2][3] = #72147E;
  
  colors[3][0] = #AC7088;
  colors[3][1] = #DEB6AB;
  colors[3][2] = #ECCCB2;
  colors[3][3] = #F5E8C7;
  
  colors[4][0] = #F4FF61;
  colors[4][1] = #A8FF3E;
  colors[4][2] = #32FF6A;
  colors[4][3] = #27AA80;
  
  colors[5][0] = #F806CC;
  colors[5][1] = #A91079;
  colors[5][2] = #570A57;
  colors[5][3] = #2E0249;
  
  colors[6][0] = #F806CC;
  colors[6][1] = #A91079;
  colors[6][2] = #570A57;
  colors[6][3] = #2E0249;
  
  colors[7][0] = #4B2D9F;
  colors[7][1] = #EE51B1;
  colors[7][2] = #E3C515;
  colors[7][3] = #2C5D37;
  
  colors[8][0] = #F7FD04;
  colors[8][1] = #F9B208;
  colors[8][2] = #F98404;
  colors[8][3] = #FC5404;
  
  colors[9][0] = #000000;
  colors[9][1] = #165E00;
  colors[9][2] = #FFDD00;
  colors[9][3] = #FF0000;
  
  palette = (int)random(10); 
  
  //Se instancian las 4 elipses, cada uno variando su startFrame de 0 a 600 con diferencia de 200
  circles = new ArrayList<Circle>();
  circles.add(new Circle(colors[palette][0],900.0, 0)); 
  circles.add(new Circle(colors[palette][1],900.0, 200));
  circles.add(new Circle(colors[palette][2],900.0, 400));
  circles.add(new Circle(colors[palette][3],900.0, 600)); 
  
  palette = (int)random(10); 
  triangles = new ArrayList<Triang>();
  triangles.add(new Triang(colors[palette][0],width/2,width/10,height/2,height/100,700,700,0));
  triangles.add(new Triang(colors[palette][1],width/4,width/12,height/5,height/20,400,600,200));
  triangles.add(new Triang(colors[palette][2],width/6,width/14,height/8,height/70,1000,900,400));
  triangles.add(new Triang(colors[palette][3],width/8,width/16,height/11,height/50,300,500,600));
}

/* Incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage oscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+oscMessage.addrPattern());
  //println(" typetag: "+oscMessage.typetag());
  if(oscMessage.checkAddrPattern("/notes")) {
    notes = oscMessage.get(0).floatValue();
    println(notes);
    
  }
  
  /*if(oscMessage.checkAddrPattern("/metro")){
    x = map(oscMessage.get(0).floatValue(), 0, 100, 20, width);
  } else if(oscMessage.checkAddrPattern("/metro1000")){
    y = map(oscMessage.get(1).floatValue(), 0, 100, 20, width);
  } */
}

void draw() {
  fill(0, 7); //El primer argumento es el color del fondo, y el segundo es el grado de opacidad
  rect(0, 0, width, height); //Crea un rectángulo en cada aparición de una elípse para hacerla más visible
 

  translate(width/2, height/2); //Centra los círculos
  
  int i=0; //Variable del contador para hacer posible el cambio de paleta
  
  for (int j=0;j<4; j++){
            
    // Se cambia de paleta cuando ya se hayan generado los 4 círculos o cuando se haga
    // clic sobre la pantalla
    if (frameCount % 600 == 0 || mousePressed == true){ 
      palette = (int)random(10);
      circles.get(0).setCode(colors[palette][0]);
      circles.get(1).setCode(colors[palette][1]);
      circles.get(2).setCode(colors[palette][2]);
      circles.get(3).setCode(colors[palette][3]);
    }
    
    if (key == ENTER) exit(); // Se termina la ejecución del programa al presionar la tecla enter
      
    circles.get(j).draw(); //Ejecuta el draw de cada círculo
    i=i+1; //Incrementa el contador para el cambio de paleta
  }
    for (int j=0;j<4; j++){
            
    // Se cambia de paleta cuando ya se hayan generado los 4 círculos o cuando se haga
    // clic sobre la pantalla
   
       
      circles.get(0).setOutY(notes*10);
      circles.get(1).setOutY(notes*10);
      circles.get(2).setOutY(notes*10);
      circles.get(3).setOutY(notes*10);
      
      circles.get(0).setOutY_Ellipse(notes*10);
      circles.get(1).setOutY_Ellipse(notes*10);
      circles.get(2).setOutY_Ellipse(notes*10);
      circles.get(3).setOutY_Ellipse(notes*10);

    }
    for (int j=0;j<4; j++){
       triangles.get(j).draw(); //Ejecuta el draw de cada círculo
       j=j+1; //Incrementa el contador para el cambio de paleta
     }
}
