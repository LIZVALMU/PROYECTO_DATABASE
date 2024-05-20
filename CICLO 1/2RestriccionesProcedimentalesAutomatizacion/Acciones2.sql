--Acciones--

--Mantener Recursos adicionales________________________________________________

/*Acciones de referencia*/
--SELECT constraint_name
--FROM user_constraints
--WHERE table_name = 'CURSOS';


-- Utilizar los nombres de las restricciones encontradas para eliminarlas
--ALTER TABLE Cursos DROP CONSTRAINT SYS_C00129801;
--ALTER TABLE Cursos DROP CONSTRAINT SYS_C00129802;
--ALTER TABLE Cursos DROP CONSTRAINT SYS_C00129803;

--Mantener Estudiantes Cursos__________________________________________________
--SELECT constraint_name
--FROM user_constraints
--WHERE table_name = 'ESTUDIANTESCURSOS';
------
ALTER TABLE EstudiantesCursos DROP CONSTRAINT FK_ESTUDIANTESCURSOS_ESTUDIANTES;
--
ALTER TABLE EstudiantesCursos
ADD CONSTRAINT FK_EstudiantesCursos_Estudiantes
FOREIGN KEY (usuario)
REFERENCES Estudiantes (usuario)
ON DELETE CASCADE;
--Necesita las PK y UK
--Si un estudiante decide cancelar su cuenta y eliminar su registro, 
--también queremos que se eliminen automáticamente todas las inscripciones 
--del estudiante en los cursos.

--Mantener Cursos_____________________________________________________________
--SELECT constraint_name
--FROM user_constraints
--WHERE table_name = 'CURSOS';
------
ALTER TABLE Cursos DROP CONSTRAINT FK_CURSO_PROFESORES;
----
ALTER TABLE Cursos
ADD CONSTRAINT FK_Curso_Profesores
FOREIGN KEY (nidProfesor)
REFERENCES Profesores (nid)
ON DELETE SET NULL;
--Supongamos que un profesor se retira o deja de enseñar en una institución. 
--Queremos mantener la integridad referencial, pero no queremos eliminar 
--todos los cursos asociados con ese profesor. En cambio, simplemente queremos 
--establecer el campo nidProfesor en NULL para esos cursos.


ALTER TABLE Cursos DROP CONSTRAINT FK_Curso_Instituciones;

ALTER TABLE Cursos
ADD CONSTRAINT FK_Curso_Instituciones
FOREIGN KEY (codigoInstitucion)
REFERENCES Instituciones (codigo)
ON DELETE SET NULL;
--esta acción de referencia asegura que los cursos mantengan una referencia 
--válida a la institución, pero no se eliminen automáticamente si la 
--institución se elimina.

--Mantener RecursosAdicionales________________________________________________
--SELECT constraint_name
--FROM user_constraints
--WHERE table_name = 'RECURSOSADICIONALES';
--
ALTER TABLE RecursosAdicionales DROP CONSTRAINT FK_RECURSOSADICIONALES_CURSO;
--
ALTER TABLE RecursosAdicionales
ADD CONSTRAINT FK_RecursosAdicionales_Curso
FOREIGN KEY (codigoCurso)
REFERENCES Cursos (codigo)
ON DELETE CASCADE;
--esta acción de referencia asegura que los recursos adicionales estén siempre 
--relacionados con cursos existentes y se mantenga la integridad referencial 
--en la base de datos.

-- Sección AccionesOK
-- Insertar una institución
INSERT INTO Instituciones (codigo, nombre, direccion, tipo)
VALUES (01, 'Instituto ABC', 'Ciudad XYZ', 'AB');

-- Insertar un profesor
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (001, 'Juan Pérez',3212126478, 'Matemático');

-- Insertar un curso
INSERT INTO Cursos (codigo, nombre, duracion, codigoInstitucion, nidProfesor)
VALUES (001, 'Matemáticas', 1240 ,005, 157);

-- Insertar recursos adicionales
INSERT INTO RecursosAdicionales (idRecursos, tipo,fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (001, 'AB','12/04/2024', 'Matemáticas','Material de estudio',003);