#ifndef APP_FSM_H
#define APP_FSM_H

#include <stdint.h>

typedef enum {
  ESTADO_IDLE,
  ESTADO_MPU,
  ESTADO_ADXL,
  ESTADO_SD,
  ESTADO_BORRAR_SD,
  ESTADO_LEER_SD,
  ESTADO_ERROR
} estado_t;

void app_init(void);
void app_step(void);
estado_t app_get_state(void);

#endif
