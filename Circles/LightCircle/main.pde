ArrayList<Circle> circles;

void setup() {
  fullScreen();
  noStroke();
  noCursor();
  ellipseMode(CENTER);
  colorMode(HSB);
  
  background(0);
  
  circles = new ArrayList<Circle>();
  circles.add(new Circle(0, 900.0, 0)); 
  circles.add(new Circle(30, 900.0, 150));
  circles.add(new Circle(60, 900.0, 300));
  circles.add(new Circle(90, 900.0, 450)); 
  circles.add(new Circle(120, 900.0, 600));
  circles.add(new Circle(150, 900.0, 750));
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
 
  pushMatrix();
  translate(width/2, height/2);
  for (Circle c: circles) c.draw();
  popMatrix();
}
