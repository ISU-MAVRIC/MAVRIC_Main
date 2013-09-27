#ifndef MAVRIC_main_board_h
#define MAVRIC_main_board_h

#include <stdint.h>

/* Type that is used for motor controls */
struct motorByte {
  uint8_t motor_1;
  uint8_t motor_2;
  uint8_t motor_3;
  uint8_t motor_4;
  uint8_t motor_5;
  uint8_t motor_6;
};

#endif
