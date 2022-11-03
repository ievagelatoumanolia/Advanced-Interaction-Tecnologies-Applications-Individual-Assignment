import processing.video.*;
Movie ballMovie; 

void setup() {
  size(600, 300); 
  frameRate(30);
  ballMovie = new Movie(this, "sea.mp4"); 
  ballMovie.speed(2.0);
  ballMovie.loop();
}

void draw() {
  float r = map(mouseX,0,width,0,4);
  ballMovie.speed(r);
  if (ballMovie.available()) {
    ballMovie.read();
  }
  image(ballMovie, 0, 0);
}
