/*------------------------------Tablas------------------------------------------------*/

CREATE TABLE Instituciones(
    codigo NUMBER(15),
    nombre VARCHAR(100) NOT NULL,
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
    codigoInstitucion NUMBER(15) NULL,
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


CREATE TABLE Horarios(
    franjas XMLTYPE NULL,
    usuario NUMBER(10)
);

CREATE TABLE ActividadesExtracurriculares(
    idActividad NUMBER(10),
    usuario NUMBER(10),
    nombre VARCHAR(30) NOT NULL,
    tipo CHAR(2) NOT NULL,
    duracion CHAR(2) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL
);

CREATE TABLE ApredizajesGrupales(
    idAprendizaje NUMBER(10),
    cantidadMiembros NUMBER(3),
    descripcion VARCHAR(100)
);

CREATE TABLE ClienteAprendizaje(
    idAprendizaje NUMBER(10),
    usuario NUMBER(10)
);

CREATE TABLE Seguimientos(
    usuarioP NUMBER(10) NOT NULL,
    prioridad CHAR(2),
    fechaFin DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Recordatorios(
    idRecordatorio NUMBER(10),
    nombre VARCHAR(25) NOT NULL,
    horaInicio DATE NOT NULL,
    horaFinal DATE NOT NULL,
    usuarioP NUMBER(15)
);

CREATE TABLE Facturas(
    codigo NUMBER(7) NOT NULL,
    usuarioP NUMBER(10) NULL,
    fecha DATE NOT NULL,
    costo NUMBER(10,2) NOT NULL,
    numeroDeCuotas NUMBER(2) NOT NULL,
    documento VARCHAR(100) NULL,
    transaccion CHAR(2) NOT NULL
);

CREATE TABLE NotificacionesIncumplimientos(
    idIncumplimiento NUMBER(10) NOT NULL,
    fechaTransaccion VARCHAR(30) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    codigoFactura NUMBER(7) NOT NULL
);

CREATE TABLE Tarjetas(
    codigoFactura NUMBER(7) NOT NULL,
    nombrePropietario VARCHAR(35) NOT NULL,
    numeroTarjeta VARCHAR(20) NOT NULL,
    fechaVencimiento DATE NOT NULL,
    codigoDeSeguridad VARCHAR(3) NOT NULL,
    tipoTarjeta CHAR(2) NOT NULL
);
