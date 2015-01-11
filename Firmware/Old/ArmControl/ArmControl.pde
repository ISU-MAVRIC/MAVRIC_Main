//Primitive Wheel Control
//Receives primitive packet over serial
//Sets wheel power to corresponding vals
//Sends back wheel powers

#include <Sabertooth.h>

Sabertooth lower(128, Serial1); //Lower Joint
Sabertooth upper(129, Serial1); //Upper Joint


void setup()
{
  //Wireless Communications
  Serial.begin(57600);
  //Syren Controller Network
  Serial1.begin(9600);
  Serial.println("Initializing SyRen Controllers");
  
  lower.autobaud();
  upper.autobaud();
  
  Serial.println("I'm Alive Now...");

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

      lower.motor(1, leftPower);
      upper.motor(1, rightPower);
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












