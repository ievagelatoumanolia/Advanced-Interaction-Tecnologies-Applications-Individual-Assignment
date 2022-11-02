import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
PImage img;

void setup() {
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"../simpleL/data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("../simpleL/data/patt.hiro",80);
  cam.start();
   img = loadImage("ocean.jpg");
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  //background(0);
  nya.drawBackground(cam);
  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  fill(0,0,255);
  //translate(0,0,20);
   image(img, 0, 0);
  nya.endTransform();
}
