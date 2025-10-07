#ifndef PORT_DELAY_H
#define PORT_DELAY_H
#include <stdint.h>
void port_delay_init_mpu(uint32_t ms);
void port_delay_init_adxl(uint32_t ms);
void port_delay_init_sd(uint32_t ms);
int port_delay_read_mpu(void);
int port_delay_read_adxl(void);
int port_delay_read_sd(void);
#endif
