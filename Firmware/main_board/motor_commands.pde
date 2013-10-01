/**
 *  Executes a new motor command.
 *  
 *  @param mCom    Speeds to set corresponding motors to (0 = forward, 255 = reverse)
 */
void motorCommand(motorByte mCom){
  Serial.print("Motor 1: ");
  Serial.println(mCom.motor_1, DEC);
  setMotor(1, mCom.motor_1 - 127);
  Serial.print("Motor 2: ");
  Serial.println(mCom.motor_2, DEC);
  setMotor(2, mCom.motor_2 - 127);
  Serial.print("Motor 3: ");
  Serial.println(mCom.motor_3, DEC);
  setMotor(3, mCom.motor_3 - 127);
  Serial.print("Motor 4: ");
  Serial.println(mCom.motor_4, DEC);
  setMotor(4, mCom.motor_4 - 127);
  Serial.print("Motor 5: ");
  Serial.println(mCom.motor_5, DEC);
  setMotor(5, mCom.motor_5 - 127);
  Serial.print("Motor 6: ");
  Serial.println(mCom.motor_6, DEC);
  setMotor(6, mCom.motor_6 - 127);
}

void setMotor(uint8_t motor, int8_t speed) {
  uint8_t addr = 128 + (motor - 1);
  uint8_t cmd = 0;
  if(speed < 0) cmd = 1;
  uint8_t spd = abs(speed);
  if(spd > 127) spd = 127;
  uint8_t chk = (addr + cmd + spd) & 0b01111111;
  Serial1.write(addr);
  Serial1.write(cmd);
  Serial1.write(spd);
  Serial1.write(chk);
}

/**
 *  Executes a new steering command.
 *  
 *  @param mCom    Angles to set corresponding motors to (0 = left, 255 = right)
 */
void steeringCommand(motorByte mCom){
  Serial.print("Motor 1: ");
  Serial.println(mCom.motor_1, DEC);
  Serial.print("Motor 2: ");
  Serial.println(mCom.motor_2, DEC);
  Serial.print("Motor 3: ");
  Serial.println(mCom.motor_3, DEC);
  Serial.print("Motor 4: ");
  Serial.println(mCom.motor_4, DEC);
  Serial.print("Motor 5: ");
  Serial.println(mCom.motor_5, DEC);
  Serial.print("Motor 6: ");
  Serial.println(mCom.motor_6, DEC);
}
