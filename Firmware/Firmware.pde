/* Defines */
#define MOTOR_FORWARD 64  ///< Motor command for forward motion
#define MOTOR_REVERSE -32  ///< Motor command for reverse motion
#define MOTOR_STOP 0     ///< Motor command to stop


/* Pin Assignments */
const uint8_t statusLED = PIN_LED1;  ///< LED indicator pin

/* Constant variables */
const int motorEnum[] = {85, 81, 74, 10, 6, 2}; ///< List of slave-select pins
const int motorCount = sizeof(motorEnum) / sizeof(motorEnum[0]);  ///< Size of slave-select pin list

/* Global Variables */
uint8_t byteRx = 0;             ///< Serial byte received

/**
 *  Initial setup.
 */
void setup() {
  /* Initialize pins */
  /// Initialize LED pin
  pinMode(statusLED, OUTPUT);
  digitalWrite(statusLED, LOW);
  
  // Set motor slave selects as output
  for(int i = 0; i < motorCount; i++) {
    int pin = motorEnum[i];
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
  }

  /// Initialize serial for motor controllers
  Serial1.begin(9600);
  Serial1.write(0b10101010);
  /// Initialize serial for computer
  Serial.begin(57600);
  Serial.println("ready");

}

/**
 *  Main loop
 */
void loop() {
  /// Check if serial byte received
  if(Serial.available() > 0) {
    byteRx = Serial.read();
    /// Forward
    switch(byteRx) {
      case('F') :
        digitalWrite(statusLED, HIGH);
        setMotor(1, MOTOR_FORWARD);
        setMotor(2, MOTOR_FORWARD);
        setMotor(3, MOTOR_FORWARD);
        setMotor(4, MOTOR_FORWARD);
        setMotor(5, MOTOR_FORWARD);
        setMotor(6, MOTOR_FORWARD);
        break;
    /// Reverse
      case('R') :
        digitalWrite(statusLED, HIGH);
        setMotor(1, MOTOR_REVERSE);
        setMotor(2, MOTOR_REVERSE);
        setMotor(3, MOTOR_REVERSE);
        setMotor(4, MOTOR_REVERSE);
        setMotor(5, MOTOR_REVERSE);
        setMotor(6, MOTOR_REVERSE);
        break;
      /// Stop
      case('S') :
        digitalWrite(statusLED, LOW);
        setMotor(1, MOTOR_STOP);
        setMotor(2, MOTOR_STOP);
        setMotor(3, MOTOR_STOP);
        setMotor(4, MOTOR_STOP);
        setMotor(5, MOTOR_STOP);
        setMotor(6, MOTOR_STOP);
        break;
    }
  }
}

// Set the motor speed
void setMotor(int motor, int8_t speed) {
  /*
  // Lookup slave select pin
  int pin = motorEnum[motor - 1];
  // Bring slave select high
  digitalWrite(pin, HIGH);
  delay(1);
  // Send the speed command
  Serial1.print(speed, HEX);
  delay(2);
  // Bring the slave select low
  digitalWrite(pin, LOW);
  */
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
