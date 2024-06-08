/*-------------------------------CRUDI-------------------------------*/
CREATE OR REPLACE PACKAGE BODY PC_FUNCIONESEXCLUSIVAS AS
    PROCEDURE AD_ClienteAprendizaje(p_usuario IN NUMBER, p_idAprendizaje IN NUMBER) IS
    BEGIN
        INSERT INTO ClienteAprendizaje(usuario,idAprendizaje)
        VALUES(p_usuario,p_idAprendizaje);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20521, 'No se inserto correctamente el estudiante al grupo');
    END AD_ClienteAprendizaje;

    PROCEDURE DE_ClienteAprendizaje(p_usuario IN NUMBER, p_idAprendizaje IN NUMBER) IS
    BEGIN
        DELETE FROM ClienteAprendizaje WHERE usuario = p_usuario and idAprendizaje = p_idAprendizaje;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20522,'No se puede eliminar al estudiante del grupo');
        END DE_ClienteAprendizaje;

    PROCEDURE DE_ClienteAprendizajeusuario(p_usuario IN NUMBER) IS
    BEGIN
        DELETE FROM ClienteAprendizaje WHERE usuario = p_usuario;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20523, 'No se puede eliminar el usuario');
    END DE_ClienteAprendizajeusuario;

    PROCEDURE DE_ClienteAprendizajeid(p_idAprendizaje IN NUMBER) IS
    BEGIN
        DELETE FROM ClienteAprendizaje WHERE idAprendizaje = p_idAprendizaje;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20524, 'No se puede eliminar el idAprendizaje');
    END DE_ClienteAprendizajeid;

    FUNCTION  CO_ClienteAprendizajeUsuario(p_usuario IN NUMBER) RETURN SYS_REFCURSOR IS
        Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM ClienteAprendizaje WHERE usuario = p_usuario;
        RETURN Vcursor;
    END CO_ClienteAprendizajeUsuario;

    FUNCTION  CO_ClienteAprendizaje(p_idAprendizaje IN NUMBER) RETURN SYS_REFCURSOR IS
        Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM ClienteAprendizaje WHERE idAprendizaje = p_idAprendizaje;
        RETURN Vcursor;
    END CO_ClienteAprendizaje;

    PROCEDURE AD_AprendizajesGrupales(p_idAprendizaje IN NUMBER, p_descripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO ApredizajesGrupales(idAprendizaje, cantidadMiembros, descripcion)
        VALUES(p_idAprendizaje, 0, p_descripcion);
        COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE_APPLICATION_ERROR(-20525, 'No se puede añadir la descripcion');
    END AD_AprendizajesGrupales;

    PROCEDURE MO_AprendizajeGrupales(p_idAprendizaje IN NUMBER, p_cantidadMiembros IN NUMBER, p_descripcion IN VARCHAR) IS
    BEGIN
        UPDATE ApredizajesGrupales SET cantidadMiembros = p_cantidadMiembros, descripcion = p_descripcion
        WHERE idAprendizaje = p_idAprendizaje;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20526,'No se puede modificar la cantidad de miembros');
    END MO_AprendizajeGrupales;

    PROCEDURE DE_AprendizajeGrupales(p_idAprendizaje IN NUMBER) IS
    BEGIN
        DELETE FROM ApredizajesGrupales WHERE idAprendizaje = p_idAprendizaje;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20527,'No se puede eliminar el aprendizaje Grupal');
    END DE_AprendizajeGrupales;

    FUNCTION  CO_AprendizajeGrupales(p_idAprendizaje IN NUMBER) RETURN SYS_REFCURSOR IS
        Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM ApredizajesGrupales WHERE idAprendizaje = p_idAprendizaje;
        RETURN Vcursor;
    END CO_AprendizajeGrupales;

    FUNCTION  CO_AprendizajeGrupalesTotal RETURN SYS_REFCURSOR IS
        Vcursos SYS_REFCURSOR;
    BEGIN
        OPEN Vcursos FOR
        SELECT * FROM ApredizajesGrupales;
        RETURN Vcursos;
    END CO_AprendizajeGrupalesTotal;

    PROCEDURE AD_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR) IS
    BEGIN
        INSERT INTO Seguimientos(USUARIOP, PRIORIDAD, FECHAFIN, DESCRIPCION)
        VALUES(p_usuarioE, p_prioridad, p_fecha, p_descripcion);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20528, 'No se puedo agregar el Seguimiento');
    END AD_Seguimiento;

    PROCEDURE MO_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR) IS
    BEGIN
        UPDATE Seguimientos SET prioridad = p_prioridad, FECHAFIN = p_fecha, descripcion = p_descripcion
        WHERE USUARIOP = p_usuarioE;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
            RAISE_APPLICATION_ERROR(-20529,'No se pueden modificar los Seguimientos');
    END MO_Seguimiento;

    PROCEDURE DE_Seguimiento(p_usuario IN NUMBER) IS
    BEGIN
        DELETE FROM Seguimientos WHERE USUARIOP = p_usuario;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20530,'No se pueden eliminar los Seguimientos');
    END DE_Seguimiento;

    FUNCTION CO_Seguimieneto(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR IS
        Vcursos SYS_REFCURSOR;
    BEGIN
        OPEN Vcursos FOR
        SELECT * FROM seguimientos
                 WHERE USUARIOP = p_usuarioE;
        RETURN Vcursos;
    END CO_Seguimieneto;

    FUNCTION CO_SeguimienetoTotal RETURN SYS_REFCURSOR IS
        Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM  seguimientos;
        RETURN Vcursor;
    END CO_SeguimienetoTotal;

    FUNCTION CO_SeguimienetoTotal(p_prioridad IN CHAR) RETURN SYS_REFCURSOR IS Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM seguimientos WHERE prioridad = p_prioridad;
        RETURN Vcursor;
    END CO_SeguimienetoTotal;

    PROCEDURE AD_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE) IS
    BEGIN
        INSERT INTO Recordatorios(USUARIOP, NOMBRE, HORAINICIO, HORAFINAL)
        VALUES(p_usuarioE, p_nombre, p_horaInicio, p_horaFinal);
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20531, 'No se puedo agregar el Recordatorio');
    END AD_Recordatorio;

    PROCEDURE MO_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE) IS
    BEGIN
        UPDATE Recordatorios SET NOMBRE = p_nombre, HORAINICIO = p_horaInicio, HORAFINAL = p_horaFinal
        WHERE USUARIOP = p_usuarioE;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20532,'No se pueden modificar los Recordatorios');
    END MO_Recordatorio;

    PROCEDURE DE_Recordatorio(p_idRecordatorio IN NUMBER) IS
    BEGIN
        DELETE FROM Recordatorios WHERE IDRECORDATORIO = p_idRecordatorio;
        COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20533,'No se pueden eliminar los Recordatorios');
    END DE_Recordatorio;

    FUNCTION  CO_Recordatorio(p_idRecordatorio IN NUMBER) RETURN SYS_REFCURSOR IS Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM Recordatorios WHERE USUARIOP = p_idRecordatorio;
        RETURN Vcursor;
    END CO_Recordatorio;

    FUNCTION  CO_RecordatorioUsuario(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR IS Vcursor SYS_REFCURSOR;
    BEGIN
        OPEN Vcursor FOR
        SELECT * FROM Recordatorios WHERE USUARIOP = p_usuarioE;
        RETURN Vcursor;
    END CO_RecordatorioUsuario;
END PC_FUNCIONESEXCLUSIVAS;
/

------PACKAGE PC_PAGOS-----
CREATE OR REPLACE PACKAGE BODY PC_PAGOS AS
    PROCEDURE AD_FACTURA_COMPLETA (p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2,
                          p_nombrePropietario VARCHAR2, p_numeroTarjeta VARCHAR2, p_fechaVencimiento DATE,
                          p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2) IS
    BEGIN
        INSERT INTO FACTURAS (USUARIOP, COSTO, NUMERODECUOTAS, TRANSACCION)
        VALUES (p_usuario, p_costo, p_numeroCuotas, p_transaccion);

        INSERT INTO TARJETAS (CODIGOFACTURA, NOMBREPROPIETARIO, NUMEROTARJETA, FECHAVENCIMIENTO, CODIGODESEGURIDAD, TIPOTARJETA)
        VALUES (SEQ_FACTURAS.CURRVAL, p_nombrePropietario, p_numeroTarjeta, p_fechaVencimiento, p_codigoDeSeguridad, p_tipoTarjeta);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20501, 'No se pudo insertar la factura ni la tarjeta');
    END AD_FACTURA_COMPLETA;

    PROCEDURE AD_FACTURA(p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2) IS
    BEGIN
        INSERT INTO FACTURAS (USUARIOP, COSTO, NUMERODECUOTAS, TRANSACCION)
        VALUES (p_usuario, p_costo, p_numeroCuotas, p_transaccion);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20502, 'No se pudo insertar la factura');
    END AD_FACTURA;

    PROCEDURE MO_FACTURA (p_codigo NUMBER, p_transaccion VARCHAR2) IS
    BEGIN
        UPDATE FACTURAS
        SET TRANSACCION = p_transaccion
        WHERE CODIGO = p_codigo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20503, 'No se pudo modificar la factura');
    END MO_FACTURA;

    PROCEDURE EL_FACTURA (p_codigo NUMBER) IS
    BEGIN
        DELETE FROM FACTURAS
        WHERE CODIGO = p_codigo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20504, 'No se pudo eliminar la factura');
    END EL_FACTURA;

    FUNCTION CO_FACTURAS RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS;
        RETURN v_cursor;
    END CO_FACTURAS;

    FUNCTION CO_FACTURA (p_codigo NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS
            WHERE CODIGO = p_codigo;
        RETURN v_cursor;
    END CO_FACTURA;

    FUNCTION CO_FACTURA_COMPLETA (p_codigo NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS_COMPLETAS
            WHERE CODIGO = p_codigo;
        RETURN v_cursor;
    END CO_FACTURA_COMPLETA;

    FUNCTION CO_FACTURAS_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS
            WHERE USUARIOP = p_usuario;
        RETURN v_cursor;
    END CO_FACTURAS_CLIENTES;

    FUNCTION CO_FACTURAS_FALLIDAS RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS
            WHERE TRANSACCION = 'F';
        RETURN v_cursor;
    END CO_FACTURAS_FALLIDAS;

    FUNCTION CO_FACTURAS_EN_PROCESO RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM FACTURAS
            WHERE TRANSACCION = 'P';
        RETURN v_cursor;
    END CO_FACTURAS_EN_PROCESO;

    PROCEDURE AD_TARJETA (p_codigoFactura NUMBER, p_nombrePropietario VARCHAR2,p_numeroTarjeta VARCHAR2,
                          p_fechaVencimiento DATE, p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2) IS
    BEGIN
        INSERT INTO TARJETAS (CODIGOFACTURA, NOMBREPROPIETARIO, NUMEROTARJETA, FECHAVENCIMIENTO, CODIGODESEGURIDAD, TIPOTARJETA)
        VALUES (p_codigoFactura, p_nombrePropietario, p_numeroTarjeta, p_fechaVencimiento, p_codigoDeSeguridad, p_tipoTarjeta);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20505, 'No se pudo insertar la tarjeta');
    END AD_TARJETA;

    PROCEDURE DE_TARJETA (p_codigoFactura NUMBER) IS
    BEGIN
        DELETE FROM TARJETAS
        WHERE CODIGOFACTURA = p_codigoFactura;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20506, 'No se pudo eliminar la tarjeta');
    END DE_TARJETA;

    FUNCTION CO_TARJETAS (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM TARJETAS
            WHERE CODIGOFACTURA = p_codigoFactura;
        RETURN v_cursor;
    END CO_TARJETAS;

    FUNCTION CO_TARJETAS_TOTAL RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM TARJETAS;
        RETURN v_cursor;
    END CO_TARJETAS_TOTAL;

    PROCEDURE AD_NOTIFICACION (p_codigoFactura NUMBER, p_fecha DATE, p_descripcion VARCHAR2) IS
    BEGIN
        INSERT INTO NOTIFICACIONESINCUMPLIMIENTOS (FECHATRANSACCION, DESCRIPCION, CODIGOFACTURA)
        VALUES (p_fecha, p_descripcion, p_codigoFactura);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20507, 'No se pudo insertar la notificacion');
    END AD_NOTIFICACION;

    PROCEDURE MO_NOTIFICACION (p_codigo NUMBER, p_descripcion VARCHAR2) IS
    BEGIN
        UPDATE NOTIFICACIONESINCUMPLIMIENTOS
        SET DESCRIPCION = p_descripcion
        WHERE IDINCUMPLIMIENTO = p_codigo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20508, 'No se pudo modificar la notificacion');
    END MO_NOTIFICACION;

    PROCEDURE EL_NOTIFICACION (p_codigo NUMBER) IS
    BEGIN
        DELETE FROM NOTIFICACIONESINCUMPLIMIENTOS
        WHERE IDINCUMPLIMIENTO = p_codigo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20509, 'No se pudo eliminar la notificacion');
    END EL_NOTIFICACION;

    FUNCTION CO_NOTIFICACIONES (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM NOTIFICACIONESINCUMPLIMIENTOS
            WHERE CODIGOFACTURA = p_codigoFactura;
        RETURN v_cursor;
    END CO_NOTIFICACIONES;

    FUNCTION CO_NOTIFICACIONES_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM NOTIFICACIONESINCUMPLIMIENTOS
            WHERE CODIGOFACTURA IN (SELECT CODIGO FROM FACTURAS WHERE USUARIOP = p_usuario);
        RETURN v_cursor;
    END CO_NOTIFICACIONES_CLIENTES;

    FUNCTION CO_NOTIFICACIONES_TOTAL RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM NOTIFICACIONESINCUMPLIMIENTOS;
        RETURN v_cursor;
    END CO_NOTIFICACIONES_TOTAL;
END PC_PAGOS;
/


CREATE OR REPLACE PACKAGE BODY PC_HORARIOS AS

    PROCEDURE AD_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE) IS
    BEGIN
        INSERT INTO HORARIOS(USUARIO, FRANJAS)
        VALUES (p_usuario, p_franjas);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20401, 'No se pudo insertar el horario');
    END AD_HORARIO;

    PROCEDURE MO_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE) IS
    BEGIN
        UPDATE HORARIOS
        SET FRANJAS = p_franjas
        WHERE USUARIO = p_usuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20541, 'No se pudo modificar el horario');
    END MO_HORARIO;

    PROCEDURE DE_HORARIO(p_usuario IN NUMBER) IS
    BEGIN
        DELETE FROM HORARIOS
        WHERE USUARIO = p_usuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20542, 'No se pudo eliminar el horario');
    END DE_HORARIO;

    FUNCTION CO_HORARIO(p_usuario IN NUMBER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM HORARIOS
            WHERE USUARIO = p_usuario;
        RETURN v_cursor;
    END CO_HORARIO;

    PROCEDURE AD_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                          p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2) IS
    BEGIN
        INSERT INTO ACTIVIDADESEXTRACURRICULARES (IDACTIVIDAD, USUARIO, NOMBRE, TIPO, DURACION, UBICACION)
        VALUES (p_idActividad, p_usuario, p_nombre, p_tipo, p_duracion, p_ubicacion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20543, 'No se pudo insertar la actividad extracurricular');
    END AD_ActividadExtracurricular;

    PROCEDURE MO_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                          p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2) IS
    BEGIN
        UPDATE ACTIVIDADESEXTRACURRICULARES
        SET NOMBRE = p_nombre, TIPO = p_tipo, DURACION = p_duracion, UBICACION = p_ubicacion
        WHERE IDACTIVIDAD = p_idActividad;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20544, 'No se pudo modificar la actividad extracurricular');
    END MO_ActividadExtracurricular;

    PROCEDURE DE_ActividadExtracurricular(p_idActividad IN NUMBER) IS
    BEGIN
        DELETE FROM ACTIVIDADESEXTRACURRICULARES
        WHERE IDACTIVIDAD = p_idActividad;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20545, 'No se pudo eliminar la actividad extracurricular');
    END DE_ActividadExtracurricular;

    FUNCTION CO_ActividadExtracurricular(p_idActividad IN NUMBER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM ACTIVIDADESEXTRACURRICULARES
            WHERE IDACTIVIDAD = p_idActividad;
        RETURN v_cursor;
    END CO_ActividadExtracurricular;

    FUNCTION CO_ActividadExtracurricular RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM ACTIVIDADESEXTRACURRICULARES;
        RETURN v_cursor;
    END CO_ActividadExtracurricular;
END PC_HORARIOS;
/
