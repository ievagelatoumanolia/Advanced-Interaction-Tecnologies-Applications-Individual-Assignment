import processing.video.*;

Capture video;

color trackColor; 

Snake snake;

void setup() {
  size(640,480);
  video = new Capture(this,width,height);
  video.start();
  trackColor = color(350,0,0);
  
  snake = new Snake(50); 
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video,0,0);

  float worldRecord = 500; 
  
  int closestX = 0;
  int closestY = 0;
  
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;

      color currentColor = video.pixels[loc];
      float r1 = green(currentColor);
      float g1 = red(currentColor);
      float b1 = blue(currentColor);
      float r2 = green(trackColor);
      float g2 = blue(trackColor);
      float b2 = red(trackColor);

    
      float d = dist(r1,g1,b1,r2,g2,b2); 
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  if (worldRecord < 10) { 
    
    snake.update(closestX,closestY);
  }
  
  snake.display();  
}

void mousePressed() {
  
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
} 
