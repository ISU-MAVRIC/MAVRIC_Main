#include "mbed.h"
#include "RingBuffer.h"
#include "PID.h"
#include "BufferedSerial.h"
#include <string>

using std::string;

//#define NO_PACKET 0
//#define MOTOR_SPEED 1
//#define ARM_CONTROL 2
//#define CAM_GIMBAL 3

PwmOut arm_rotate(D13); //PA_5
int arm_rotate_speed;

PwmOut arm_shoulder(D12); //PA_6
AnalogIn arm_shoulder_fdbk(A0);
int arm_shoulder_speed;
//PID arm_shoulder_pid(1,1,1,1);
//float arm_shoulder_sp = .5;

PwmOut arm_elbow(D11);  //PA_7
AnalogIn arm_elbow_fdbk(A1);
int arm_elbow_speed;
//PID arm_elbow_pid(1,1,1,1);
//float arm_elbow_sp = .5;

PwmOut wheel_left(D15); //PB_8
int wheel_left_speed;
PwmOut wheel_right(D14); //PB_9
int wheel_right_speed;


PwmOut cam_pan(D10); //PB_6
int cam_pan_pos;
PwmOut cam_tilt(D9); //PC_7
int cam_tilt_pos;

//not currently used
int cam_zoom_pos = 127;

BufferedSerial ser(PA_11, PA_12);

string buffer = "";

enum state { NONE, STARTED, CONTROL, CONTROL_MOTOR, CONTROL_ARM, CONTROL_CAMERA };

state rx_state = NONE;



void initialize_PWM()
{
    arm_rotate.period_ms(20);
    arm_rotate.pulsewidth_us(1500);
    arm_shoulder.period_ms(20);
    arm_shoulder.pulsewidth_us(1500);
    arm_elbow.period_ms(20);
    arm_elbow.pulsewidth_us(1500);

    wheel_left.period_ms(20);
    wheel_left.pulsewidth_us(1500);
    wheel_right.period_ms(20);
    wheel_right.pulsewidth_us(1500);

    cam_pan.period_ms(20);
    cam_pan.pulsewidth_us(1500);
    cam_tilt.period_ms(20);
    cam_tilt.pulsewidth_us(1500);
}

//void initialize_PID()
//{
//    arm_shoulder_pid.setInputLimits(0, 1);
//    arm_shoulder_pid.setOutputLimits(1000, 2000);
//    //arm_elbow_pid.setInputLimits(0, 1);
//    //arm_elbow_pid.setOutputLimits(0, 255);
//}

//void update_PID()
//{
//    float shoulder_pos = arm_shoulder_fdbk.read();
//    //float elbow_pos = arm_elbow_fdbk.read();
//    arm_shoulder_pid.setProcessValue(shoulder_pos);
//    arm_shoulder_pid.setSetPoint(arm_shoulder_sp);
//    int shoulder_output = arm_shoulder_pid.compute();
//    //arm_shoulder.pulsewidth_us(shoulder_output);
//    ///ser.printf("SP: %.4f\tPos: %.4f\tOP: %d\n", arm_shoulder_sp, shoulder_pos, shoulder_output);
//}


