# Actividad 5

## Tipos de Kernel y sus diferencias
El kernel es el núcleo del sistema operativo, responsable de la comunicación entre el hardware y el software. Existen varios tipos de kernels, cada uno con sus características y diferencias:

### Monolítico

Todo el sistema operativo está contenido en un solo espacio de memoria. Esto incluye servicios como manejo de archivos, manejo de memoria, y drivers.

- Ventajas: Puede ser muy eficiente porque todas las partes del sistema operativo están en un solo espacio de memoria, lo que reduce el tiempo de comunicación entre ellas.

- Desventajas: Si una parte del kernel falla, todo el sistema puede colapsar. Además, la depuración y el mantenimiento son más complejos.

### Microkernel

El kernel se reduce a sus funciones más básicas (gestión de memoria, procesos y comunicación entre procesos), delegando otros servicios (como controladores de dispositivos y sistemas de archivos) a servidores que se ejecutan en modo usuario.

- Ventajas: Más seguro y estable porque la mayoría de los servicios se ejecutan en modo usuario. Un fallo en uno de estos servicios no compromete todo el sistema.

- Desventajas: La comunicación entre el microkernel y los servicios de usuario puede ser menos eficiente, lo que podría llevar a un rendimiento más bajo.

### Híbrido

Combina características de los kernels monolíticos y microkernels. Incluye un kernel monolítico con algunas funcionalidades de microkernel, como módulos que pueden ser cargados dinámicamente.

- Ventajas: Busca ofrecer el rendimiento de un kernel monolítico con la modularidad y estabilidad de un microkernel.

- Desventajas: Puede tener la complejidad de un sistema microkernel con el riesgo de un kernel monolítico en ciertos aspectos.

### Exokernel

Minimizan la abstracción del hardware para proporcionar una gestión de recursos lo más cercana posible al hardware, permitiendo que las aplicaciones tengan un control más directo sobre los recursos del sistema.

- Ventajas: Ofrecen un gran rendimiento y flexibilidad al permitir que las aplicaciones gestionen los recursos según sus necesidades específicas.

- Desventajas: Requiere que las aplicaciones sean más complejas ya que deben gestionar directamente muchos aspectos que en otros kernels serían abstractos.

## User Mode vs Kernel Mode
Estos modos representan los niveles de privilegio que tiene un código cuando se ejecuta:

### Kernel Mode (Modo Núcleo):

Es el modo con mayor nivel de privilegio. En este modo, el código puede ejecutar cualquier instrucción de la CPU y acceder a todo el hardware del sistema.

- Usos: Este modo es utilizado por el kernel del sistema operativo y los controladores de dispositivos. 
Permite que el sistema operativo tenga control total sobre el hardware.

- Riesgos: Un fallo en el código que se ejecuta en este modo puede llevar a fallos graves del sistema o a vulnerabilidades de seguridad.

### User Mode (Modo Usuario):

Es un modo con privilegios limitados. El código que se ejecuta en este modo no puede acceder directamente al hardware ni ejecutar ciertas instrucciones de la CPU.

- Usos: Las aplicaciones y procesos de usuario se ejecutan en este modo. Si un proceso falla en modo usuario, el impacto generalmente está limitado a ese proceso, evitando que comprometa todo el sistema.

- Ventajas: Proporciona seguridad y estabilidad al sistema operativo, ya que impide que las aplicaciones realicen acciones que puedan corromper el sistema.

## Interruptions vs Traps
Ambos términos se refieren a eventos que alteran el flujo normal de ejecución de un programa, pero hay diferencias clave:

### Interrupciones (Interruptions):

Son señales generadas por el hardware que interrumpen el flujo de ejecución del CPU para atender eventos externos, como la entrada de datos desde un dispositivo de entrada/salida.

Ejemplos: Una interrupción puede ocurrir cuando se presiona una tecla en el teclado o se recibe un paquete de red.

- Tipos:
    - Interrupciones de hardware: Generadas por dispositivos externos como el teclado o el mouse.
    - Interrupciones de software: Generadas por programas para solicitar servicios del sistema operativo (a través de una llamada al sistema).

- Manejo Las interrupciones son manejadas por un controlador de interrupciones que desvía la ejecución a un manejador de interrupciones.

### Trampas (Traps):

Son interrupciones generadas por el propio procesador como resultado de la ejecución de una instrucción específica. Estas son causadas por eventos internos, como errores en la ejecución de instrucciones (división por cero, acceso a memoria no válida) o para realizar ciertas operaciones controladas, como llamadas al sistema.

Ejemplos: Un ejemplo típico es una división por cero que resulta en una excepción.
Manejo: Las trampas son manejadas por el sistema operativo, que puede intentar corregir el error, finalizar el proceso, o llevar a cabo la operación solicitada.
