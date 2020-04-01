int spiralAmount = 50;

PImage foto;

void setup() {
size(2000,2000);
foto = loadImage("RETRATo5.jpg");

frameRate (8);

}

void draw(){

strokeWeight(noise(random(2,3))*4.5);
smooth();
image(foto, 0,0);

int centX = int(random(800,800));
int centY = int(random(950,950));


float x, y;
for (int i = 0; i <spiralAmount; i++) { // crear X cantidad de espirales.
  //background(255);
  
  float lastx = -999;
  float lasty = - 999;
  float radiusNoise = random(10);
  float radius = 10;

stroke(#BF4545); //rojo
//stroke(255);

//randomizar el aspecto de cada la espiral
int startAngle = int (noise(random(360))); // changes on start/endAngles resize the spirals
int endAngle = 3000 ;
int angleStep = 5 + int(random(500));

for (float ang = startAngle; ang <=endAngle; ang +=angleStep) {
  radiusNoise +=0.05;
  radius +=0.5;
  float thisRadius = radius + (noise(radiusNoise)*200) - 100;
  float rad = radians(ang);
  x = centX + (thisRadius * cos(rad));
  y = centY + (thisRadius * sin (rad));
  
  if (lastx >-999) {
    line (x,y,lastx,lasty);
  }
  lastx = x;
  lasty = y;
}
}
saveFrame("screen-####.tif");
  
}

void keyPressed() {
 if (keyCode == ENTER) {
 saveFrame("screen-####.png");
 }}
