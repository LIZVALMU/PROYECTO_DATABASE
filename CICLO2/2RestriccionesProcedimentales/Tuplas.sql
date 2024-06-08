/*-------------------------------Tuplas--------------------------------------*/
TRUNCATE TABLE recordatorios;
ALTER TABLE Recordatorios
ADD CONSTRAINT CHK_Recordatorio_Horas
CHECK (horaFinal > horaInicio);
--Restricción de Hora final y Hora Inicial: La hora final de
--recordatorio no puede ser menor a la hora inicial.

ALTER TABLE Facturas
ADD CONSTRAINT CHK_Facturas_numeroDeCuotas
CHECK (numeroDeCuotas >= 1 and numeroDeCuotas <= 96);
--Podemos asumir que en una factura no puede tener un numero de cuotas inferior a 1
--debido a que las tarjetas no lo permiten y menor 96.

ALTER TABLE Facturas
ADD CONSTRAINT CHK_Facturas_Costo
CHECK (costo > 0);
--Podemos asumir que en una factura el costo de esta misma debe tener un valor superior
--a 0.

TRUNCATE TABLE recordatorios;



---Ingreso de datos que cumplen con las restricciones de tuplas--
INSERT INTO RECORDATORIOS (IDRECORDATORIO, NOMBRE, HORAINICIO, HORAFINAL, USUARIOP)
VALUES (1,'Informes', TO_DATE('2019-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-01-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),1002546);

INSERT INTO Facturas(codigo, usuarioP, fecha, costo, numeroDeCuotas, documento, transaccion)
VALUES (112,1002546,TO_DATE('2024-06-25','YYYY-MM-DD'),1000.00, 12 , 'https://www.facture.pdf', 'P');

INSERT INTO Facturas(codigo, usuarioP, fecha, costo, numeroDeCuotas, documento, transaccion)
VALUES (115,1002546,TO_DATE('2024-05-27','YYYY-MM-DD'), 5000.00 ,4, 'https://www.factureri.pdf', 'E');


/-------------------------------TuplasNoOk-------------------------------/
--Intento de ingreso de datos que violan las restricciones de tuplas
INSERT INTO RECORDATORIOS (IDRECORDATORIO, NOMBRE, HORAINICIO, HORAFINAL, USUARIOP)
VALUES (12,'Evaluacion bases', TO_DATE('2019-01-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),1002546);

INSERT INTO Facturas(codigo, usuarioP, fecha, costo, numeroDeCuotas, documento, transaccion)
VALUES (113,1009321,TO_DATE('2024-06-25','YYYY-MM-DD'), 3000.00, 0, 'https://www.ventafacture.pdf', 'F');

INSERT INTO Facturas(codigo, usuarioP, fecha, costo, numeroDeCuotas, documento, transaccion)
VALUES (115,1046895,TO_DATE('2024-05-27','YYYY-MM-DD'), -5000.00 ,1,'https://www.facture.pdf', 'E');

INSERT INTO RECORDATORIOS (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP) VALUES(1, 'Entregar Informe 1', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1002546);
INSERT INTO RECORDATORIOS (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP) VALUES(2, 'Actividad', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1005896);
INSERT INTO RECORDATORIOS (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP) VALUES(3, 'Clase Natacion', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1077083);
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion) VALUES (1046895, 'P', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3124904152, 'Transvesal 7 15-51 Casa 101');
INSERT INTO RECORDATORIOS (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP) VALUES(4, 'Evaluacion bases', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1046895);
INSERT INTO RECORDATORIOS (idRecordatorio, nombre, horaInicio, horaFinal, usuarioP) VALUES(5, 'Sustentacion lab 5', TO_DATE('2021-06-01 08:00:00','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2021-06-02 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1009321);
