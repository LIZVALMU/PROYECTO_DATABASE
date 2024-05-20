/*------------------------------------ PoblarOK------------------------------------*/

--Población de datos para la tabla Instituciones
INSERT INTO Instituciones (codigo, nombre, direccion, tipo) VALUES (4939-50, 'JAVERIANA', 'Cra. 7 #40 - 62 Bogotá', 'U');
INSERT INTO Instituciones (codigo, nombre, direccion, tipo) VALUES (54799-50, 'UDCA', 'Cl. 222 #55 - 37 Bogotá', 'U');
INSERT INTO Instituciones (codigo, nombre, direccion, tipo) VALUES (0409-35, 'LICEO_FRANCES', 'Cl. 87 #7-77','E');
INSERT INTO Instituciones (codigo, nombre, direccion, tipo) VALUES (2125-50, 'SABANA', ' Chía Cundinamarca', 'U');
INSERT INTO Instituciones (codigo, nombre, direccion, tipo) VALUES (68084-35, 'SAN_BARTOLOME', 'Carrera 23 No. 28 - 55 sur', 'E');

-- Población de datos para la tabla Estudiantes
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro,codigoInstitucion)
VALUES (1002546, 'Laura Linares', 'laulinares@hotmal.com', 20918754, 'Medicina', TO_DATE('2022-07-24', 'YYYY-MM-DD'), 2125-50);
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro ,codigoInstitucion)
VALUES (1005896, 'Richard Arevalo', 'RichAvalo@gmail.com', 79845618, 'Administracion', TO_DATE('2023-02-16', 'YYYY-MM-DD'), 54799-50);
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
VALUES (1077083, 'Emily Munar', 'EmiMunar@gmail.com', 15648975, 'Septimo', TO_DATE('2020-02-15', 'YYYY-MM-DD'), 0409-35);
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
VALUES (1046895, 'Sofia Roa', 'roaFIA@hotmail.com', 489516321, 'Psicologia', TO_DATE('2023-08-11', 'YYYY-MM-DD'),4939-50 );
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
VALUES (1009321, 'Michael Hernandez', 'Michanandez@gmail.com', 658492116, 'Decimo', TO_DATE('2024-02-05', 'YYYY-MM-DD'), 54799-50);

-- Población de datos para la tabla ClientesPremium
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
VALUES (1002546, 'P', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3115454646, 'Calle 100 # 11B-27 Bogotá');
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
VALUES (1005896, 'P', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3143725566, 'Calle 10 # 5-51');
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
VALUES (1077083, 'PE', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3043347025, 'Avenida 19 No. 98-03, sexto piso');
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
VALUES (1046895, 'P', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3124904152, 'Transvesal 7 15-51 Casa 101');
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
VALUES (1009321, 'PE', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3002553495, 'Avenida Calle 26 No 59-51 Edificio');

-- Población de datos para la tabla ClientesGratuitos
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE) VALUES ('dcaspell1d@unc.edu', 1077083);
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE) VALUES ('ospowart1q@upenn.edu', 1009321);
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE) VALUES ('fsalzberger18@upenn.edu', 1046895);
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE) VALUES ('lpigeone@amazon.edu', 1005896);
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE) VALUES ('mlittley8@phpbb.edu', 1002546);

-- Población de datos para la tabla Profesores
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (24347523, 'Esteban Cortez', 321562213, 'Matematico');
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (1021395445, 'Martha Collazos', 300856815, 'Doctora');
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (4414169, 'Enrique Salazar', 320430072, 'Abogado');
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (79951872, 'Miguel Navarro', 316692352, 'Informaticas');
INSERT INTO Profesores (nid, nombre, telefono, profesion)
VALUES (34001147, 'Nayda Garcia', 315265211, 'Pedagogia');

-- Población de datos para la tabla Cursos
INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor )
VALUES (101, 'Bases de datos', 28, 2, NULL, 4939-50, 79951872);
INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor )
VALUES (112, 'Economia y Finanzas', 36, 10, NULL, 0409-35, 34001147);
INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor )
VALUES (103, 'Teoria de derecho', 25, 2, NULL, 2125-50, 4414169);
INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor )
VALUES (124, 'Calculo II', 30, 2, NULL, 54799-50, 24347523);
INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor )
VALUES (114, 'Patologia', 22, 4, NULL, 4939-50, 1021395445);

