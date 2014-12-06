#include <Servo.h> 

int tilt =55;
int pan = 77;

Servo servo1;
Servo servo2;


void setup() 
{ 
  Serial.begin(57600);
  servo1.attach(9);
  servo1.write(tilt);
  servo2.attach(8);
  servo2.write(pan);

  Serial.println("I'm Ready");

} 

void loop() {
  tilt = constrain(tilt, 10, 180);
  servo1.write(tilt);
  pan = constrain(pan, 10, 180);
  servo2.write(pan);
  //expecting packet of format <+000 -000>
  if(Serial.available() >= 11)
  {
    String panspeed = "";
    char c = Serial.read();
    String tiltspeed = "";
    if(c == '<')
    {
      //Serial.println("Left Speed String Building:");
      for(int i = 0; i < 4; i++)
      {
        tiltspeed += (char) Serial.read();
        //Serial.println(tiltspeed);
      } 
      Serial.read(); //discard middle "space" character
      //Serial.println("Right Speed String Building:");
      for(int i = 0; i < 4; i++)
      {
        panspeed += (char) Serial.read(); 
        //Serial.println(panspeed);
      }
      Serial.read(); //discard ">"

      tilt = tilt + parseInt(tiltspeed);
      pan = pan + parseInt(panspeed);
      Serial.println(tilt);
      Serial.println(pan);
    }
  }

} 


int parseInt(String numberStr)
{
  boolean isNegative = false;
  int value = 0;
  char c;

  for(int i = 0; i < numberStr.length(); i++)
  {
    c = numberStr.charAt(i);
    if(c == '-')
    {
      isNegative = true;
    }
    else if(c >= '0' && c <= '9')     // is c a digit?
    {
      value = value * 10 + c - '0';
    }
  }
  if(isNegative)
  {
    value = -value;
  }
  return value;
}

