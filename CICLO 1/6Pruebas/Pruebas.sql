/*Historia 1: Interacción del Estudiante ALISON VALDERRAMA
Contexto
Alison Valderrama es una estudiante que acaba de inscribirse en la plataforma educativa. 
Ella quiere inscribirse en un curso, ver las tareas asignadas y consultar sus calificaciones.

Pasos 1
Inscripción en un Curso
Alison se inscribe en el curso de base de datos.*/

-- Inserción en la tabla EstudiantesCursos
BEGIN PA_ADMINISTRADOR.AD_ESTUDIANTE(2021001, 'Alison Valderrama', 'alisvalderrama@gmail.com', 123456, 'Ingeniería de sistemas', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1234);

-- Asignación al curso
INSERT INTO EstudiantesCursos (usuario, codigoCurso) VALUES(2021001,101);

---2Consulta de Tareas
--Alison quiere consultar las tareas asignadas en el curso de bases de datos

DECLARE
    CO_Tareas SYS_REFCURSOR;
BEGIN
    CO_Tareas := PA_ESTUDIANTE.CO_TAREAS(2021001);
    DBMS_SQL.RETURN_RESULT(CO_Tareas);
END;
/

--3Consulta de Calificaciones
--Alison consulta sus calificaciones en el curso de bases de datos.

DECLARE
    CO_Calificaciones SYS_REFCURSOR;
BEGIN
    CO_Calificaciones := PA_ESTUDIANTE.CO_CALIFICACIONES(2021001, 101);
    DBMS_SQL.RETURN_RESULT(CO_Calificaciones);
END;
/

/*Historia 2: Interacción del Profesor
Contexto
Catalina Hernandez es un profesor que quiere agregar un recurso adicional y asignar una tarea al curso de Matemáticas.

Pasos
--El administrador agrega a Catalina Al sistema*/

BEGIN 
	PA_ADMINISTRADOR.AD_PROFESOR(1101, "Catalina Hernandez", 3006816874, "Docente Matematicas")
END;
/

--Agregar un Recurso Adicional
--Catalina agrega un nuevo recurso para el curso de Matemáticas.
-- Inserción del recurso adicional
BEGIN
	PA_PROFESOR.AD_RECURSO(201, 'L', TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'Tema 1', 'Notas de clase sobre Álgebra', 101);
END;
/

--Asignar una Tarea
--Catalina asigna una nueva tarea para el curso de Matemáticas.
-- Inserción de la tarea
BEGIN
	PA_PROFESOR.AD_TAREA(301, 'Tarea 1', 'Resolver ejercicios de álgebra', TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), 'P',101);
END;
/