-- Población de datos para la tabla EstudiantesCursos
INSERT INTO EstudiantesCursos (USUARIO, CODIGOCURSO) VALUES(1002546, 114);
INSERT INTO EstudiantesCursos (usuario,codigoCurso) VALUES(1005896, 124);
INSERT INTO EstudiantesCursos (usuario,codigoCurso) VALUES(1009321, 101);
INSERT INTO EstudiantesCursos (usuario,codigoCurso) VALUES(1077083, 124);
INSERT INTO EstudiantesCursos (usuario,codigoCurso) VALUES(1046895, 112);

-- Población de datos para la tabla RecursosAdicionales
INSERT INTO RecursosAdicionales (idRecursos, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (2245, 'L', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Regalamento penal', 'Notas de clase A',103);
INSERT INTO RecursosAdicionales (IDRECURSOS, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (5531, 'V', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Oferta y Demanda', 'Notas de clase B', 112);
INSERT INTO RecursosAdicionales (IDRECURSOS, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (1116, 'A', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'ADN', 'Notas de clase A', 114);
INSERT INTO RecursosAdicionales (IDRECURSOS, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (5533, 'V', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Disparadores accion', 'Notas de clase B', 101);
INSERT INTO RecursosAdicionales (IDRECURSOS, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
VALUES (2258, 'L', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Aritmetica', 'Notas de clase A', 124);

-- Población de datos para la tabla Tareas
INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (001, 'Calculo ', 'Evaluacion en linea', TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'A', 124);
INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (002, 'Derecho Penal', 'Control de lectura leyes', TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'P', 103);
INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (003, 'Alfabetizacion', 'Investigar ', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'E', 112);
INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (004, 'Diagnostico', 'Realizar un informe de un paciente', TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'E', 114);
INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
VALUES (005, 'Laboratorio', 'Crear la integridad procedimental', TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'A', 101);

-- Población de datos para la tabla calificaciones
INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
VALUES (001, 90, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Buen trabajo en la tarea', 1002546);
INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
VALUES (002, 90, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Buen trabajo en la tarea', 1002546);
INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
VALUES (003, 90, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Buen trabajo en la tarea', 1002546);
INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
VALUES (004, 90, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Buen trabajo en la tarea', 1002546);
INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
VALUES (005, 90, TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Buen trabajo en la tarea', 1002546);

/*-------------------------------------------------PoblarNoOk---------------------------------------------------------------------------------*/
-- Intento de inserción de datos erróneos protegidos por tipos de datos y nulidades

-- Intento de inserción de datos con clave primaria duplicada en la tabla Instituciones
INSERT INTO Instituciones (codigo, nombre, direccion, tipo)
VALUES (1, 'Institución A', 'Dirección A', 'P');

-- Intento de inserción de datos con valor NULL en columna NOT NULL en la tabla Estudiantes
INSERT INTO Estudiantes (usuario, nombre, CORREO, CONTRASENA, programa, registro)
VALUES (1234567890, 'Estudiante 1', NULL, 123456, 'Programa A', TO_DATE('2024-03-24', 'YYYY-MM-DD'));

-- Intento de inserción de datos con clave foránea inexistente en la tabla RecursosAdicionales
INSERT INTO RecursosAdicionales (tipo, fechaPublicacion, tema, notasDeClase)
VALUES ('T', TO_DATE('2024-03-24', 'YYYY-MM-DD'), 'Tema A', 'Notas de clase A');

-- Intento de inserción de datos con valor fuera de rango en la columna duracion en la tabla Curso
INSERT INTO Cursos(codigo, nombre, listaDeMatriculados, duracion)
VALUES (101, 'Curso A', 30, 99999);

-- Intento de inserción de datos con valor duplicado en columna única en la tabla ClientesGratuitos
INSERT INTO ClientesGratuitos (correoTemporal, usuarioE)
VALUES ('temporal@example.com', 'Cliente Gratuito 1');

/*--------------------------------------------XPoblar--------------------------------------------*/

TRUNCATE TABLE calificaciones;
TRUNCATE TABLE Tareas;
TRUNCATE TABLE Profesores;
TRUNCATE TABLE RecursosAdicionales;
TRUNCATE TABLE Cursos;
TRUNCATE TABLE ClientesGratuitos;
TRUNCATE TABLE ClientesPremium;
TRUNCATE TABLE Estudiantes;
TRUNCATE TABLE Instituciones;