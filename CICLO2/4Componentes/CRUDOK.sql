
/*--------------------------------------------CRUDOK--------------------------------------------*/
------PACKAGE PC_PAGOS-----
insert into Estudiantes (USUARIO, NOMBRE, CORREO, CONTRASENA, PROGRAMA, REGISTRO, CODIGOINSTITUCION) values (1003606618, 'Adaline', 'aruddoch1t@adobe.com', 5579560627, 'Ingenieria', TO_DATE('2024-05-20', 'YYYY-MM-DD'), '6808435');
INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion) VALUES (1003606618, 'P', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 3115454646, 'Calle 100 # 11B-27 Bogotá');
TRUNCATE TABLE Facturas;
SELECT * FROM Facturas;

begin
    PC_PAGOS.AD_FACTURA_COMPLETA(1003606618, 1000, 12, 'E', 'JUAN PEREZ', '1234123412341234', TO_DATE('2024-05-27', 'YYYY-MM-DD'), '123', 'DB');
end;
/

begin
    PC_PAGOS.AD_FACTURA(1003606618, 1000, 12, 'E');
end;
/

begin
    PC_PAGOS.MO_FACTURA(15, 'P');
end;
/

begin
    PC_PAGOS.EL_FACTURA(6);
end;
/

SELECT
    PC_PAGOS.CO_FACTURAS
FROM DUAL;

SELECT
    PC_PAGOS.CO_FACTURA_COMPLETA(3)
FROM DUAL;

SELECT
    PC_PAGOS.CO_FACTURAS_CLIENTES(1046895)
FROM DUAL;

SELECT
    PC_PAGOS.CO_FACTURAS_FALLIDAS
FROM DUAL;

SELECT
    PC_PAGOS.CO_FACTURAS_EN_PROCESO
FROM DUAL;

begin
    PC_PAGOS.AD_TARJETA(4, 'JUAN PEREZ', '1234123412341234', TO_DATE('2024-05-27', 'YYYY-MM-DD'), '123', 'DB');
end;
/
SELECT * FROM TARJETAS;

begin
    PC_PAGOS.DE_TARJETA(3);
end;
/

SELECT
    PC_PAGOS.CO_TARJETAS(2)
FROM DUAL;

SELECT
    PC_PAGOS.CO_TARJETAS_TOTAL
FROM DUAL;

begin
    PC_PAGOS.AD_NOTIFICACION(11,TO_DATE('2024-05-27', 'YYYY-MM-DD'), 'NO SE PAGO');
end;
/
SELECT * FROM FACTURAS;
begin
    PC_PAGOS.MO_NOTIFICACION(1, 'NO PAGO');
end;
/

begin
    PC_PAGOS.EL_NOTIFICACION(1);
end;
/

SELECT
    PC_PAGOS.CO_NOTIFICACIONES(1)
FROM DUAL;

SELECT
    PC_PAGOS.CO_NOTIFICACIONES_CLIENTES(1003606618)
FROM DUAL;

SELECT
    PC_PAGOS.CO_NOTIFICACIONES_TOTAL
FROM DUAL;


/*-------------------------------CRUDOK-------------------------------*/
--PROCEDURE AD_ClienteAprendizaje
--PROCEDURE AD_AprendizajesGrupales
BEGIN
    PC_FUNCIONESEXCLUSIVAS.AD_AprendizajesGrupales(2, 'Grupo de esrudio MBDA');
END;
/
select * from apredizajesgrupales;

-- PROCEDURE MO_AprendizajeGrupales
BEGIN
    PC_FUNCIONESEXCLUSIVAS.MO_AprendizajeGrupales(2, 0, 'Grupo de estudio MBDA :D');
END;
/

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_AprendizajeGrupales(1)
FROM DUAL;

BEGIN
    PC_FUNCIONESEXCLUSIVAS.AD_CLIENTEAPRENDIZAJE(1003606618, 10);
END;
/

--PROCEDURE DE_ClienteAprendizaje
BEGIN
    PC_FUNCIONESEXCLUSIVAS.DE_ClienteAprendizaje(1003606618,1);
END;
/

--PROCEDURE DE_ClienteAprendizajeusuario
BEGIN
    PC_FUNCIONESEXCLUSIVAS.DE_ClienteAprendizajeusuario(1003606618);
END;
/

--PROCEDURE DE_ClienteAprendizajeid
BEGIN
    PC_FUNCIONESEXCLUSIVAS.DE_ClienteAprendizajeid(1003606618);
END;
/

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_ClienteAprendizajeUsuario(1003606618)
FROM DUAL;

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_ClienteAprendizaje(1)
FROM DUAL;

BEGIN
    PC_FUNCIONESEXCLUSIVAS.AD_Seguimiento(1003606618, 'A', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Seguimiento de prueba');
END;
/

BEGIN
    PC_FUNCIONESEXCLUSIVAS.MO_Seguimiento(1003606618, 'B', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Seguimiento de prueba');
END;

BEGIN
    PC_FUNCIONESEXCLUSIVAS.DE_Seguimiento(1003606618);
END;
/

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_Seguimieneto(1003606618)
FROM DUAL;


SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_SeguimienetoTotal
FROM DUAL;

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_SeguimienetoTotal('A')
FROM DUAL;

BEGIN
    PC_FUNCIONESEXCLUSIVAS.AD_Recordatorio(1003606618, 'Recordatorio de prueba', TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'));
END;
/

BEGIN
    PC_FUNCIONESEXCLUSIVAS.MO_Recordatorio(1003606618, 'Recordatorio de prueba', TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'));
END;
/

BEGIN
    PC_FUNCIONESEXCLUSIVAS.DE_Recordatorio(1003606618);
END;
/

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_Recordatorio(1003606618)
FROM DUAL;

SELECT
    PC_FUNCIONESEXCLUSIVAS.CO_RecordatorioUsuario(1003606618)
FROM DUAL;