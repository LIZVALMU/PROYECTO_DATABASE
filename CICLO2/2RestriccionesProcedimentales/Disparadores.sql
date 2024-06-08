/*------------------------------------ Disparadores------------------------------------*/
CREATE SEQUENCE SEQ_FACTURAS
START WITH 10
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_NOTIFICACIONES
START WITH 10
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_RECORDATORIOS
START WITH 10
INCREMENT BY 1
NOCACHE
NOCYCLE;


--En este disparador lo primero es que la PK es autoincrementable, el documento se inserta con un formato
--predefinido y la fecha se inserta en el momento actual de la inserccion.
CREATE OR REPLACE TRIGGER TR_FacturaDocumento_BI
BEFORE INSERT ON Facturas
FOR EACH ROW
declare
    v_codigo varchar2(15);
BEGIN
    :NEW.CODIGO := SEQ_FACTURAS.NEXTVAL;
    SELECT REPLACE(NOMBRE, ' ', '') INTO v_codigo FROM ESTUDIANTES WHERE USUARIO = :NEW.USUARIOP;
    :NEW.DOCUMENTO := 'https://TimesWiseStudent/factura/' || v_codigo || '/' || :NEW.CODIGO || '.pdf';
    :NEW.FECHA := SYSDATE;
END;
/

--Disparador si la tarjeta es de tipo debito (DB) entonces automaticamente el numero de cuota
--se actualiza a 1.
CREATE OR REPLACE TRIGGER TR_TarjetaTipo_BI
BEFORE INSERT ON Tarjetas
FOR EACH ROW
BEGIN 
    IF :NEW.tipoTarjeta = 'DB' THEN
        UPDATE Facturas SET numeroDeCuotas = 1 WHERE codigo = :New.codigoFactura;
    END IF;
END;
/

---Disparador de Seguridad de Tarjetas, en este se incripta los 12 primeros digitos por X y solo 
--se visualizan los ultimos 4 digitos.
CREATE OR REPLACE TRIGGER TR_TARJETASNUMEROTARJETA_BI
BEFORE INSERT ON TARJETAS
FOR EACH ROW
DECLARE 
    v_codigo varchar2(15);
BEGIN
    v_codigo := SUBSTR(:NEW.NUMEROTARJETA, 13, 16);
    :NEW.NUMEROTARJETA := 'XXXXXXXXXXXXX' || v_codigo;
END;
/

--Disparador que no se pueda modificar ningun atributo en facturas
CREATE OR REPLACE TRIGGER TR_Factura_BU
BEFORE UPDATE of CODIGO, USUARIOP, COSTO, FECHA, DOCUMENTO ON FACTURAS
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20008, 'No se puede modificar una factura');
END;
/

--Disparador, no se pueden Eliminar transaccion en proceso o fallidas.
CREATE OR REPLACE TRIGGER TR_FacturaTransaccion_BD
BEFORE DELETE ON Facturas 
FOR EACH ROW
BEGIN 
    IF :OLD.transaccion = 'P' OR :OLD.transaccion = 'F' THEN 
    RAISE_APPLICATION_ERROR(-20009, 'No se pueden eliminar facturas con transacciones en proceso o fallidas');
    END IF;
END;
/

---Disparador, Este funciona para que una factura no tenga más de 5 notificacion de incumplimiento.
CREATE OR REPLACE TRIGGER TR_NOTIFICACIONES_BI
BEFORE INSERT ON NotificacionesIncumplimientos
FOR EACH ROW
DECLARE
    v_contador number;
BEGIN
    SELECT COUNT(*) INTO v_contador FROM NotificacionesIncumplimientos WHERE codigoFactura = :NEW.codigoFactura;
    IF v_contador >= 5 THEN
        RAISE_APPLICATION_ERROR(-20010, 'No se puede tener mas de 5 notificaciones de incumplimiento');
    END IF;
END;
/

