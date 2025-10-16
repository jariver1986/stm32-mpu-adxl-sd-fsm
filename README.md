# 🧠 STM32 MPU6050 + ADXL345 + SDCard FSM (Ceedling Tests)

Proyecto de validación para una máquina de estados finitos (FSM) integrada con sensores **MPU6050**, **ADXL345** y **tarjeta SD**, desarrollada en **STM32CubeIDE** con pruebas unitarias **Ceedling + Unity + CMock**.

---

## 🚀 Estado del pipeline
![Ceedling Tests](https://github.com/jariver1986/stm32-mpu-adxl-sd-fsm/actions/workflows/ceedling.yml/badge.svg)

---

## 🧪 Resultados de cobertura

Este proyecto utiliza **Ceedling** y **gcovr** para medir la cobertura de código.

📊 **Último reporte HTML:**
[Descargar reporte de cobertura (tests_report.html)](build/artifacts/gcov/gcovr/tests_report.html)

📄 **Reporte JUnit:**
[Ver reporte de tests (junit_tests_report.xml)](build/artifacts/gcov/junit_tests_report.xml)

---

## ⚙️ Estructura del proyecto

├── Core/
├── Drivers/
├── Inc/
├── Src/
├── test/
│ ├── test_app_fsm.c
│ └── mocks/
├── project.yml
├── .gitignore
└── README.md
