/**
 *  
 */

#include "main_board.h"

uint8_t buf[16];                ///< Serial buffer
uint8_t bufStatus = false;      ///< Buffer packet received flag
uint8_t bufPos = 0;             ///< Next buffer byte to write to
uint8_t byteRx = 0;             ///< Serial byte received

/**
 *  Initial setup.
 */
void setup() {
  Serial.begin(9600);
  Serial.println("Ready.");
}

/**
 *  Parses the bytes received on the host serial and executes the associated command(s).
 *  Command packets are formatted as follows:
 *  [Start][Type][Payload][Stop]
 *    ->  [Start] - Start byte ('<')
 *    ->  [Type] - Type of packet being sent
 *    ->  [Payload] - Packet payload
 *    ->  [Stop] - Stop byte ('>')
 *  
 */
void parsePacket() {
  char packetType = buf[0];  /// Type of packet being sent
  
  switch(packetType) {    
    case ('C'):      /// Command packet
      Serial.println("Command packet.");
      sendCommand();
      break;
    case ('S'):      /// Status packet
      Serial.println("Status packet.");
      break;
      
    
  }
  
  /// Reset receive buffer status and position
  bufPos = 0;
  bufStatus = false;
}

/**
 *  Parses a command packet for the system it applies to.
 */
void sendCommand() {
    char commandType = buf[1];  /// Type of command being sent
    motorByte mCom;
  switch(commandType) {    
    
    case ('M'):      /// Motor speed command
      /* Motor speed command format:
          <CM[Speed1][Speed2][Speed3][Speed4][Speed5][Speed6]>
          [SpeedX] - Single byte speed to set the motor to (0 forward, 255 reverse) */
      Serial.println("Motor Speed command.");
      mCom = { buf[2], buf[3], buf[4], buf[5], buf[6], buf[7] };
      motorCommand(mCom);
      break;
      
    case ('S'):      /// Steering Angle command
    /* Steering Angle command format:
          <CS[Angle1][Angle2][Angle3][Angle4][Angle5][Angle6]>
          [AngleX] - Single byte angle to the wheel to (0 left, 255, right) */
      Serial.println("Steering Angle command.");
      mCom = { buf[2], buf[3], buf[4], buf[5], buf[6], buf[7] };
      steeringCommand(mCom);
      break;
      
    case ('C'):      /// Camera Control command
      Serial.println("Camera Control command.");
      break;
      
    case ('A'):      /// Arm Control command
      Serial.println("Arm Control command.");
      break;
      
    case ('P'):      /// Payload Control command
      Serial.println("Payload Control command.");
      break;
  }
  
}


/**
 *  Main loop
 */
void loop() {
  /// Check if serial byte received
  if(Serial.available() > 0) {
    byteRx = Serial.read();
    if(bufStatus) { /// If byte received is the start of a packet
      if(byteRx == '>') {  /// If byte received is the end of a packet
        parsePacket();
      } else {
        buf[bufPos++] = byteRx;  /// Add byte received to buffer, go to next postion in buffer
      }
    } else {  /// If first byte of a packet has not yet been received
      if(byteRx == '<') bufStatus = true;  /// Start of a packet received
    }    
  }
}
