import processing.image.*;
import TUIO.*; // import the TUIO library

PImage img = new PImage("my_image.png");
img.filter(GRAY);
img.loadPixels();

for (int i = 0; i < img.pixels.length; i++) {
  img.pixels[i] = color(255 - red(img.pixels[i]), 255 - green(img.pixels[i]), 255 - blue(img.pixels[i]));
}

img.updatePixels();
void draw() {
  image(img, 0, 0);
}
import processing.image.*;
import TUIO.*;
TuioClient client = new TuioClient(3333);
void setup() {
  client.connect();
}
class MyTuioListener extends TuioListener {

  void addTuioObject(TuioObject tobj) {
    // Handle fiducial added event
  }

  void updateTuioObject(TuioObject tobj) {
    // Handle fiducial updated event
  }

  void removeTuioObject(TuioObject tobj) {
    // Handle fiducial removed event
  }

}

MyTuioListener listener = new MyTuioListener();
client.addTuioListener(listener);

void addTuioObject(TuioObject tobj);
