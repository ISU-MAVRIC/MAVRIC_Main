//Primitive Wheel Control
//Receives primitive packet over serial
//Sets wheel power to corresponding vals
//Sends back wheel powers

#include <Sabertooth.h>

#define NUM_MOTORS 6

Sabertooth wheel[NUM_MOTORS] = {
  Sabertooth(128, Serial1), //Left Front
  Sabertooth(129, Serial1), //Left Mid
  Sabertooth(130, Serial1), //Left Back
  Sabertooth(131, Serial1), //Right Front
  Sabertooth(132, Serial1), //Right Mid
  Sabertooth(133, Serial1) //Right Back
  };


  void setup()
  {
    //Wireless Communications
    Serial.begin(57600);
   //Syren Controller Network
    Serial1.begin(9600);
    Serial.println("Initializing SyRen Controllers");
    for(int i = 0; i < NUM_MOTORS; i++)
    {
      wheel[i].autobaud();
    }
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

      setSpeedLeftMotors(leftPower);
      setSpeedRightMotors(rightPower);
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

void setSpeedAllMotors(int power)
{
  for(int i = 0; i < NUM_MOTORS; i++)
  {
    wheel[i].motor(power);
  }
}

void setSpeedLeftMotors(int power)
{
  for(int i = 0; i < 3; i++)
  {
    wheel[i].motor(power);
  }
}

void setSpeedRightMotors(int power)
{
  for(int i = 3; i < 6; i++)
  {
    wheel[i].motor(power);
  }
}












