
--Seguridad

-- Crear roles
CREATE ROLE Jefe;

-- Otorgar permisos
GRANT EXECUTE ON PA_ADMINISTRADOR TO Jefe;

-- SeguridadOK
EXECUTE PA_ADMINISTRADOR.AD_CURSO(101, 'Matemáticas', 30, 90, 0, 1234, 4567);
EXECUTE PA_ADMINISTRADOR.AD_PROFESOR(4567, 'Juan Perez', 12345678, 'Matemático');
EXECUTE PA_ADMINISTRADOR.AD_ESTUDIANTE(2021001, 'Maria Gomez', 'maria@example.com', 123456, 'Ingeniería', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1234);
EXECUTE PA_ADMINISTRADOR.AD_INSTITUCION(1234, 'Universidad XYZ', 'Calle Principal #123', 'P');

-- Profesor

-- Crear roles
CREATE ROLE Profesor;

-- Otorgar permisos
GRANT EXECUTE ON PA_PROFESOR TO Profesor;

-- SeguridadOK
EXECUTE PA_PROFESOR.AD_RECURSO(101, 'A', TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'Tema 1', 'Notas de clase', 123);
EXECUTE PA_PROFESOR.AD_TAREA(201, 'Tarea 1', 'Descripción de la tarea', TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), 'P', 123);
EXECUTE PA_PROFESOR.AD_CALIFICACION(201, 90, TO_DATE('2024-05-26', 'YYYY-MM-DD'), 'Buen trabajo', 2021001);

