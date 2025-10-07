#include "app_fsm.h"
#include "port_uart.h"
#include "port_mpu.h"
#include "port_adxl.h"
#include "port_sd.h"
#include "port_delay.h"

static estado_t estadoActual;
static uint8_t rxChar;

void app_init(void) {
  estadoActual = ESTADO_IDLE;

  port_mpu_init();
  port_adxl_init();
  (void)port_sd_init();

  port_delay_init_mpu(1000);
  port_delay_init_adxl(500);
  port_delay_init_sd(2000);

  (void)port_sd_open_and_seed();
}

estado_t app_get_state(void) {
  return estadoActual;
}

void app_step(void) {
  switch (estadoActual) {
  case ESTADO_IDLE:
    if (port_uart_receive(&rxChar, 1, 10) == PORT_OK) {
      if (rxChar == '1')
        estadoActual = ESTADO_MPU;
      else if (rxChar == '2')
        estadoActual = ESTADO_ADXL;
      else if (rxChar == '3')
        estadoActual = ESTADO_SD;
      else if (rxChar == '4')
        estadoActual = ESTADO_BORRAR_SD;
      else if (rxChar == '5')
        estadoActual = ESTADO_LEER_SD;
      else
        estadoActual = ESTADO_IDLE;
    }
    break;

  case ESTADO_MPU:
    if (port_delay_read_mpu()) {
      port_mpu_read_all_and_printf();
      estadoActual = ESTADO_IDLE;
    }
    break;

  case ESTADO_ADXL:
    if (port_delay_read_adxl()) {
      port_adxl_read_and_printf();
      estadoActual = ESTADO_IDLE;
    }
    break;

  case ESTADO_SD:
    if (port_delay_read_sd()) {
      if (port_sd_append_latest() != PORT_OK)
        estadoActual = ESTADO_ERROR;
      else
        estadoActual = ESTADO_IDLE;
    }
    break;

  case ESTADO_BORRAR_SD:
    if (port_sd_truncate() != PORT_OK)
      estadoActual = ESTADO_ERROR;
    else
      estadoActual = ESTADO_IDLE;
    break;

  case ESTADO_LEER_SD:
    if (port_sd_dump_uart() != PORT_OK)
      estadoActual = ESTADO_ERROR;
    else
      estadoActual = ESTADO_IDLE;
    break;

  case ESTADO_ERROR:
    port_uart_print(" Error detectado!\r\n");
    estadoActual = ESTADO_IDLE;
    break;

  default:
    estadoActual = ESTADO_IDLE;
    break;
  }
}
