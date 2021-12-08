import ketai.sensors.*;  // Import the Ketai sensor library package

KetaiSensor sensor;  // Declare a sensor variable of type KetaiSensor

void setup(){
  sensor = new KetaiSensor(this);  // Instantiate the KetaiSensor, which makes the sensor methods available
  println(sensor.list());  // Returns a list of available sensors on the device
}
