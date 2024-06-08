/*------------------------------------ ATRIBUTOS------------------------------------*/
ALTER TABLE ActividadesExtracurriculares ADD CONSTRAINT Ck_Actividades_tipo CHECK(tipo IN ('DE','MU','DA','GY','JM','AC','AT'));
ALTER TABLE Seguimientos ADD CONSTRAINT Ck_segimiento_prioridad CHECK(prioridad IN ('A','M','B'));
ALTER TABLE Facturas ADD CONSTRAINT Ck_factura_Transaccion CHECK(transaccion IN ('E','F','P'));
ALTER TABLE Facturas ADD CONSTRAINT Ck_factura_Documento CHECK (REGEXP_LIKE(documento, '^https://.*\.pdf$'));
ALTER TABLE Tarjetas ADD CONSTRAINT CK_tarjetas_tipo CHECK(tipoTarjeta IN('DB', 'CR'));

/*---------------------------------------- PRIMARIAS-------------------------*/

ALTER TABLE Horarios ADD CONSTRAINT PK_Horarios PRIMARY KEY (usuario);
ALTER TABLE ActividadesExtracurriculares ADD CONSTRAINT PK_ActividadesExtracurriculares PRIMARY KEY (idActividad);
ALTER TABLE ApredizajesGrupales ADD CONSTRAINT PK_ApredizajesGrupales PRIMARY KEY (idAprendizaje);
ALTER TABLE ClienteAprendizaje ADD CONSTRAINT PK_ClienteAprendizaje PRIMARY KEY (idAprendizaje,usuario);
ALTER TABLE Seguimientos ADD CONSTRAINT PK_Seguimientos PRIMARY KEY (usuarioP);
ALTER TABLE Recordatorios ADD CONSTRAINT PK_Recordatorios PRIMARY KEY (idRecordatorio);
ALTER TABLE Facturas ADD CONSTRAINT PK_Facturas PRIMARY KEY (codigo);
ALTER TABLE NotificacionesIncumplimientos ADD CONSTRAINT PK_NotificacionesIncumplimientos PRIMARY KEY (idIncumplimiento);
ALTER TABLE Tarjetas ADD CONSTRAINT PK_Tarjetas PRIMARY KEY (codigoFactura);

/*------------------------------------ FORANEAS------------------------------------*/
ALTER TABLE Horarios
ADD CONSTRAINT FK_Horarios_Estudiante
FOREIGN KEY (usuario)
REFERENCES Estudiantes (usuario);

ALTER TABLE ActividadesExtracurriculares
ADD CONSTRAINT FK_ActividadesExtracurriculares_Estudiante
FOREIGN KEY (usuario)
REFERENCES Estudiantes (usuario);

ALTER TABLE ClienteAprendizaje
ADD CONSTRAINT FK_ClienteAprendizaje_AprendizajesGrupales
FOREIGN KEY (idAprendizaje)
REFERENCES ApredizajesGrupales (idAprendizaje);

ALTER TABLE Seguimientos
ADD CONSTRAINT FK_Seguimientos_ClientesPremium
FOREIGN KEY (usuarioP)
REFERENCES ClientesPremium (usuarioE);

ALTER TABLE Recordatorios
ADD CONSTRAINT FK_Recordatorios_ClientesPremium
FOREIGN KEY (usuarioP)
REFERENCES ClientesPremium (usuarioE);

ALTER TABLE NotificacionesIncumplimientos
ADD CONSTRAINT FK_NotificacionesIncumplimientos_Facturas
FOREIGN KEY (codigoFactura)
REFERENCES Facturas (codigo);

ALTER TABLE Tarjetas
ADD CONSTRAINT FK_Tarjetas_Facturas
FOREIGN KEY (codigoFactura)
REFERENCES Facturas (codigo);

ALTER TABLE Facturas 
ADD CONSTRAINT FK_Facturas_ClientesPremium
FOREIGN KEY (usuarioP) 
REFERENCES ClientesPremium(usuarioE);

ALTER TABLE ClienteAprendizaje
ADD CONSTRAINT FK_clienteAprendizaje_CLIENTE 
FOREIGN KEY (usuario)
REFERENCES ClientesPremium(usuarioE);


/*------------------------------------ UNICAS------------------------------------*/
ALTER TABLE Facturas
ADD CONSTRAINT UK_Facturas_Documento
UNIQUE(documento);
