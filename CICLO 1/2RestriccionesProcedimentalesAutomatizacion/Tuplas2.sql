--Tuplas

SELECT * FROM Tareas;

ALTER TABLE Tareas
ADD CONSTRAINT CHK_Tareas_Fechas
CHECK (fechaDeVencimiento > fechaDeAsignacion);
--Restricción de Fecha de Asignación y Vencimiento de Tareas: La fecha de 
--vencimiento de una tarea no puede ser anterior a su fecha de asignación.

ALTER TABLE Estudiantes
ADD CONSTRAINT CHK_Estudiantes_Usuario_Contrasena
CHECK (usuario != contrasena);
--Podemos asumir que un estudiante no puede tener el mismo número de usuario 
--que su contraseña. Esto podría ser útil para garantizar que los estudiantes 
--tengan contraseñas seguras que no sean fácilmente adivinables.

ALTER TABLE Estudiantes
ADD CONSTRAINT CHK_Estudiantes_Programa_Correo
CHECK (NOT (correo LIKE '%' || programa || '%'));
--Podemos asumir que el nombre del programa no puede ser parte del correo del 
--estudiante. Esto podría ser útil para mantener la privacidad del estudiante 
--y evitar que se revele información innecesaria a través del correo 
--electrónico

/*-----------TuplasOk--------------------*/
-- TuplasOK: Ingreso de datos que cumplen con las restricciones de tuplas
-- Insertamos datos que cumplen con la restricción de que la fecha de vencimiento debe ser posterior a la fecha de asignación
INSERT INTO Tareas (idTarea,nombre,  fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (110,'informe',TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'),'P', 101);

INSERT INTO Estudiantes (usuario, nombre,correo, contrasena, programa,registro)
VALUES (100001234, 'Juan','juan_c@mail.co' ,05062003,'Sistemas',TO_DATE('2024-04-25', 'YYYY-MM-DD'));

INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
VALUES (100001254, 'Juan', 'juan_c@mail.co', 09132003, 'Sistemas', TO_DATE('2024-04-25', 'YYYY-MM-DD'), NULL);



/*-----------TuplasNoOk--------------------*/
-- TuplasNoOK: Intento de ingreso de datos que violan las restricciones de tuplas
-- Intentamos insertar una tarea con fecha de vencimiento anterior a la fecha de asignación, lo cual viola la restricción
INSERT INTO Tareas (idTarea, nombre, fechaDeAsignacion, fechaDeVencimiento,estado, codigoCurso)
VALUES (67890,'Presentacion','2024-04-30', '2024-04-05','Si',567890);

INSERT INTO Estudiantes (usuario, nombre,correo, contrasena, programa,registro)
VALUES (100001234, 'Juan','juan_c@mail.co' ,100001234,'Sistemas','2024-04-20');

INSERT INTO Estudiantes (usuario, nombre,correo, contrasena, programa,registro)
VALUES (100001234, 'Juan','juan_Sistemas@mail.co' ,19072006,'Sistemas','2024-04-20');




