//Primitive Camera Control
//Receives primitive packet over serial
//Sets pan and tilt servos to corresponding vals
//Sends pan and tilt values

#include <Servo.h>
Servo pan;
Servo tilt;

void setup()
{
  //Wireless Communications
  Serial.begin(57600);

  Serial.println("I'm Alive Now...");

  pan.attach(9);
  tilt.attach(10);
  
}

void loop()
{
  //expecting packet of format <+000 -000>
  if(Serial.available() >= 11)
  {
    char c = Serial.read();
    //Serial.println(c);
    String leftSpeed = "";
    String rightSpeed = "";
    if(c == '<')
    {
      //Serial.println("Left Speed String Building:");
      for(int i = 0; i < 4; i++)
      {
        leftSpeed += (char) Serial.read();
        //Serial.println(leftSpeed);
      } 
      Serial.read(); //discard middle "space" character
      //Serial.println("Right Speed String Building:");
      for(int i = 0; i < 4; i++)
      {
        rightSpeed += (char) Serial.read(); 
        //Serial.println(rightSpeed);
      }
      Serial.read(); //discard ">"

      int leftPower = parseInt(leftSpeed);
      int rightPower = parseInt(rightSpeed);
      Serial.print("L:");
      Serial.print(leftPower);
      Serial.print('\t');
      Serial.print("R:");
      Serial.print(rightPower);
      Serial.print('\n');
      
      pan.write(leftPower);
      tilt.write(rightPower);
      
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

