import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;
float ax, ay, az;

PVector poss;
PVector vel;
PVector acc;

void setup() {
  ////////////////////////////////ANDROID SENSOR/////////////////////////////////
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  ///////////////////////////////////////////////////////////////////////////////
  fullScreen();
  //size(400, 600);
  noStroke();
  fill(0);
  poss = new PVector(width/2, height/2);
  vel = new PVector();
}

void draw() {
  background(255);
  ellipse(poss.x, poss.y, 50, 50);
  acc = new PVector(-ax*0.01, ay*0.02);
  vel.add(acc);
  poss.add(vel);
  fill(0);
  textSize(15);
  text("acceleration X : "+acc.x, 10, 20);
  text("acceleration Y : "+acc.y, 10, 40);
  text("velocity X : "+vel.x, 10, 60);
  text("velocuty Y : "+vel.y, 10, 80);
  text("possition X : "+poss.x, 10, 100);
  text("possition Y : "+poss.y, 10, 120);
  returnBack();
}
void returnBack() {
  if (poss.y >= height) {
    poss.y = 0;
  } else
  if (poss.x >= width) {
    poss.x = 0;
  } else
  if (poss.x <= 0) {
    poss.x = width;
  } else
  if (poss.y <= 0) {
    poss.y = height;
  }
}
