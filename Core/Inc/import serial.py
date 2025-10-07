import time
import random

# Valores iniciales
data = [31, 1014, 1, 32, 65, 191, 1]

# Función para variar ±1 evitando negativos
def variar_valor(previo):
    return max(0, previo + random.choice([-1, 0, 1]))

try:
    while True:
        # Generar cadena en formato "valor@valor@...@"
        data_str = '@'.join(map(str, data)) + '@'
        print(f"Enviado: {data_str}")

        # Esperar 10 segundos
        time.sleep(10)

        # Actualizar datos con variación ±1
        data = [variar_valor(v) for v in data]

except KeyboardInterrupt:
    print("\nPrograma terminado por el usuario.")
