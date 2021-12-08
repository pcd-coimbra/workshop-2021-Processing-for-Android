import ketai.camera.*;//CAMERA
import ketai.ui.*;//SAVE CAMERA IMG
import android.view.MotionEvent;//SAVE CAMERA IMG
import ketai.sensors.*;//ADD ACCELEROMETER

KetaiCamera cam;//CAMERA
KetaiGesture gesture;//SAVE CAMERA IMG
KetaiSensor sensor;//ADD ACCELEROMETER

PImage img;//SAVE CAMERA IMG
PVector accelerometer;//ADD ACCELEROMETER
PVector position;//ADD ACCELEROMETER
float ball_size = 20;//ADD ACCELEROMETER

void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  
  cam = new KetaiCamera(this,width,height,24);//CAMERA
  cam.start();//CAMERA
  
  gesture = new KetaiGesture(this);//SAVE CAMERA IMG

  position = new PVector(width/2, height/2);//ADD ACCELEROMETER
  sensor = new KetaiSensor(this);//ADD ACCELEROMETER
  sensor.start();//ADD ACCELEROMETER
  accelerometer = new PVector();//ADD ACCELEROMETER

  noStroke();//ADD PIXEL COLOUR
}

void draw(){
  if(cam.isStarted()){//CAMERA
    image(cam,0,0);//CAMERA
  }else if (img != null){//ADD ACCELEROMETER
    PVector rollDirection = new PVector(accelerometer.y * 2, accelerometer.x * 2);//ADD ACCELEROMETER
    position.add(rollDirection);//ADD ACCELEROMETER
    position.x = constrain(position.x, ball_size / 2, width - (ball_size / 2));//ADD ACCELEROMETER
    position.y = constrain(position.y, ball_size / 2, height - (ball_size / 2));//ADD ACCELEROMETER
    
    img.loadPixels();//ADD PIXEL COLOUR
    
    int x = int(position.x);//ADD PIXEL COLOUR
    int y = int(position.y);//ADD PIXEL COLOUR
    int loc = x + y*img.width;//ADD PIXEL COLOUR
    fill(img.pixels[loc]);//ADD PIXEL COLOUR
    ellipse(position.x,position.y,ball_size,ball_size);//ADD 
  }
  
}

void onCameraPreviewEvent(){//CAMERA
  cam.read();//CAMERA
}

public boolean surfaceTouchEvent(MotionEvent event) {//SAVE CAMERA IMG
  return gesture.surfaceTouchEvent(event);
}

void onDoubleTap(float x, float y){//SAVE CAMERA IMG
  img = createImage(width,height,RGB);
  img.copy(cam,0,0,width,height,0,0,width,height);
  cam.stop();
  background(255);
  tint(255, 50);//126); 
  image(img,0,0);
}

void onAccelerometerEvent(float x, float y, float z){//ADD ACCELEROMETER
  accelerometer.set(x, y, z);
}

void exit(){//CAMERA
  cam.stop();//CAMERA
}

void onPinch(float x, float y, float d){//CHANGE CIRCLE SIZE
  ball_size += d;
  ball_size = constrain(ball_size, 10,200);
}
