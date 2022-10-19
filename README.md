# TP1 ARQUITECTURA DE COMPUTADORAS

## Introduccion

Se debe implementar una ALU en una FPGA con las operaciones ADD, SUB, AND, OR, XOR, SRA, SRL, NOR. Esta ALU debe ser parametrizable por lo menos en el bus de datos. Ademas, se debe incluir un test bench que genere entradas aleatorias y checkee automaticamente si el resultado es correcto.

## Desarrollo

### Entradas ALU
- Entrada Operando1
- Entrada Operando2
- Entrada Operacion

- El clock

### Descripción

Utilizamos 3 entradas, 2 para los operandos 1 y 2, y una para la operación. De esta forma nos independizamos de tener que cargar un valor y mediante un botón u otra entrada, asignar el valor a la entrada que corresponda.

También realizamos esta independencia, para abstraer el módulo "alu" de lo externo y poder instanciarlo, asignandole los valores correspondientes y que realice la operación que se le asigne.

Para esto declaramos 8 "localparam" definiendo las operaciones que se solicitaban:
- ADD = 100000
- SUB = 100010
- AND = 100100
- OR =  100101
- XOR = 100110
- SRA = 000011
- SRL = 000010
- NOR = 100111

Realizamos 2 bloques *always*: Uno combinacional y uno secuencial.
- always combinacional: asigna los valores a los operandos 1 y 2 y al operador
- always secuencial: 


Basandose en el codigo de operacion, se hace un **case** y se guarda el resultado que corresponda en una variable de salida.

## Verificacion

Se intento generar una entrada aleatoria usando la funcion urandom, pero a menos que manualmente se cambie la seed de esta funcion, siempre genera el mismo valor. Para la verificacion automatica, simplemente se checkea que el/los valor/es random generado/s den correctamente el resultado esperado usando un **if**.

Se adjunta una imagen de los resultados de la simulacion.

![Simulación](https://i.ibb.co/QFMx3N7/simulacion.png)

![Resultados](https://i.ibb.co/Y2jctY3/resultados.jpg)

## Prueba
Hicimos la prueba sobre la placa FPGA Basys3. Utilizamos los switches para ingresar los valores de los operandos, y los botones para seleccionar cuándo cargar cada operación u operando.

La comprobación fue mediante los leds que muestra la placa en cada switch.

## Diagrama de Bloques

![Resultados](https://i.ibb.co/HDwMpnT/TP1-Arqui-drawio.png)


