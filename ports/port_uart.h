#ifndef PORT_UART_H
#define PORT_UART_H
#include <stdint.h>

typedef enum { PORT_OK = 0,
               PORT_ERR = -1 } port_status_t;

port_status_t port_uart_receive(uint8_t *buf, uint16_t len, uint32_t timeout_ms);
void port_uart_print(const char *s);

#endif
