float offset = 0.0;
boolean isNoise = true;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  fill(#00B7CC, 10);
}

void draw() {
 
  translate(width/2, height/2);
 
  for (int i = 0; i < 360; i++) {
    rotate(PI/180);
    if (isNoise) {
      fill(random(256), random(256), random(256));
    } else {
      fill(random(256), random(256), random(256));
    }
    offset += 0.01;
    float pos = width/4 + noise(offset)*mouseX/2-mouseX/4;
    print(pos);
    ellipse(pos, pos, 5, 5);
  }
}

void mouseClicked() {
  isNoise = !isNoise;
}
