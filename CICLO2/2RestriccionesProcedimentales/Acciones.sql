/*-------------------------------Acciones--------------------------------------*/
ALTER TABLE Facturas DROP CONSTRAINT FK_Facturas_ClientesPremium;

ALTER TABLE Facturas ADD CONSTRAINT FK_Facturas_ClientesPremium
FOREIGN KEY (usuarioP) REFERENCES ClientesPremium
ON DELETE SET NULL;
--- Supongamos que un cliente premium cancela o se elimina.
---Queremos mantener la integridad referencial, pero no queremos eliminar
--todos las facturas asociadas con ese Cliente. Por ende el atributo
--usuariop se establece NULL en facturas.


ALTER TABLE Tarjetas DROP CONSTRAINT FK_Tarjetas_Facturas;

ALTER TABLE Tarjetas ADD CONSTRAINT FK_Tarjetas_Facturas
FOREIGN KEY (codigoFactura) REFERENCES Facturas
ON DELETE CASCADE;
--Si se elimina una factura tambien queremos que se elimine automaticamente
--la tarjeta asociada


ALTER TABLE NotificacionesIncumplimientos DROP CONSTRAINT FK_NotificacionesIncumplimientos_Facturas;

ALTER TABLE NotificacionesIncumplimientos ADD CONSTRAINT FK_NotificacionesIncumplimientos_Facturas
FOREIGN KEY (CODIGOFACTURA) references Facturas
ON DELETE CASCADE;
----Supongamos que se quiere eliminar una factura por ende tambien
-- queremos que se eliminen automaticamente todas las notificaciones de Incumplimiento

ALTER TABLE Seguimientos DROP CONSTRAINT FK_Seguimientos_ClientesPremium;

ALTER TABLE Seguimientos ADD CONSTRAINT FK_Seguimientos_ClientesPremium
FOREIGN KEY (usuarioP) REFERENCES ClientesPremium
ON DELETE CASCADE;
---Supongamos que queremos eliminar a un cliente Premium por ende
---queremos que se elimine automaticamente todos los seguimientos asociados
--teniendo que esta es una relacion 1 a 1 por lo tanto si o si se elimina.

ALTER TABLE Recordatorios DROP CONSTRAINT FK_Recordatorios_ClientesPremium;

ALTER TABLE Recordatorios ADD CONSTRAINT FK_Recordatorios_ClientesPremium
FOREIGN KEY (usuarioP) REFERENCES ClientesPremium
ON DELETE CASCADE;
---Supongamos que se quiere eliminar un cliente premium por ende
---queremos que se elimine automaticamente todos los recordatorios existentes.


ALTER TABLE Horarios DROP CONSTRAINT FK_Horarios_Estudiante;

ALTER TABLE Horarios ADD CONSTRAINT FK_Horarios_Estudiante
FOREIGN KEY (usuario) REFERENCES Estudiantes
ON DELETE CASCADE;
---Supongamos que un estudiante decide cancelar su cuenta y eliminar su registro
---tambien se quiere que se elimine automaticamente el horario del estudiante.

ALTER TABLE ActividadesExtracurriculares DROP CONSTRAINT FK_ActividadesExtracurriculares_Estudiante;

ALTER TABLE ActividadesExtracurriculares ADD CONSTRAINT FK_ActividadesExtracurriculares_Estudiante
FOREIGN KEY (usuario) REFERENCES estudiantes
ON DELETE CASCADE;
---Si un Estudiante es eliminado se quiere que se eliminen todas las
---actividades extracurriculares que tenia asociadas.

ALTER TABLE ClienteAprendizaje DROP CONSTRAINT FK_clienteAprendizaje_CLIENTE;

ALTER TABLE ClienteAprendizaje
ADD CONSTRAINT FK_clienteAprendizaje_CLIENTE 
FOREIGN KEY (usuario)
REFERENCES ClientesPremium(usuarioE) 
ON DELETE CASCADE;

-- Sección AccionesOK

INSERT INTO Facturas(codigo, usuarioP, fecha, costo, numeroDeCuotas, documento, transaccion)
VALUES (245,1002546,TO_DATE('2024-08-27','YYYY-MM-DD'), 45000.00 ,6, 'https://www.factureALKOSTO.pdf', 'P');

INSERT INTO Tarjetas (codigoFactura, nombrePropietario, numeroTarjeta, fechaVencimiento, codigoDeSeguridad, tipoTarjeta)
VALUES (245, 'Marcela Villagran', '8544154855148957', TO_DATE('2024-07-15', 'YYYY-MM-DD'), '859', 'DB');

INSERT INTO NotificacionesIncumplimientos (idIncumplimiento, fechaTransaccion, descripcion, codigoFactura)
VALUES (4587451, TO_DATE('2024-05-14', 'YYYY-MM-DD'),'Ha dejado retrasar su pago', 245);

DELETE SEGUIMIENTOS WHERE usuarioP =  1046895;
INSERT INTO Seguimientos (usuarioP, prioridad, fechaFin, descripcion)
VALUES (1046895, 'A', TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'vas Bien Sigue así');
DELETE FROM CLIENTESPREMIUM WHERE usuarioE =  1046895;

INSERT INTO Recordatorios (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP)
VALUES (011, 'Entrega Proyecto', TO_DATE('2024-03-24', 'YYYY-MM-DD'),TO_DATE('2024-03-24', 'YYYY-MM-DD'), 1002546);

INSERT INTO ActividadesExtracurriculares (idActividad, usuario, nombre, tipo, duracion, ubicacion)
VALUES(887542,1002546,'CLASE MUSICA','MU','2','Ciudadela Musical.');