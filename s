[1mdiff --git a/Core/Inc/API_delay.h b/Core/Inc/API_delay.h[m
[1mindex 5be5a2a..5d4d613 100644[m
[1m--- a/Core/Inc/API_delay.h[m
[1m+++ b/Core/Inc/API_delay.h[m
[36m@@ -6,9 +6,9 @@[m
 #ifndef API_DELAY_H[m
 #define API_DELAY_H[m
 [m
[31m-#include <stdint.h>[m
[31m-#include <stdbool.h>[m
 #include "stm32f4xx_hal.h"[m
[32m+[m[32m#include <stdbool.h>[m
[32m+[m[32m#include <stdint.h>[m
 [m
 /**[m
  * @typedef tick_t[m
[36m@@ -77,5 +77,4 @@[m [muint32_t delayGetCompletedCount(void);[m
  */[m
 void delayResetCompletedCount(void);[m
 [m
[31m-[m
 #endif /* API_DELAY_H */[m
[1mdiff --git a/Core/Inc/adxl345.h b/Core/Inc/adxl345.h[m
[1mindex 88859fd..b7d2847 100644[m
[1m--- a/Core/Inc/adxl345.h[m
[1m+++ b/Core/Inc/adxl345.h[m
[36m@@ -22,19 +22,20 @@[m
 /** @defgroup ADXL345_RegMap Mapa de registros del ADXL345[m
  *  @{[m
  */[m
[31m-#define DEVID_R            (0x00)  /**< Dirección del registro de identificación del dispositivo */[m
[31m-#define DEVICE_ADDR        (0x53)  /**< Dirección del dispositivo ADXL345 (no se usa directamente en SPI) */[m
[31m-#define DATA_FORMAT_R      (0x31)  /**< Dirección del registro de formato de datos */[m
[31m-#define POWER_CTL_R        (0x2D)  /**< Dirección del registro de control de energía */[m
[31m-#define DATA_START_ADDR    (0x32)  /**< Dirección inicial para lectura de datos de los ejes */[m
[32m+[m[32m#define DEVID_R (0x00)     /**< Dirección del registro de identificación del dispositivo */[m
[32m+[m[32m#define DEVICE_ADDR (0x53) /**< Dirección del dispositivo ADXL345 (no se usa directamente en SPI) \[m
[32m+[m[32m                            */[m
[32m+[m[32m#define DATA_FORMAT_R (0x31)   /**< Dirección del registro de formato de datos */[m
[32m+[m[32m#define POWER_CTL_R (0x2D)     /**< Dirección del registro de control de energía */[m
[32m+[m[32m#define DATA_START_ADDR (0x32) /**< Dirección inicial para lectura de datos de los ejes */[m
 /** @} */[m
 [m
 /** @defgroup ADXL345_Config Configuraciones del ADXL345[m
  *  @{[m
  */[m
[31m-#define FOUR_G             (0x01)  /**< Configura el rango a ±4g */[m
[31m-#define RESET              (0x00)  /**< Valor de reinicio para ciertos registros */[m
[31m-#define SET_MEASURE_B      (0x08)  /**< Activa el bit de medición en POWER_CTL */[m
[32m+[m[32m#define FOUR_G (0x01)        /**< Configura el rango a ±4g */[m
[32m+[m[32m#define RESET (0x00)         /**< Valor de reinicio para ciertos registros */[m
[32m+[m[32m#define SET_MEASURE_B (0x08) /**< Activa el bit de medición en POWER_CTL */[m
 /** @} */[m
 [m
 /**[m
[36m@@ -54,4 +55,3 @@[m [mvoid adxl_init(void);[m
 void adxl_read(uint8_t address, uint8_t *rxdata);[m
 [m
 #endif /* ADXL345_H_ */[m
[31m-[m
[1mdiff --git a/Core/Inc/fatfs_sd.h b/Core/Inc/fatfs_sd.h[m
[1mindex 04ab3bb..2f36d60 100644[m
[1m--- a/Core/Inc/fatfs_sd.h[m
[1m+++ b/Core/Inc/fatfs_sd.h[m
[36m@@ -9,41 +9,41 @@[m
 #define INC_FATFS_SD_H_[m
 [m
 /* Definitions for MMC/SDC command */[m
[31m-#define CMD0     (0x40+0)     	/* GO_IDLE_STATE */[m
[31m-#define CMD1     (0x40+1)     	/* SEND_OP_COND */[m
[31m-#define CMD8     (0x40+8)     	/* SEND_IF_COND */[m
[31m-#define CMD9     (0x40+9)     	/* SEND_CSD */[m
[31m-#define CMD10    (0x40+10)    	/* SEND_CID */[m
[31m-#define CMD12    (0x40+12)    	/* STOP_TRANSMISSION */[m
[31m-#define CMD16    (0x40+16)    	/* SET_BLOCKLEN */[m
[31m-#define CMD17    (0x40+17)    	/* READ_SINGLE_BLOCK */[m
[31m-#define CMD18    (0x40+18)    	/* READ_MULTIPLE_BLOCK */[m
[31m-#define CMD23    (0x40+23)    	/* SET_BLOCK_COUNT */[m
[31m-#define CMD24    (0x40+24)    	/* WRITE_BLOCK */[m
[31m-#define CMD25    (0x40+25)    	/* WRITE_MULTIPLE_BLOCK */[m
[31m-#define CMD41    (0x40+41)    	/* SEND_OP_COND (ACMD) */[m
[31m-#define CMD55    (0x40+55)    	/* APP_CMD */[m
[31m-#define CMD58    (0x40+58)    	/* READ_OCR */[m
[32m+[m[32m#define CMD0 (0x40 + 0)   /* GO_IDLE_STATE */[m
[32m+[m[32m#define CMD1 (0x40 + 1)   /* SEND_OP_COND */[m
[32m+[m[32m#define CMD8 (0x40 + 8)   /* SEND_IF_COND */[m
[32m+[m[32m#define CMD9 (0x40 + 9)   /* SEND_CSD */[m
[32m+[m[32m#define CMD10 (0x40 + 10) /* SEND_CID */[m
[32m+[m[32m#define CMD12 (0x40 + 12) /* STOP_TRANSMISSION */[m
[32m+[m[32m#define CMD16 (0x40 + 16) /* SET_BLOCKLEN */[m
[32m+[m[32m#define CMD17 (0x40 + 17) /* READ_SINGLE_BLOCK */[m
[32m+[m[32m#define CMD18 (0x40 + 18) /* READ_MULTIPLE_BLOCK */[m
[32m+[m[32m#define CMD23 (0x40 + 23) /* SET_BLOCK_COUNT */[m
[32m+[m[32m#define CMD24 (0x40 + 24) /* WRITE_BLOCK */[m
[32m+[m[32m#define CMD25 (0x40 + 25) /* WRITE_MULTIPLE_BLOCK */[m
[32m+[m[32m#define CMD41 (0x40 + 41) /* SEND_OP_COND (ACMD) */[m
[32m+[m[32m#define CMD55 (0x40 + 55) /* APP_CMD */[m
[32m+[m[32m#define CMD58 (0x40 + 58) /* READ_OCR */[m
 [m
 /* MMC card type flags (MMC_GET_TYPE) */[m
[31m-#define CT_MMC		0x01		/* MMC ver 3 */[m
[31m-#define CT_SD1		0x02		/* SD ver 1 */[m
[31m-#define CT_SD2		0x04		/* SD ver 2 */[m
[31m-#define CT_SDC		0x06		/* SD */[m
[31m-#define CT_BLOCK	0x08		/* Block addressing */[m
[32m+[m[32m#define CT_MMC 0x01   /* MMC ver 3 */[m
[32m+[m[32m#define CT_SD1 0x02   /* SD ver 1 */[m
[32m+[m[32m#define CT_SD2 0x04   /* SD ver 2 */[m
[32m+[m[32m#define CT_SDC 0x06   /* SD */[m
[32m+[m[32m#define CT_BLOCK 0x08 /* Block addressing */[m
 [m
 /* Functions */[m
[31m-DSTATUS SD_disk_initialize (BYTE pdrv);[m
[31m-DSTATUS SD_disk_status (BYTE pdrv);[m
[31m-DRESULT SD_disk_read (BYTE pdrv, BYTE* buff, DWORD sector, UINT count);[m
[31m-DRESULT SD_disk_write (BYTE pdrv, const BYTE* buff, DWORD sector, UINT count);[m
[31m-DRESULT SD_disk_ioctl (BYTE pdrv, BYTE cmd, void* buff);[m
[32m+[m[32mDSTATUS SD_disk_initialize(BYTE pdrv);[m
[32m+[m[32mDSTATUS SD_disk_status(BYTE pdrv);[m
[32m+[m[32mDRESULT SD_disk_read(BYTE pdrv, BYTE *buff, DWORD sector, UINT count);[m
[32m+[m[32mDRESULT SD_disk_write(BYTE pdrv, const BYTE *buff, DWORD sector, UINT count);[m
[32m+[m[32mDRESULT SD_disk_ioctl(BYTE pdrv, BYTE cmd, void *buff);[m
 [m
 #define SPI_TIMEOUT 100[m
 [m
 extern SPI_HandleTypeDef hspi2;[m
 #define HSPI_SDCARD &hspi2[m
[31m-#define	SD_CS_PORT			GPIOA[m
[31m-#define SD_CS_PIN			GPIO_PIN_4[m
[32m+[m[32m#define SD_CS_PORT GPIOA[m
[32m+[m[32m#define SD_CS_PIN GPIO_PIN_4[m
 [m
 #endif /* INC_FATFS_SD_H_ */[m
[1mdiff --git a/Core/Inc/lcd_i2c.h b/Core/Inc/lcd_i2c.h[m
[1mindex fe2bb16..2ba2195 100644[m
[1m--- a/Core/Inc/lcd_i2c.h[m
[1m+++ b/Core/Inc/lcd_i2c.h[m
[36m@@ -13,7 +13,7 @@[m
 [m
 // Dirección del LCD (PCF8574)[m
 // ⚠️ Si tu módulo tiene dirección 0x3F en vez de 0x27, cámbialo aquí[m
[31m-#define LCD_I2C_ADDR (0x27 << 1)  // Dirección de 7 bits << 1 para HAL[m
[32m+[m[32m#define LCD_I2C_ADDR (0x27 << 1) // Dirección de 7 bits << 1 para HAL[m
 [m
 // Inicializa el LCD (modo 4 bits)[m
 void LCD_Init(I2C_HandleTypeDef *hi2c);[m
[1mdiff --git a/Core/Inc/main.h b/Core/Inc/main.h[m
[1mindex dc137b5..5af2c2e 100644[m
[1m--- a/Core/Inc/main.h[m
[1m+++ b/Core/Inc/main.h[m
[36m@@ -1,21 +1,21 @@[m
 /* USER CODE BEGIN Header */[m
 /**[m
[31m-  ******************************************************************************[m
[31m-  * @file           : main.h[m
[31m-  * @brief          : Header for main.c file.[m
[31m-  *                   This file contains the common defines of the application.[m
[31m-  ******************************************************************************[m
[31m-  * @attention[m
[31m-  *[m
[31m-  * Copyright (c) 2025 STMicroelectronics.[m
[31m-  * All rights reserved.[m
[31m-  *[m
[31m-  * This software is licensed under terms that can be found in the LICENSE file[m
[31m-  * in the root directory of this software component.[m
[31m-  * If no LICENSE file comes with this software, it is provided AS-IS.[m
[31m-  *[m
[31m-  ******************************************************************************[m
[31m-  */[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m * @file           : main.h[m
[32m+[m[32m * @brief          : Header for main.c file.[m
[32m+[m[32m *                   This file contains the common defines of the application.[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m * @attention[m
[32m+[m[32m *[m
[32m+[m[32m * Copyright (c) 2025 STMicroelectronics.[m
[32m+[m[32m * All rights reserved.[m
[32m+[m[32m *[m
[32m+[m[32m * This software is licensed under terms that can be found in the LICENSE file[m
[32m+[m[32m * in the root directory of this software component.[m
[32m+[m[32m * If no LICENSE file comes with this software, it is provided AS-IS.[m
[32m+[m[32m *[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m */[m
 /* USER CODE END Header */[m
 [m
 /* Define to prevent recursive inclusion -------------------------------------*/[m
[1mdiff --git a/Core/Inc/stm32f4xx_hal_conf.h b/Core/Inc/stm32f4xx_hal_conf.h[m
[1mindex 1f3f822..78b8118 100644[m
[1m--- a/Core/Inc/stm32f4xx_hal_conf.h[m
[1m+++ b/Core/Inc/stm32f4xx_hal_conf.h[m
[36m@@ -1,23 +1,23 @@[m
 /* USER CODE BEGIN Header */[m
 /**[m
[31m-  ******************************************************************************[m
[31m-  * @file    stm32f4xx_hal_conf_template.h[m
[31m-  * @author  MCD Application Team[m
[31m-  * @brief   HAL configuration template file.[m
[31m-  *          This file should be copied to the application folder and renamed[m
[31m-  *          to stm32f4xx_hal_conf.h.[m
[31m-  ******************************************************************************[m
[31m-  * @attention[m
[31m-  *[m
[31m-  * Copyright (c) 2017 STMicroelectronics.[m
[31m-  * All rights reserved.[m
[31m-  *[m
[31m-  * This software is licensed under terms that can be found in the LICENSE file[m
[31m-  * in the root directory of this software component.[m
[31m-  * If no LICENSE file comes with this software, it is provided AS-IS.[m
[31m-  *[m
[31m-  ******************************************************************************[m
[31m-  */[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m * @file    stm32f4xx_hal_conf_template.h[m
[32m+[m[32m * @author  MCD Application Team[m
[32m+[m[32m * @brief   HAL configuration template file.[m
[32m+[m[32m *          This file should be copied to the application folder and renamed[m
[32m+[m[32m *          to stm32f4xx_hal_conf.h.[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m * @attention[m
[32m+[m[32m *[m
[32m+[m[32m * Copyright (c) 2017 STMicroelectronics.[m
[32m+[m[32m * All rights reserved.[m
[32m+[m[32m *[m
[32m+[m[32m * This software is licensed under terms that can be found in the LICENSE file[m
[32m+[m[32m * in the root directory of this software component.[m
[32m+[m[32m * If no LICENSE file comes with this software, it is provided AS-IS.[m
[32m+[m[32m *[m
[32m+[m[32m ******************************************************************************[m
[32m+[m[32m */[m
 /* USER CODE END Header */[m
 [m
 /* Define to prevent recursive inclusion -------------------------------------*/[m
[36m@@ -25,7 +25,7 @@[m
 #define __STM32F4xx_HAL_CONF_H[m
 [m
 #ifdef __cplusplus[m
[31m- extern "C" {[m
[32m+[m[32mextern "C" {[m
 #endif[m
 [m
 /* Exported types ------------------------------------------------------------*/[m
[36m@@ -33,11 +33,11 @@[m
 [m
 /* ########################## Module Selection ############################## */[m
 /**[m
[31m-  * @brief This is the list of modules to be used in the HAL driver[m
[31m-  */[m
[32m+[m[32m * @brief This is the list of modules to be used in the HAL driver[m
[32m+[m[32m */[m
 #define HAL_MODULE_ENABLED[m
 [m
[31m-  /* #define HAL_CRYP_MODULE_ENABLED */[m
[32m+[m[32m/* #define HAL_CRYP_MODULE_ENABLED */[m
 /* #define HAL_ADC_MODULE_ENABLED */[m
 /* #define HAL_CAN_MODULE_ENABLED */[m
 /* #define HAL_CRC_MODULE_ENABLED */[m
[36m@@ -90,114 +90,114 @@[m
 [m
 /* ########################## HSE/HSI Values adaptation ##################### */[m
 /**[m
[31m-  * @brief Adjust the value of External High Speed oscillator (HSE) used in your application.[m
[31m-  *        This value is used by the RCC HAL module to compute the system frequency[m
[31m-  *        (when HSE is used as system clock source, directly or through the PLL).[m
[31m-  */[m
[31m-#if !defined  (HSE_VALUE)[m
[31m-  #define HSE_VALUE    8000000U /*!< Value of the External oscillator in Hz */[m
[31m-#endif /* HSE_VALUE */[m
[31m-[m
[31m-#if !defined  (HSE_STARTUP_TIMEOUT)[m
[31m-  #define HSE_STARTUP_TIMEOUT    100U   /*!< Time out for HSE start up, in ms */[m
[31m-#endif /* HSE_STARTUP_TIMEOUT */[m
[32m+[m[32m * @brief Adjust the value of External High Speed oscillator (HSE) used in your application.[m
[32m+[m[32m *        This value is used by the RCC HAL module to compute the system frequency[m
[32m+[m[32m *        (when HSE is used as system clock source, directly or through the PLL).[m
[32m+[m[32m */[m
[32m+[m[32m#if !defined(HSE_VALUE)[m
[32m+[m[32m#define HSE_VALUE 8000000U /*!< Value of the External oscillator in Hz */[m
[32m+[m[32m#endif                     /* HSE_VALUE */[m
[32m+[m
[32m+[m[32m#if !defined(HSE_STARTUP_TIMEOUT)[m
[32m+[m[32m#define HSE_STARTUP_TIMEOUT 100U /*!< Time out for HSE start up, in ms */[m
[32m+[m[32m#endif                           /* HSE_STARTUP_TIMEOUT */[m
 [m
 /**[m
[31m-  * @brief Internal High Speed oscillator (HSI) value.[m
[31m-  *        This value is used by the RCC HAL module to compute the system frequency[m
[31m-  *        (when HSI is used as system clock source, directly or through the PLL).[m
[31m-  */[m
[31m-#if !defined  (HSI_VALUE)[m
[31m-  #define HSI_VALUE    ((uint32_t)16000000U) /*!< Value of the Internal oscillator in Hz*/[m
[31m-#endif /* HSI_VALUE */[m
[32m+[m[32m * @brief Internal High Speed oscillator (HSI) value.[m
[32m+[m[32m *        This value is used by the RCC HAL module to compute the system frequency[m
[32m+[m[32m *        (when HSI is used as system clock source, directly or through the PLL).[m
[32m+[m[32m */[m
[32m+[m[32m#if !defined(HSI_VALUE)[m
[32m+[m[32m#define HSI_VALUE ((uint32_t)16000000U) /*!< Value of the Internal oscillator in Hz*/[m
[32m+[m[32m#endif                                  /* HSI_VALUE */[m
 [m
 /**[m
[31m-  * @brief Internal Low Speed oscillator (LSI) value.[m
[31m-  */[m
[31m-#if !defined  (LSI_VALUE)[m
[31m- #define LSI_VALUE  32000U       /*!< LSI Typical Value in Hz*/[m
[31m-#endif /* LSI_VALUE */                      /*!< Value of the Internal Low Speed oscillator in Hz[m
[31m-                                             The real value may vary depending on the variations[m
[31m-                                             in voltage and temperature.*/[m
[32m+[m[32m * @brief Internal Low Speed oscillator (LSI) value.[m
[32m+[m[32m */[m
[32m+[m[32m#if !defined(LSI_VALUE)[m
[32m+[m[32m#define LSI_VALUE 32000U /*!< LSI Typical Value in Hz*/[m
[32m+[m[32m#endif /* LSI_VALUE */   /*!< Value of the Internal Low Speed oscillator in Hz                     \[m
[32m+[m[32m                          The real value may vary depending on the variations                      \[m
[32m+[m[32m                          in voltage and temperature.*/[m
 /**[m
[31m-  * @brief External Low Speed oscillator (LSE) value.[m
[31m-  */[m
[31m-#if !defined  (LSE_VALUE)[m
[31m- #define LSE_VALUE  32768U    /*!< Value of the External Low Speed oscillator in Hz */[m
[31m-#endif /* LSE_VALUE */[m
[32m+[m[32m * @brief External Low Speed oscillator (LSE) value.[m
[32m+[m[32m */[m
[32m+[m[32m#if !defined(LSE_VALUE)[m
[32m+[m[32m#define LSE_VALUE 32768U /*!< Value of the External Low Speed oscillator in Hz */[m
[32m+[m[32m#endif                   /* LSE_VALUE */[m
 [m
[31m-#if !defined  (LSE_STARTUP_TIMEOUT)[m
[31m-  #define LSE_STARTUP_TIMEOUT    5000U   /*!< Time out for LSE start up, in ms */[m
[31m-#endif /* LSE_STARTUP_TIMEOUT */[m
[32m+[m[32m#if !defined(LSE_STARTUP_TIMEOUT)[m
[32m+[m[32m#define LSE_STARTUP_TIMEOUT 5000U /*!< Time out for LSE start up, in ms */[m
[32m+[m[32m#endif                            /* LSE_STARTUP_TIMEOUT */[m
 [m
 /**[m
[31m-  * @brief External clock source for I2S peripheral[m
[31m-  *        This value is used by the I2S HAL module to compute the I2S clock source[m
[31m-  *        frequency, this source is inserted directly through I2S_CKIN pad.[m
[31m-  */[m
[31m-#if !defined  (EXTERNAL_CLOCK_VALUE)[m
[31m-  #define EXTERNAL_CLOCK_VALUE    12288000U /*!< Value of the External audio frequency in Hz*/[m
[31m-#endif /* EXTERNAL_CLOCK_VALUE */[m
[32m+[m[32m * @brief External clock source for I2S peripheral[m
[32m+[m[32m *        This value is used by the I2S HAL module to compute the I2S clock source[m
[32m+[m[32m *        frequency, this source is inserted directly through I2S_CKIN pad.[m
[32m+[m[32m */[m
[32m+[m[32m#if !defined(EXTERNAL_CLOCK_VALUE)[m
[32m+[m[32m#define EXTERNAL_CLOCK_VALUE 12288000U /*!< Value of the External audio frequency in Hz*/[m
[32m+[m[32m#endif                                 /* EXTERNAL_CLOCK_VALUE */[m
 [m
 /* Tip: To avoid modifying this file each time you need to use different HSE,[m
    ===  you can define the HSE value in your toolchain compiler preprocessor. */[m
 [m
 /* ########################### System Configuration ######################### */[m
 /**[m
[31m-  * @brief This is the HAL system configuration section[m
[31m-  */[m
[31m-#define  VDD_VALUE		      3300U /*!< Value of VDD in mv */[m
[31m-#define  TICK_INT_PRIORITY            0U   /*!< tick interrupt priority */[m
[31m-#define  USE_RTOS                     0U[m
[31m-#define  PREFETCH_ENABLE              1U[m
[31m-#define  INSTRUCTION_CACHE_ENABLE     1U[m
[31m-#define  DATA_CACHE_ENABLE            1U[m
[31m-[m
[31m-#define  USE_HAL_ADC_REGISTER_CALLBACKS         0U /* ADC register callback disabled       */[m
[31m-#define  USE_HAL_CAN_REGISTER_CALLBACKS         0U /* CAN register callback disabled       */[m
[31m-#define  USE_HAL_CEC_REGISTER_CALLBACKS         0U /* CEC register callback disabled       */[m
[31m-#define  USE_HAL_CRYP_REGISTER_CALLBACKS        0U /* CRYP register callback disabled      */[m
[31m-#define  USE_HAL_DAC_REGISTER_CALLBACKS         0U /* DAC register callback disabled       */[m
[31m-#define  USE_HAL_DCMI_REGISTER_CALLBACKS        0U /* DCMI register callback disabled      */[m
[31m-#define  USE_HAL_DFSDM_REGISTER_CALLBACKS       0U /* DFSDM register callback disabled     */[m
[31m-#define  USE_HAL_DMA2D_REGISTER_CALLBACKS       0U /* DMA2D register callback disabled     */[m
[31m-#define  USE_HAL_DSI_REGISTER_CALLBACKS         0U /* DSI register callback disabled       */[m
[31m-#define  USE_HAL_ETH_REGISTER_CALLBACKS         0U /* ETH register callback disabled       */[m
[31m-#define  USE_HAL_HASH_REGISTER_CALLBACKS        0U /* HASH register callback disabled      */[m
[31m-#define  USE_HAL_HCD_REGISTER_CALLBACKS         0U /* HCD register callback disabled       */[m
[31m-#define  USE_HAL_I2C_REGISTER_CALLBACKS         0U /* I2C register callback disabled       */[m
[31m-#define  USE_HAL_FMPI2C_REGISTER_CALLBACKS      0U /* FMPI2C register callback disabled    */[m
[31m-#define  USE_HAL_FMPSMBUS_REGISTER_CALLBACKS    0U /* FMPSMBUS register callback disabled  */[m
[31m-#define  USE_HAL_I2S_REGISTER_CALLBACKS         0U /* I2S register callback disabled       */[m
[31m-#define  USE_HAL_IRDA_REGISTER_CALLBACKS        0U /* IRDA register callback disabled      */[m
[31m-#define  USE_HAL_LPTIM_REGISTER_CALLBACKS       0U /* LPTIM register callback disabled     */[m
[31m-#define  USE_HAL_LTDC_REGISTER_CALLBACKS        0U /* LTDC register callback disabled      */[m
[31m-#define  USE_HAL_MMC_REGISTER_CALLBACKS         0U /* MMC register callback disabled       */[m
[31m-#define  USE_HAL_NAND_REGISTER_CALLBACKS        0U /* NAND register callback disabled      */[m
[31m-#define  USE_HAL_NOR_REGISTER_CALLBACKS         0U /* NOR register callback disabled       */[m
[31m-#define  USE_HAL_PCCARD_REGISTER_CALLBACKS      0U /* PCCARD register callback disabled    */[m
[31m-#define  USE_HAL_PCD_REGISTER_CALLBACKS         0U /* PCD register callback disabled       */[m
[31m-#define  USE_HAL_QSPI_REGISTER_CALLBACKS        0U /* QSPI register callback disabled      */[m
[31m-#define  USE_HAL_RNG_REGISTER_CALLBACKS         0U /* RNG register callback disabled       */[m
[31m-#define  USE_HAL_RTC_REGISTER_CALLBACKS         0U /* RTC register callback disabled       */[m
[31m-#define  USE_HAL_SAI_REGISTER_CALLBACKS         0U /* SAI register callback disabled       */[m
[31m-#define  USE_HAL_SD_REGISTER_CALLBACKS          0U /* SD register callback disabled        */[m
[31m-#define  USE_HAL_SMARTCARD_REGISTER_CALLBACKS   0U /* SMARTCARD register callback disabled */[m
[31m-#define  USE_HAL_SDRAM_REGISTER_CALLBACKS       0U /* SDRAM register callback disabled     */[m
[31m-#define  USE_HAL_SRAM_REGISTER_CALLBACKS        0U /* SRAM register callback disabled      */[m
[31m-#define  USE_HAL_SPDIFRX_REGISTER_CALLBACKS     0U /* SPDIFRX register callback disabled   */[m
[31m-#define  USE_HAL_SMBUS_REGISTER_CALLBACKS       0U /* SMBUS register callback disabled     */[m
[31m-#define  USE_HAL_SPI_REGISTER_CALLBACKS         0U /* SPI register callback disabled       */[m
[31m-#define  USE_HAL_TIM_REGISTER_CALLBACKS         0U /* TIM register callback disabled       */[m
[31m-#define  USE_HAL_UART_REGISTER_CALLBACKS        0U /* UART register callback disabled      */[m
[31m-#define  USE_HAL_USART_REGISTER_CALLBACKS       0U /* USART register callback disabled     */[m
[31m-#define  USE_HAL_WWDG_REGISTER_CALLBACKS        0U /* WWDG register callback disabled      */[m
[32m+[m[32m * @brief This is the HAL system configuration section[m
[32m+[m[32m */[m
[32m+[m[32m#define VDD_VALUE 3300U      /*!< Value of VDD in mv */[m
[32m+[m[32m#define TICK_INT_PRIORITY 0U /*!< tick interrupt priority */[m
[32m+[m[32m#define USE_RTOS 0U[m
[32m+[m[32m#define PREFETCH_ENABLE 1U[m
[32m+[m[32m#define INSTRUCTION_CACHE_ENABLE 1U[m
[32m+[m[32m#define DATA_CACHE_ENABLE 1U[m
[32m+[m
[32m+[m[32m#define USE_HAL_ADC_REGISTER_CALLBACKS 0U       /* ADC register callback disabled       */[m
[32m+[m[32m#define USE_HAL_CAN_REGISTER_CALLBACKS 0U       /* CAN register callback disabled       */[m
[32m+[m[32m#define USE_HAL_CEC_REGISTER_CALLBACKS 0U       /* CEC register callback disabled       */[m
[32m+[m[32m#define USE_HAL_CRYP_REGISTER_CALLBACKS 0U      /* CRYP register callback disabled      */[m
[32m+[m[32m#define USE_HAL_DAC_REGISTER_CALLBACKS 0U       /* DAC register callback disabled       */[m
[32m+[m[32m#define USE_HAL_DCMI_REGISTER_CALLBACKS 0U      /* DCMI register callback disabled      */[m
[32m+[m[32m#define USE_HAL_DFSDM_REGISTER_CALLBACKS 0U     /* DFSDM register callback disabled     */[m
[32m+[m[32m#define USE_HAL_DMA2D_REGISTER_CALLBACKS 0U     /* DMA2D register callback disabled     */[m
[32m+[m[32m#define USE_HAL_DSI_REGISTER_CALLBACKS 0U       /* DSI register callback disabled       */[m
[32m+[m[32m#define USE_HAL_ETH_REGISTER_CALLBACKS 0U       /* ETH register callback disabled       */[m
[32m+[m[32m#define USE_HAL_HASH_REGISTER_CALLBACKS 0U      /* HASH register callback disabled      */[m
[32m+[m[32m#define USE_HAL_HCD_REGISTER_CALLBACKS 0U       /* HCD register callback disabled       */[m
[32m+[m[32m#define USE_HAL_I2C_REGISTER_CALLBACKS 0U       /* I2C register callback disabled       */[m
[32m+[m[32m#define USE_HAL_FMPI2C_REGISTER_CALLBACKS 0U    /* FMPI2C register callback disabled    */[m
[32m+[m[32m#define USE_HAL_FMPSMBUS_REGISTER_CALLBACKS 0U  /* FMPSMBUS register callback disabled  */[m
[32m+[m[32m#define USE_HAL_I2S_REGISTER_CALLBACKS 0U       /* I2S register callback disabled       */[m
[32m+[m[32m#define USE_HAL_IRDA_REGISTER_CALLBACKS 0U      /* IRDA register callback disabled      */[m
[32m+[m[32m#define USE_HAL_LPTIM_REGISTER_CALLBACKS 0U     /* LPTIM register callback disabled     */[m
[32m+[m[32m#define USE_HAL_LTDC_REGISTER_CALLBACKS 0U      /* LTDC register callback disabled      */[m
[32m+[m[32m#define USE_HAL_MMC_REGISTER_CALLBACKS 0U       /* MMC register callback disabled       */[m
[32m+[m[32m#define USE_HAL_NAND_REGISTER_CALLBACKS 0U      /* NAND register callback disabled      */[m
[32m+[m[32m#define USE_HAL_NOR_REGISTER_CALLBACKS 0U       /* NOR register callback disabled       */[m
[32m+[m[32m#define USE_HAL_PCCARD_REGISTER_CALLBACKS 0U    /* PCCARD register callback disabled    */[m
[32m+[m[32m#define USE_HAL_PCD_REGISTER_CALLBACKS 0U       /* PCD register callback disabled       */[m
[32m+[m[32m#define USE_HAL_QSPI_REGISTER_CALLBACKS 0U      /* QSPI register callback disabled      */[m
[32m+[m[32m#define USE_HAL_RNG_REGISTER_CALLBACKS 0U       /* RNG register callback disabled       */[m
[32m+[m[32m#define USE_HAL_RTC_REGISTER_CALLBACKS 0U       /* RTC register callback disabled       */[m
[32m+[m[32m#define USE_HAL_SAI_REGISTER_CALLBACKS 0U       /* SAI register callback disabled       */[m
[32m+[m[32m#define USE_HAL_SD_REGISTER_CALLBACKS 0U        /* SD register callback disabled        */[m
[32m+[m[32m#define USE_HAL_SMARTCARD_REGISTER_CALLBACKS 0U /* SMARTCARD register callback disabled */[m
[32m+[m[32m#define USE_HAL_SDRAM_REGISTER_CALLBACKS 0U     /* SDRAM register callback disabled     */[m
[32m+[m[32m#define USE_HAL_SRAM_REGISTER_CALLBACKS 0U      /* SRAM register callback disabled      */[m
[32m+[m[32m#define USE_HAL_SPDIFRX_REGISTER_CALLBACKS 0U   /* SPDIFRX register callback disabled   */[m
[32m+[m[32m#define USE_HAL_SMBUS_REGISTER_CALLBACKS 0U     /* SMBUS register callback disabled     */[m
[32m+[m[32m#define USE_HAL_SPI_REGISTER_CALLBACKS 0U       /* SPI register callback disabled       */[m
[32m+[m[32m#define USE_HAL_TIM_REGISTER_CALLBACKS 0U       /* TIM register callback disabled       */[m
[32m+[m[32m#define USE_HAL_UART_REGISTER_CALLBACKS 0U      /* UART register callback disabled      */[m
[32m+[m[32m#define USE_HAL_USART_REGISTER_CALLBACKS 0U     /* USART register callback disabled     */[m
[32m+[m[32m#define USE_HAL_WWDG_REGISTER_CALLBACKS 0U      /* WWDG register callback disabled      */[m
 [m
 /* ########################## Assert Selection ############################## */[m
 /**[m
[31m-  * @brief Uncomment the line below to expanse the "assert_param" macro in the[m
[31m-  *        HAL drivers code[m
[31m-  */[m
[32m+[m[32m * @brief Uncomment the line below to expanse the "assert_param" macro in the[m
[32m+[m[32m *        HAL drivers code[m
[32m+[m[32m */[m
 /* #define USE_FULL_ASSERT    1U */[m
 [m
 /* ################## Ethernet peripheral configuration ##################### */[m
[36m@@ -205,282 +205,283 @@[m
 /* Section 1 : Ethernet peripheral configuration */[m
 [m
 /* MAC ADDRESS: MAC_ADDR0:MAC_ADDR1:MAC_ADDR2:MAC_ADDR3:MAC_ADDR4:MAC_ADDR5 */[m
[31m-#define MAC_ADDR0   2U[m
[31m-#define MAC_ADDR1   0U[m
[31m-#define MAC_ADDR2   0U[m
[31m-#define MAC_ADDR3   0U[m
[31m-#define MAC_ADDR4   0U[m
[31m-#define MAC_ADDR5   0U[m
[32m+[m[32m#define MAC_ADDR0 2U[m
[32m+[m[32m#define MAC_ADDR1 0U[m
[32m+[m[32m#define MAC_ADDR2 0U[m
[32m+[m[32m#define MAC_ADDR3 0U[m
[32m+[m[32m#define MAC_ADDR4 0U[m
[32m+[m[32m#define MAC_ADDR5 0U[m
 [m
 /* Definition of the Ethernet driver buffers size and count */[m
[31m-#define ETH_RX_BUF_SIZE                 /* buffer size for receive               */[m
[31m-#define ETH_TX_BUF_SIZE                ETH_MAX_PACKET_SIZE /* buffer size for transmit              */[m
[31m-#define ETH_RXBUFNB                    4U       /* 4 Rx buffers of size ETH_RX_BUF_SIZE  */[m
[31m-#define ETH_TXBUFNB                    4U       /* 4 Tx buffers of size ETH_TX_BUF_SIZE  */[m
[32m+[m[32m#define ETH_RX_BUF_SIZE                     /* buffer size for receive               */[m
[32m+[m[32m#define ETH_TX_BUF_SIZE ETH_MAX_PACKET_SIZE /* buffer size for transmit              */[m
[32m+[m[32m#define ETH_RXBUFNB 4U                      /* 4 Rx buffers of size ETH_RX_BUF_SIZE  */[m
[32m+[m[32m#define ETH_TXBUFNB 4U                      /* 4 Tx buffers of size ETH_TX_BUF_SIZE  */[m
 [m
 /* Section 2: PHY configuration section */[m
 [m
 /* DP83848_PHY_ADDRESS Address*/[m
[31m-#define DP83848_PHY_ADDRESS           0x01U[m
[32m+[m[32m#define DP83848_PHY_ADDRESS 0x01U[m
 /* PHY Reset delay these values are based on a 1 ms Systick interrupt*/[m
[31m-#define PHY_RESET_DELAY                 0x000000FFU[m
[32m+[m[32m#define PHY_RESET_DELAY 0x000000FFU[m
 /* PHY Configuration delay */[m
[31m-#define PHY_CONFIG_DELAY                0x00000FFFU[m
[32m+[m[32m#define PHY_CONFIG_DELAY 0x00000FFFU[m
 [m
[31m-#define PHY_READ_TO                     0x0000FFFFU[m
[31m-#define PHY_WRITE_TO                    0x0000FFFFU[m
[32m+[m[32m#define PHY_READ_TO 0x0000FFFFU[m
[32m+[m[32m#define PHY_WRITE_TO 0x0000FFFFU[m
 [m
 /* Section 3: Common PHY Registers */[m
 [m
[31m-#define PHY_BCR                         ((uint16_t)0x0000U)    /*!< Transceiver Basic Control Register   */[m
[31m-#define PHY_BSR                         ((uint16_t)0x0001U)    /*!< Transceiver Basic Status Register    */[m
[32m+[m[32m#define PHY_BCR ((uint16_t)0x0000U) /*!< Transceiver Basic Control Register   */[m
[32m+[m[32m#define PHY_BSR ((uint16_t)0x0001U) /*!< Transceiver Basic Status Register    */[m
 [m
[31m-#define PHY_RESET                       ((uint16_t)0x8000U)  /*!< PHY Reset */[m
[31m-#define PHY_LOOPBACK                    ((uint16_t)0x4000U)  /*!< Select loop-back mode */[m
[31m-#define PHY_FULLDUPLEX_100M             ((uint16_t)0x2100U)  /*!< Set the full-duplex mode at 100 Mb/s */[m
[31m-#define PHY_HALFDUPLEX_100M             ((uint16_t)0x2000U)  /*!< Set the half-duplex mode at 100 Mb/s */[m
[31m-#define PHY_FULLDUPLEX_10M              ((uint16_t)0x0100U)  /*!< Set the full-duplex mode at 10 Mb/s  */[m
[31m-#define PHY_HALFDUPLEX_10M              ((uint16_t)0x0000U)  /*!< Set the half-duplex mode at 10 Mb/s  */[m
[31m-#define PHY_AUTONEGOTIATION             ((uint16_t)0x1000U)  /*!< Enable auto-negotiation function     */[m
[31m-#define PHY_RESTART_AUTONEGOTIATION     ((uint16_t)0x0200U)  /*!< Restart auto-negotiation function    */[m
[31m-#define PHY_POWERDOWN                   ((uint16_t)0x0800U)  /*!< Select the power down mode           */[m
[31m-#define PHY_ISOLATE                     ((uint16_t)0x0400U)  /*!< Isolate PHY from MII                 */[m
[32m+[m[32m#define PHY_RESET ((uint16_t)0x8000U)                   /*!< PHY Reset */[m
[32m+[m[32m#define PHY_LOOPBACK ((uint16_t)0x4000U)                /*!< Select loop-back mode */[m
[32m+[m[32m#define PHY_FULLDUPLEX_100M ((uint16_t)0x2100U)         /*!< Set the full-duplex mode at 100 Mb/s */[m
[32m+[m[32m#define PHY_HALFDUPLEX_100M ((uint16_t)0x2000U)         /*!< Set the half-duplex mode at 100 Mb/s */[m
[32m+[m[32m#define PHY_FULLDUPLEX_10M ((uint16_t)0x0100U)          /*!< Set the full-duplex mode at 10 Mb/s  */[m
[32m+[m[32m#define PHY_HALFDUPLEX_10M ((uint16_t)0x0000U)          /*!< Set the half-duplex mode at 10 Mb/s  */[m
[32m+[m[32m#define PHY_AUTONEGOTIATION ((uint16_t)0x1000U)         /*!< Enable auto-negotiation function     */[m
[32m+[m[32m#define PHY_RESTART_AUTONEGOTIATION ((uint16_t)0x0200U) /*!< Restart auto-negotiation function */[m
[32m+[m[32m#define PHY_POWERDOWN ((uint16_t)0x0800U)               /*!< Select the power down mode           */[m
[32m+[m[32m#define PHY_ISOLATE ((uint16_t)0x0400U)                 /*!< Isolate PHY from MII                 */[m
 [m
[31m-#define PHY_AUTONEGO_COMPLETE           ((uint16_t)0x0020U)  /*!< Auto-Negotiation process completed   */[m
[31m-#define PHY_LINKED_STATUS               ((uint16_t)0x0004U)  /*!< Valid link established               */[m
[31m-#define PHY_JABBER_DETECTION            ((uint16_t)0x0002U)  /*!< Jabber condition detected            */[m
[32m+[m[32m#define PHY_AUTONEGO_COMPLETE ((uint16_t)0x0020U) /*!< Auto-Negotiation process completed   */[m
[32m+[m[32m#define PHY_LINKED_STATUS ((uint16_t)0x0004U)     /*!< Valid link established               */[m
[32m+[m[32m#define PHY_JABBER_DETECTION ((uint16_t)0x0002U)  /*!< Jabber condition detected            */[m
 [m
 /* Section 4: Extended PHY Registers */[m
[31m-#define PHY_SR                          ((uint16_t)0x10U)    /*!< PHY status register Offset                      */[m
[32m+[m[32m#define PHY_SR ((uint16_t)0x10U) /*!< PHY status register Offset                      */[m
 [m
[31m-#define PHY_SPEED_STATUS                ((uint16_t)0x0002U)  /*!< PHY Speed mask                                  */[m
[31m-#define PHY_DUPLEX_STATUS               ((uint16_t)0x0004U)  /*!< PHY Duplex mask                                 */[m
[32m+[m[32m#define PHY_SPEED_STATUS ((uint16_t)0x0002U) /*!< PHY Speed mask */[m
[32m+[m[32m#define PHY_DUPLEX_STATUS                                                                          \[m
[32m+[m[32m    ((uint16_t)0x0004U) /*!< PHY Duplex mask                                 */[m
 [m
 /* ################## SPI peripheral configuration ########################## */[m
 [m
 /* CRC FEATURE: Use to activate CRC feature inside HAL SPI Driver[m
[31m-* Activated: CRC code is present inside driver[m
[31m-* Deactivated: CRC code cleaned from driver[m
[31m-*/[m
[32m+[m[32m * Activated: CRC code is present inside driver[m
[32m+[m[32m * Deactivated: CRC code cleaned from driver[m
[32m+[m[32m */[m
 [m
[31m-#define USE_SPI_CRC                     0U[m
[32m+[m[32m#define USE_SPI_CRC 0U[m
 [m
 /* Includes ------------------------------------------------------------------*/[m
 /**[m
[31m-  * @brief Include module's header file[m
[31m-  */[m
[32m+[m[32m * @brief Include module's header file[m
[32m+[m[32m */[m
 [m
 #ifdef HAL_RCC_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_rcc.h"[m
[32m+[m[32m#include "stm32f4xx_hal_rcc.h"[m
 #endif /* HAL_RCC_MODULE_ENABLED */[m
 [m
 #ifdef HAL_GPIO_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_gpio.h"[m
[32m+[m[32m#include "stm32f4xx_hal_gpio.h"[m
 #endif /* HAL_GPIO_MODULE_ENABLED */[m
 [m
 #ifdef HAL_EXTI_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_exti.h"[m
[32m+[m[32m#include "stm32f4xx_hal_exti.h"[m
 #endif /* HAL_EXTI_MODULE_ENABLED */[m
 [m
 #ifdef HAL_DMA_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_dma.h"[m
[32m+[m[32m#include "stm32f4xx_hal_dma.h"[m
 #endif /* HAL_DMA_MODULE_ENABLED */[m
 [m
 #ifdef HAL_CORTEX_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_cortex.h"[m
[32m+[m[32m#include "stm32f4xx_hal_cortex.h"[m
 #endif /* HAL_CORTEX_MODULE_ENABLED */[m
 [m
 #ifdef HAL_ADC_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_adc.h"[m
[32m+[m[32m#include "stm32f4xx_hal_adc.h"[m
 #endif /* HAL_ADC_MODULE_ENABLED */[m
 [m
 #ifdef HAL_CAN_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_can.h"[m
[32m+[m[32m#include "stm32f4xx_hal_can.h"[m
 #endif /* HAL_CAN_MODULE_ENABLED */[m
 [m
 #ifdef HAL_CAN_LEGACY_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_can_legacy.h"[m
[32m+[m[32m#include "stm32f4xx_hal_can_legacy.h"[m
 #endif /* HAL_CAN_LEGACY_MODULE_ENABLED */[m
 [m
 #ifdef HAL_CRC_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_crc.h"[m
[32m+[m[32m#include "stm32f4xx_hal_crc.h"[m
 #endif /* HAL_CRC_MODULE_ENABLED */[m
 [m
 #ifdef HAL_CRYP_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_hal_cryp.h"[m
[32m+[m[32m#include "stm32f4xx_hal_cryp.h"[m
 #endif /* HAL_CRYP_MODULE_ENABLED */[m
 [m
 #ifdef HAL_DMA2D_MODULE_ENABLED[m
[31m-  #include "stm32f4xx_h