---Disparador, Se actualiza la cantidad de miembros en la tabla cliente Aprendizaje cada
--vez que se inserte un nuevo cliente Premium 
CREATE OR REPLACE TRIGGER TR_APRENDEIZAJE_CLIENTE_AI
AFTER INSERT ON ClienteAprendizaje
BEGIN
    UPDATE ApredizajesGrupales c
    SET cantidadMiembros = (SELECT COUNT(*) FROM ClienteAprendizaje d WHERE d.idAprendizaje = c.idAprendizaje)
    WHERE c.idAprendizaje IN(SELECT DISTINCT idAprendizaje FROM clienteAprendizaje);
END;
/

---Disparador, Se incrementa automaticamente la PK
CREATE OR REPLACE TRIGGER TR_NOTIFICACIONESIDINCUMPLIMIENTO_BI
BEFORE INSERT ON NotificacionesIncumplimientos
FOR EACH ROW
BEGIN
    :NEW.idIncumplimiento := SEQ_NOTIFICACIONES.NEXTVAL;
END;
/

---Disparador, Se incrementa automaticamente la PK de recordatorio
CREATE OR REPLACE TRIGGER TR_RECORDATORIOS_BI
BEFORE INSERT ON RECORDATORIOS
FOR EACH ROW
BEGIN
    :NEW.IDRECORDATORIO := SEQ_RECORDATORIOS.NEXTVAL;
END;
/

TRUNCATE TABLE SEGUIMIENTOS;
TRUNCATE TABLE RECORDATORIOS;
TRUNCATE TABLE CLIENTEAPRENDIZAJE;
TRUNCATE TABLE APREDIZAJESGRUPALES;
TRUNCATE TABLE NOTIFICACIONESINCUMPLIMIENTOS;
TRUNCATE TABLE TARJETAS;
TRUNCATE TABLE FACTURAS;
SELECT * FROM FACTURAS;

ALTER TRIGGER TR_FacturaTransaccion_BD ENABLE;
/*------------------------------------DisparadoresOk------------------------------------*/
INSERT INTO INSTITUCIONES (CODIGO, NOMBRE, DIRECCION, TIPO) values (34690427238508, 'Université  V - Souissi', '2 Forest Run Court', 'U');
INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro,codigoInstitucion) VALUES (119319935, 'Laura Linares', 'laulinares@hotmal.com', 20918754, 'Medicina', TO_DATE('2022-07-24', 'YYYY-MM-DD'), 34690427238508);
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion) VALUES (119319935, 'PE', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3002553495, 'Avenida Calle 26 No 59-51 Edificio');

--TR_FacturaDocumento_BI
INSERT INTO Facturas (usuarioP, costo, transaccion, numeroDeCuotas) VALUES (119319935, 100000, 'P', 3);
SELECT * FROM FACTURAS;
SELECT SEQ_FACTURAS.currval FROM DUAL;

--TR_TarjetaTipo_BI
--TR_TARJETASNUMEROTARJETA_BI
INSERT INTO Tarjetas (codigoFactura, nombrePropietario, numeroTarjeta, fechaVencimiento, codigoDeSeguridad, tipoTarjeta) VALUES (2, 'Nicolas Rojas', '1234123412341234', TO_DATE('2024-06-01','YYYY-MM-DD'), '452', 'DB');
SELECT * FROM TARJETAS;

--TR_Factura_BU--Seguridad
UPDATE Facturas SET costo = 200000 WHERE codigo = 2;

--TR_FacturaTransaccion_BD-Seguridad
DELETE FROM Facturas WHERE codigo = 2;

--TR_NOTIFICACIONES_BI
--TR_NOTIFICACIONESIDINCUMPLIMIENTO_BI
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);
INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (fechaTransaccion, descripcion, codigoFactura) VALUES('2021-06-01', 'Notificacion 1', 2);

--TR_APRENDEIZAJE_CLIENTE_AI

INSERT INTO APREDIZAJESGRUPALES (idAprendizaje, cantidadMiembros, descripcion) VALUES(1, 0, 'Aprendizaje 1');
SELECT * FROM APREDIZAJESGRUPALES;
INSERT INTO CLIENTEAPRENDIZAJE (idAprendizaje, usuario) VALUES(1, 119319935);

--TR_RECORDATORIOS_BI

INSERT INTO RECORDATORIOS (nombre, horaInicio, horaFinal, usuarioP) VALUES('Recordatorio 1', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 119319935);
SELECT * FROM RECORDATORIOS;


