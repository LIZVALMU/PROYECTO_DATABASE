/*------------------------------------ ATRIBUTOS------------------------------------*/

ALTER TABLE Instituciones ADD CONSTRAINT Ck_instituciones_tipo CHECK(tipo IN ('E','U'));
ALTER TABLE Estudiantes ADD CONSTRAINT Ck_estudiantes_correo CHECK(correo LIKE '%@%');
ALTER TABLE Tareas ADD CONSTRAINT Ck_tarea_estado CHECK(estado IN ('P','E','A'));
ALTER TABLE ClientesPremium ADD CONSTRAINT Ck_clientes_membresia CHECK(membresia IN ('P','PE'));
ALTER TABLE ClientesGratuitos ADD CONSTRAINT Ck_cliente_correo CHECK(CORREOTEMPORAL LIKE '%.edu%');
--ALTER TABLE ClientesGratuitos DROP CONSTRAINT Ck_cliente_correo;
ALTER TABLE RecursosAdicionales ADD CONSTRAINT Ck_recursos_tipo CHECK(tipo IN ('L','A','V'));
ALTER TABLE Tareas ADD CONSTRAINT Ck_TareasFechas CHECK (FECHADEASIGNACION < FECHADEVENCIMIENTO);
/*---------------------------------------- PRIMARIAS-------------------------*/

ALTER TABLE Instituciones
ADD CONSTRAINT PK_Instituciones
PRIMARY KEY (codigo);

ALTER TABLE Estudiantes
ADD CONSTRAINT PK_Estudiantes
PRIMARY KEY (usuario);

ALTER TABLE ClientesPremium
ADD CONSTRAINT PK_ClientesPremium
PRIMARY KEY (UsuarioE);

ALTER TABLE ClientesGratuitos
ADD CONSTRAINT PK_ClientesGratuitos
PRIMARY KEY (UsuarioE);

ALTER TABLE Cursos
ADD CONSTRAINT PK_Cursos_Codigo
PRIMARY KEY (codigo);

ALTER TABLE EstudiantesCursos
ADD CONSTRAINT PK_EstudiantesCursos
PRIMARY KEY(usuario,codigoCurso);

ALTER TABLE Profesores
ADD CONSTRAINT PK_Profesores
PRIMARY KEY (nid);

ALTER TABLE RecursosAdicionales
ADD CONSTRAINT PK_RecursosAdicionales
PRIMARY KEY (idRecursos);

ALTER TABLE Tareas
ADD CONSTRAINT PK_Tareas
PRIMARY KEY (idTarea);

ALTER TABLE calificaciones
ADD CONSTRAINT PK_calificaciones
PRIMARY KEY (idTarea);

/*------------------------------------ FORANEAS------------------------------------*/
ALTER TABLE RecursosAdicionales
ADD CONSTRAINT FK_RecursosAdicionales_Curso
FOREIGN KEY (codigoCurso)
REFERENCES Cursos (codigo);

ALTER TABLE Cursos
ADD CONSTRAINT FK_Curso_Instituciones
FOREIGN KEY (codigoInstitucion)
REFERENCES Instituciones (codigo);

ALTER TABLE Cursos
ADD CONSTRAINT FK_Curso_Profesores
FOREIGN KEY (nidProfesor)
REFERENCES Profesores (nid);

ALTER TABLE Tareas
ADD CONSTRAINT FK_Tareas_Curso
FOREIGN KEY (codigoCurso)
REFERENCES Cursos(codigo);

ALTER TABLE calificaciones
ADD CONSTRAINT FK_calificaciones_Tareas
FOREIGN KEY (IdTarea)
REFERENCES Tareas (IdTarea);

ALTER TABLE calificaciones
ADD CONSTRAINT FK_calificaciones_Estudiantes
FOREIGN KEY (estudiante)
REFERENCES Estudiantes (usuario);

ALTER TABLE ClientesPremium
ADD CONSTRAINT FK_ClientesPremium_Estudiantes
FOREIGN KEY (USUARIOE)
REFERENCES Estudiantes (usuario);

ALTER TABLE ClientesGratuitos
ADD CONSTRAINT FK_ClientesGratuitos_Estudiantes
FOREIGN KEY (USUARIOE)
REFERENCES Estudiantes (usuario);

ALTER TABLE EstudiantesCursos
ADD CONSTRAINT FK_EstudiantesCursos_Estudiantes
FOREIGN KEY (usuario)
REFERENCES Estudiantes (usuario);

ALTER TABLE EstudiantesCursos
ADD CONSTRAINT FK_EstudiantesCursos_Cursos
FOREIGN KEY (codigoCurso)
REFERENCES Cursos (codigo);


/*------------------------------------ UNICAS------------------------------------*/
ALTER TABLE Instituciones
ADD CONSTRAINT UK_Instituciones_nombre
UNIQUE(nombre);


