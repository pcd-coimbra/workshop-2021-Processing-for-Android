import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;
float light;
float proximity;

void setup(){
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);  // Align the text to the CENTER of the screen using textAlign()
  textSize(72);  // Set the text size to 72
  fill(255, 0, 0);  // Set the text color to red so we can see it
}

void draw(){
  float value = map(light, 0, 1000, 0, 255);   // We will map the light value 
  
  background(value);
  
  text("Accelerometer: \n" +                            // Display the data using text()
    "x: " + accelerometerX + "\n" +
    "y: " + accelerometerY + "\n" +
    "z: " + accelerometerZ + "\n" +
    "proximity: " + proximity + "\n" +
    "light: " + light, width/2, height/2);
}

// Acceleration values are measured in m/s2. If the device is sitting flat and still on the table, the accelerometer reads a magnitude of +9.81 m/s2. 
// This number represents the acceleration needed to hold the device up against  g-force and the result of the following calculation: acceleration of 
// the device (0 m/s2) minus the acceleration due to gravity (-9.81 m/s2).</a> If we move and rotate the device, we can observe values in the range 
// of roughly -10 to 10 m/s2. Shake the device and the values will surge momentarily to maybe +-20 m/s2.


void onAccelerometerEvent(float x, float y, float z){
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}

void onLightEvent(float l){
  light = l;
}

void onProximityEvent(float p){
  proximity = p;
}
