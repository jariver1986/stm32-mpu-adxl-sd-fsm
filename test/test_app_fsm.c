#include "unity.h"
#include "app_fsm.h"

#include "mock_port_uart.h"
#include "mock_port_mpu.h"
#include "mock_port_adxl.h"
#include "mock_port_sd.h"
#include "mock_port_delay.h"

// ===== Stub para simular recepción por UART (vía callback) =====
static uint8_t g_forced_uart_char = 0;

static port_status_t uart_receive_stub(uint8_t *buf,
                                       uint16_t len,
                                       uint32_t timeout_ms,
                                       int cmock_num_calls) {
  (void)timeout_ms;
  (void)cmock_num_calls;
  if (buf && (len > 0)) {
    *buf = g_forced_uart_char;
  }
  return PORT_OK;
}

/* Helper: registra el callback y fija el byte a "recibir".
   NOTA: Algunas versiones de CMock generan AddCallback, otras StubWithCallback.
   Usa una; si linkea mal, cambia a la otra (ver comentario abajo). */
static void simulate_uart_rx(uint8_t ch) {
  g_forced_uart_char = ch;

  // Usa UNA de estas dos líneas según lo que te genere CMock:
  port_uart_receive_AddCallback(uart_receive_stub); // <- PRUEBA ESTA PRIMERO
  // port_uart_receive_StubWithCallback(uart_receive_stub); // <- Si la de arriba da "undefined reference", usa esta
}
// ================================================================

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

void test_idle_uart_1_va_a_mpu_y_vuelve_idle_con_delay(void) {
  simulate_uart_rx('1');

  app_step();
  TEST_ASSERT_EQUAL(ESTADO_MPU, app_get_state());

  port_delay_read_mpu_ExpectAndReturn(1);
  port_mpu_read_all_and_printf_Expect();
  app_step();

  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}

void test_borrar_sd_error_y_manejo_error(void) {
  simulate_uart_rx('4');

  app_step(); // -> ESTADO_BORRAR_SD
  port_sd_truncate_ExpectAndReturn(PORT_ERR);
  app_step(); // -> ESTADO_ERROR

  port_uart_print_Expect(" Error detectado!\r\n");
  app_step(); // -> vuelve a IDLE

  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}
