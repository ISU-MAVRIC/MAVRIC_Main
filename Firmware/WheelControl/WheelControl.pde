// Sweep Sample for Packet Serial
// Copyright (c) 2012 Dimension Engineering LLC
// See license.txt for license details.

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
  
  int power = 0;

  void setup()
  {
    //Communications Serial Port
    //Serial.begin(9600);
    //Wheel Motor Controller Serial Port
    Serial.begin(9600);
    Serial1.begin(9600);
    Serial.println("Initializing SyRen Controllers");
    for(int i = 0; i < NUM_MOTORS; i++)
    {
      wheel[i].autobaud();
    }
    Serial.println("I'm Alive Now...");

  }

int parseInt(String numberStr)
{
  boolean isNegative = false;
  int value = 0;
  int c;

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

void loop()
{
  if(Serial.available())
  {
    char ch = Serial.read();
    if(ch == 'f')
    {
      power += 20;
    } 
    else if(ch == 'r')
    {
      power -= 20;
    }
    power = constrain(power, -127, 127);
    Serial.println(power);
    setSpeedAllMotors(power);
  }
}

void setSpeedAllMotors(int power)
{
  for(int i = 0; i < NUM_MOTORS; i++)
  {
    wheel[i].motor(power);
  }
}


void sweep()
{

  // Ramp motor 1 from -127 to 127 (full reverse to full forward),
  // waiting 20 ms (1/50th of a second) per value.
  for (power = -80; power <= 80; power ++)
  {
    for(int i = 0; i < NUM_MOTORS; i++)
    {
      wheel[i].motor(power);
    }
    delay(20);
  }

  // Now go back the way we came.
  for (power = 80; power >= -80; power --)
  {
    for(int i = 0; i < NUM_MOTORS; i++)
    {
      wheel[i].motor(power);
    }
    delay(20);
  }
}






