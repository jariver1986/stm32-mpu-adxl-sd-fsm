#include "unity.h"
#include "app_fsm.h"

// Mocks generados por CMock a partir de los headers en /ports
#include "mock_port_uart.h"
#include "mock_port_mpu.h"
#include "mock_port_adxl.h"
#include "mock_port_sd.h"
#include "mock_port_delay.h"

// Helper para devolver 1 byte por el puntero del mock UART (debe ir DESPUÉS de incluir mock_port_uart.h)
#if defined(port_uart_receive_ReturnMemThruPtr_buf)
#define UART_RETURN_CHAR(c)                         \
  do {                                              \
    uint8_t _t = (uint8_t)(c);                      \
    port_uart_receive_ReturnMemThruPtr_buf(&_t, 1); \
  } while (0)
#elif defined(port_uart_receive_ReturnThruPtr_buf)
#define UART_RETURN_CHAR(c)                   \
  do {                                        \
    uint8_t _t = (uint8_t)(c);                \
    port_uart_receive_ReturnThruPtr_buf(&_t); \
  } while (0)
#else
#define UART_RETURN_CHAR(c) /* si no existe, revisa firma de port_uart_receive */
#endif

void setUp(void) {
  port_mpu_init_Expect();
  port_adxl_init_Expect();
  port_sd_init_ExpectAndReturn(PORT_OK);
  port_delay_init_mpu_Expect(1000);
  port_delay_init_adxl_Expect(500);
  port_delay_init_sd_Expect(2000);
  port_sd_open_and_seed_ExpectAndReturn(PORT_OK);

  app_init();
}

void tearDown(void) {}

void test_estado_inicial_idle(void) {
  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}

// Forzamos que UART entregue '1' y dispare ESTADO_MPU
void test_idle_uart_1_va_a_mpu_y_vuelve_idle_con_delay(void) {
  port_uart_receive_ExpectAnyArgsAndReturn(PORT_OK);
  UART_RETURN_CHAR('1'); // <--- usar helper

  app_step();
  TEST_ASSERT_EQUAL(ESTADO_MPU, app_get_state());

  port_delay_read_mpu_ExpectAndReturn(1);
  port_mpu_read_all_and_printf_Expect();
  app_step();

  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}

// Borrar SD con error -> pasa por ESTADO_ERROR y anuncia por UART
void test_borrar_sd_error_y_manejo_error(void) {
  port_uart_receive_ExpectAnyArgsAndReturn(PORT_OK);
  UART_RETURN_CHAR('4'); // <--- usar helper

  app_step(); // -> ESTADO_BORRAR_SD
  port_sd_truncate_ExpectAndReturn(PORT_ERR);
  app_step(); // -> ESTADO_ERROR

  port_uart_print_Expect(" Error detectado!\r\n");
  app_step(); // -> vuelve a IDLE
  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}
