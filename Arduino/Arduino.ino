#include <TimerOne.h>


 
  // Motor A connections
  int enA = 9;
  int in1 = 10;
  int in2 = 11;

  // Sensor connection and data
  double value;
  double theta;
  int sensor = A1;
  
  // Controller parameters
  double Kp = 20;
  double Kd = 3;
  double e1 = 0;
  double e2 = 0;
  double r = 0.03378;
  long int t1 = 0;
  long int t2 = 0;
  double t;
  double T = 0.01;

  // Motor parameters
  double n = 8.15 ;
  double etta = 0.85; 
  // Motor driving values
  double torque;
  float w;


void setup() {

  // Set all the motor control pins to outputs
  pinMode(enA, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  
	// Turn off motors - Initial state
	digitalWrite(in1, LOW);
	digitalWrite(in2, LOW); 
  
  // setting the PWM signal frequency
  Timer1.initialize(10);
   
  // Set sensor pin to input mode
  pinMode(sensor, INPUT);

}

void loop() {

  // Read the value from sensor
  value = analogRead(sensor);
  
  //Map the value from 906, 1023 to -pi,pi
  theta=map(value,918,557 , 94,0);

  //turning degrees into radians
  theta = theta * 2 * 3.14 / 360;
  
  // Time
  t2 = millis();

  if (t2-t1>T){
    t1 = t2;
    e2 = -theta;
    torque = (Kp*e2 + Kd*(e2-e1)/T)*r;
    torque = torque/(n*etta);
    w = 3.89*abs(torque) + 0.3;
    }
  
  
 
  if (torque > 0){
    digitalWrite(in1, LOW);
    digitalWrite(in2, HIGH);
    Timer1.pwm(enA, w*1023);}
  if (torque < 0){
    digitalWrite(in1, HIGH);
    digitalWrite(in2, LOW);
    Timer1.pwm(enA, w*1023);}
  if (torque = 0){
    digitalWrite(in1, LOW);
    digitalWrite(in2, LOW);
    Timer1.pwm(enA, w*1023);}

  e1 = e2;
}
