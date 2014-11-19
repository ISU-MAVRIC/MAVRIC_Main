#include <Servo.h> 

int temp;
Servo servo1;
int rightSpeed;


void setup() 
{ 
  Serial.begin(57600);
  servo1.attach(9);
  servo1.write(0);  // set servo to max speed
  
  Serial.println("I'm Ready");
  
} 

void loop() {
servo1.write(temp);

//expecting packet of format <+000 -000>
  if(Serial.available() >= 11)
  {
    char c = Serial.read();
    //Serial.println(c);
    String leftSpeed = "";
    //String rightSpeed = "";
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

      temp = parseInt(leftSpeed);
      
      Serial.println(temp);
      //int rightPower = parseInt(rightSpeed);
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
