/*------------------------------Tablas------------------------------------------------*/

CREATE TABLE Instituciones(
    codigo NUMBER(15),
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    tipo CHAR(2) NOT NULL
);

CREATE TABLE Estudiantes(
    usuario NUMBER(10),
    nombre VARCHAR(20) NOT NULL,
    correo VARCHAR(30) NOT NULL,
    contrasena NUMBER(10) NOT NULL,
    programa VARCHAR(30) NOT NULL,
    registro DATE NOT NULL,
    codigoInstitucion NUMBER(15) NULL
);

CREATE TABLE ClientesPremium(
    usuarioE NUMBER(10),
    membresia CHAR(2) NOT NULL,
    fechaDeVencimiento DATE NOT NULL,
    telefono NUMBER(10) NOT NULL,
    direccion VARCHAR(40) NULL
);

CREATE TABLE ClientesGratuitos(
    usuarioE NUMBER(10),
    correoTemporal VARCHAR(30) NOT NULL
);

CREATE TABLE Cursos(
    codigo NUMBER(6),
    nombre VARCHAR(20) NOT NULL,
    listaDeMatriculados NUMBER(5) NULL,
    duracion NUMBER(4) NOT NULL,
    supercursos NUMBER(6) NULL,
    codigoInstitucion NUMBER(15) NOT NULL,
    nidProfesor NUMBER(10) NULL
);

CREATE TABLE EstudiantesCursos(
    usuario NUMBER(10),
    codigoCurso NUMBER(6) NOT NULL
);

CREATE TABLE Profesores(
    nid NUMBER(10) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    telefono NUMBER(9)  NOT NULL,
    profesion VARCHAR(15) NOT NULL
);

CREATE TABLE RecursosAdicionales(
    idRecursos NUMBER(6),
    tipo CHAR(2) NOT NULL,
    fechaPublicacion DATE NOT NULL,
    tema VARCHAR(20) NOT NULL,
    notasDeClase VARCHAR(200) NOT NULL,
    codigoCurso NUMBER(6) NOT NULL
);

CREATE TABLE Tareas(
    idTarea NUMBER(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(50),
    fechaDeAsignacion DATE NOT NULL,
    fechaDeVencimiento DATE NOT NULL,
    estado CHAR(2) NOT NULL,
    codigoCurso NUMBER(6) NOT NULL
);

CREATE TABLE calificaciones(
    idTarea NUMBER(5) NOT NULL,
    puntaje NUMBER(2) NOT NULL,
    fecha DATE NOT NULL,
    comentario VARCHAR(50) NULL,
    estudiante NUMBER(10) NOT NULL
);