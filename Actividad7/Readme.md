# Completely Fair Scheduler

El Completely Fair Scheduler (CFS) es el planificador de procesos predeterminado para Linux desde la versión 2.6.23, y su objetivo principal es proporcionar una distribución justa del tiempo de CPU a todas las tareas. Fue desarrollado por Ingo Molnar como una mejora significativa sobre los planificadores anteriores de Linux.

Características principales del CFS:
Fairness (Equidad): El CFS está diseñado para ofrecer una distribución equitativa del procesador, intentando que cada tarea reciba una cantidad justa de tiempo de CPU en función de su necesidad. El concepto clave aquí es el "runtime virtual" (virtual runtime o vruntime), el cual se utiliza para hacer seguimiento del tiempo que cada tarea ha tenido acceso al CPU. Cuanto menor sea el vruntime de una tarea, mayor será su necesidad de ejecución, lo que garantiza que las tareas que menos han sido ejecutadas tengan prioridad.

Estructura de Datos - Árbol Rojo-Negro: En lugar de usar una cola de procesos, el CFS utiliza un árbol rojo-negro para almacenar las tareas listas para ejecutarse. Este tipo de estructura permite un acceso rápido y eficiente, con operaciones de inserción y eliminación en tiempo O(log n), donde "n" es el número de tareas. Los nodos de menor vruntime se encuentran hacia el lado izquierdo del árbol, lo cual facilita la selección de la tarea que más necesita ser ejecutada en cada ciclo del planificador.

Política de Selección de Tareas: El CFS selecciona la tarea a ejecutar eligiendo siempre el nodo más a la izquierda del árbol rojo-negro, lo que garantiza que se dé prioridad a las tareas con menor vruntime. Cuando una tarea es ejecutada, su vruntime se incrementa en función del tiempo que ha utilizado el CPU, y luego es reintegrada al árbol. Esto asegura que las tareas vayan rotando, manteniendo el equilibrio y la equidad en la ejecución.

Preemptividad y Prioridades: CFS no tiene el concepto de "timeslices" o rebanadas de tiempo, como los planificadores anteriores. En su lugar, la preemption (preempción) se realiza basándose en el vruntime, haciendo que una tarea sea interrumpida si su tiempo de ejecución la coloca por detrás de otra en el árbol. CFS también maneja prioridades indirectamente mediante "niveles de decaimiento", lo cual afecta la rapidez con la que una tarea pierde su tiempo asignado, permitiendo que tareas de mayor prioridad conserven más tiempo de CPU comparadas con las de baja prioridad.

Group Scheduling (Planificación en Grupos): CFS también soporta la planificación en grupos. Esto resulta útil en sistemas multiusuario, donde es posible agrupar tareas de un usuario para garantizar que se asignen de manera equitativa los recursos entre usuarios, evitando que un usuario monopolice el CPU creando muchas tareas.

Clases de Planificación: CFS introduce la idea de clases de planificación, lo cual permite una estructura modular para definir distintas políticas de planificación. Cada tarea pertenece a una clase, y estas clases se encadenan para formar una jerarquía que permite al planificador iterar sobre distintas políticas, como SCHED_NORMAL (para tareas normales), SCHED_BATCH (para trabajos en lote que no requieren tanta interactividad) y SCHED_IDLE (para tareas que solo deben ejecutarse cuando no hay nada más en ejecución).

El CFS trata de simular un "CPU multitarea ideal", en el cual todos los procesos se ejecutarían en paralelo y al mismo ritmo, algo imposible en la realidad. La "virtualización" del tiempo permite que el CFS se acerque a este ideal, proporcionando un tiempo de CPU lo más equitativo posible a todas las tareas en un entorno monoprocesador​(
CS User Pages
)