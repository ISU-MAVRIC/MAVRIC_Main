/**
 *  Executes a new motor command.
 *  
 *  @param mCom    Speeds to set corresponding motors to (0 = forward, 255 = reverse)
 */
void motorCommand(motorByte mCom){
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