int map(int x, int in_min, int in_max, int out_min, int out_max)
{
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void motor_status_packet()
{
    ser.printf("<sm%c%c%c%c%c%c>", wheel_left_speed, wheel_left_speed, wheel_left_speed,
               wheel_right_speed, wheel_right_speed, wheel_right_speed);
}

void update_motors()
{
    //ser.printf("Left: %d\tRight: %d\n", left_speed, right_speed);
    int left_us = map(wheel_left_speed, 0, 255, 1000, 2000);
    int right_us = map(wheel_right_speed, 0, 255, 1000, 2000);
    //ser.printf("Left: %d\tRight: %d\n", left_us, right_us);
    wheel_left.pulsewidth_us(left_us);
    wheel_right.pulsewidth_us(right_us);
}

void arm_status_packet()
{
    ser.printf("<sa%c%c%c>", arm_rotate_speed, arm_shoulder_speed, arm_elbow_speed);
}

void arm_control_packet()
{
    //CODE FOR PID
    //ser.printf("Arm Control Packet\n");
    //int shoulder_pos = buf[4] | buf[3] << 8;
    //int elbow_pos = buf[6] | buf[5] <<8;
    //ser.printf("SP: %d   EP: %d\n", shoulder_pos, elbow_pos);
    //arm_shoulder_sp = ((float) atoi(shoulder_pos_str)) / ((float) 1000);
    //arm_elbow_sp = ((float) atoi(elbow_pos_str)) / ((float) 1000);
    //ser.printf("Shoulder SP: %.4f     Elbow SP: %.4f\n", arm_shoulder_sp, arm_elbow_sp);

    int rotate_us = map(arm_rotate_speed, 0, 255, 1000, 2000);
    int shoulder_us = map(arm_shoulder_speed, 0, 255, 1000, 2000);
    int elbow_us = map(arm_elbow_speed, 0, 255, 1000, 2000);

    arm_rotate.pulsewidth_us(rotate_us);
    arm_shoulder.pulsewidth_us(shoulder_us);
    arm_elbow.pulsewidth_us(elbow_us);

    arm_status_packet();
}

void camera_status_packet()
{
    ser.printf("<sc%c%c%c>", cam_pan_pos, cam_tilt_pos, cam_zoom_pos);
}

void update_camera()
{
    //ser.printf("Camera Gimbal Control\n");
    //ser.printf("Left: %d\tRight: %d\n", cam_pan_pos, cam_tilt_pos);
    int cam_pan_us = map(cam_pan_pos, 0, 255, 1000, 2000);
    int cam_tilt_us = map(cam_tilt_pos, 0, 255, 1000, 2000);
    //ser.printf("Left: %d\tRight: %d\n", left_us, right_us);

    cam_pan.pulsewidth_us(cam_pan_us);
    cam_tilt.pulsewidth_us(cam_tilt_us);
}

void parse(char c)
{   //ser.puts(buffer.c_str());
    //ser.printf("Char: %c\n\n", c);
    if (rx_state == NONE) {
        if (c == '<') {
            rx_state = STARTED;
            //ser.printf("STATE: STARTED\n");
        }
    } else if (rx_state == STARTED) {
        if (c == 'c') {
            rx_state = CONTROL;
            //ser.printf("    STATE: CONTROL\n");
        } else {
            rx_state = NONE;
            //ser.printf("        Invalid packet type: %c\n", c);
        }
    } else if (rx_state == CONTROL) {
        if (c == 'm') {
            rx_state = CONTROL_MOTOR;
            //ser.printf("    STATE: CONTROL_MOTOR\n");
        } else if (c == 'a') {
            rx_state = CONTROL_ARM;
            //ser.printf("    STATE: CONTROL_ARM\n");
        } else if (c == 'c') {
            rx_state = CONTROL_CAMERA;
            //ser.printf("    STATE: CONTROL_CAMERA\n");
        } else {
            rx_state = NONE;
            //ser.printf("        Invalid control packet type: %c\n", c);
        }
    } else if (rx_state == CONTROL_MOTOR) {
        //printf("!!%d!!", buffer.length());
        if (buffer.length() > 5) {
            if (c == '>') {
                wheel_left_speed = buffer[0];
                wheel_right_speed = buffer[3];
                update_motors();
                motor_status_packet();
                buffer = "";
                rx_state = NONE;
            } else {
                //ser.printf("Unexpected data!");
                rx_state = NONE;
            }
        } else {
            buffer += c;
        }
    } else if (rx_state == CONTROL_CAMERA) {
        if(buffer.length() > 2){
            if (c == '>'){
                cam_pan_pos = buffer[0];
                cam_tilt_pos = buffer[1];
                update_camera();
                camera_status_packet();
                buffer = "";
                rx_state = NONE;
            } else {
                //ser.printf("Unexpected data!");
                rx_state = NONE;
            }
        } else {
            buffer += c;
        }
    } else {
        //ser.printf("Unknown parser state!");
        buffer = "";
        rx_state = NONE;
    } 
//     if (c == '>') {
//        ser.printf("Unexpected packet end!");
//        buffer = "";
//        rx_state = NONE;
//    }
}

void serial_update()
{
    
    while(ser.readable() > 0) {
        //printf("%d", ser.readable());
        parse(ser.getc());
    }
}

int main()
{
    initialize_PWM();
    ser.baud(57600);

    while(1) {
        serial_update();
    }
}