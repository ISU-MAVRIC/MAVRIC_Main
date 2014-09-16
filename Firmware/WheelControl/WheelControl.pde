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

void setup()
{
  //Communications Serial Port
  //Serial.begin(9600);
  //Wheel Motor Controller Serial Port
  Serial1.begin(9600);

  for(int i = 0; i < NUM_MOTORS; i++)
  {
    wheel[i].autobaud();
  }

}

void loop()
{
  int power;

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


