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



