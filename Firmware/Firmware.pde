// Status LED pin
const int statusLed = 13;

// List of slave select pins
const int motorEnum[] = {2, 3, 4, 5, 6, 7};
// Length of above list
const int motorCount = 6;

// Setup function
void setup() {
  // Initialize serial for motor controllers
  Serial1.begin(9600);
  // Initialize serial for computer
  Serial.begin(9600);
  
  // Set LED pin as output
  pinMode(statusLed, OUTPUT);
  digitalWrite(statusLed, LOW);
  
  // Set motor slave selects as output
  for(int i = 0; i < motorCount; i++) {
    int pin = motorEnum[i];
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
  }
}

// Main project loop
void loop() {
  if(Serial.available() > 0) {
    int incomingByte = Serial.read();
    
    if(incomingByte == 'F') {
      digitalWrite(statusLed, HIGH);
      setMotor(1, 0x5f);
      setMotor(2, 0x5f);
      setMotor(3, 0x5f);
      setMotor(4, 0x5f);
      setMotor(5, 0x5f);
      setMotor(6, 0x5f);
    }
    if(incomingByte == 'R') {
      digitalWrite(statusLed, HIGH);
      setMotor(1, 0x9f);
      setMotor(2, 0x9f);
      setMotor(3, 0x9f);
      setMotor(4, 0x9f);
      setMotor(5, 0x9f);
      setMotor(6, 0x9f);
    }
    if(incomingByte == 'S') {
      digitalWrite(statusLed, LOW);
      setMotor(1, 0x7f);
      setMotor(2, 0x7f);
      setMotor(3, 0x7f);
      setMotor(4, 0x7f);
      setMotor(5, 0x7f);
      setMotor(6, 0x7f);
    }
  }
}

// Set the motor speed
void setMotor(int motor, int8_t speed) {
  // Lookup slave select pin
  int pin = motorEnum[motor - 1];
  // Bring slave select high
  digitalWrite(pin, HIGH);
  delay(1);
  // Send the speed command
  Serial1.write(speed);
  delay(2);
  // Bring the slave select low
  digitalWrite(pin, LOW);
}
