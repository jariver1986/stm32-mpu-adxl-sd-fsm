#include "unity.h"
#include "app_fsm.h"

#include "mock_port_uart.h"
#include "mock_port_mpu.h"
#include "mock_port_adxl.h"
#include "mock_port_sd.h"
#include "mock_port_delay.h"

// ======== UART callback stub ========
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

/* Registra el callback y fija el byte a recibir.
 * - Si existe StubWithCallback, lo usamos (no limita # de llamadas).
 * - Si no existe, usamos IgnoreAndReturn + AddCallback para evitar fallos por conteo. */
static void simulate_uart_rx(uint8_t ch) {
  g_forced_uart_char = ch;

#if defined(port_uart_receive_StubWithCallback)
  port_uart_receive_StubWithCallback(uart_receive_stub);
#else
  port_uart_receive_IgnoreAndReturn(PORT_OK);
  port_uart_receive_AddCallback(uart_receive_stub);
#endif
}
// ====================================

void setUp(void) {
  // Expectativas de inicialización que ejecuta app_init()
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

void test_idle_uart_2_va_a_adxl_y_vuelve_idle_con_delay(void) {
  ñañ simulate_uart_rx('2');

  app_step(); // -> ESTADO_ADXL
  TEST_ASSERT_EQUAL(ESTADO_ADXL, app_get_state());

  port_delay_read_adxl_ExpectAndReturn(1);
  port_adxl_read_and_printf_Expect();

  app_step(); // -> IDLE
  TEST_ASSERT_EQUAL(ESTADO_IDLE, app_get_state());
}

// ceedling clobber
// ceedling test:all
