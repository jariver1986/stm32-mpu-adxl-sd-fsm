#ifndef PORT_SD_H
#define PORT_SD_H
#include "port_uart.h"

port_status_t port_sd_init(void);
port_status_t port_sd_open_and_seed(void);
port_status_t port_sd_append_latest(void);
port_status_t port_sd_truncate(void);
port_status_t port_sd_dump_uart(void);

#endif
