
/*-------------ActoresE-------------*/
CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR2 AS
    PROCEDURE AD_FACTURA_COMPLETA (p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2,
                          p_nombrePropietario VARCHAR2, p_numeroTarjeta VARCHAR2, p_fechaVencimiento DATE,
                          p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2);
    PROCEDURE AD_FACTURA(p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2);
    PROCEDURE MO_FACTURA (p_codigo NUMBER, p_transaccion VARCHAR2);
    PROCEDURE EL_FACTURA (p_codigo NUMBER);
    FUNCTION CO_FACTURAS RETURN SYS_REFCURSOR;
    FUNCTION CO_FACTURA (p_codigo NUMBER) RETURN SYS_REFCURSOR; --SOLO TABLA FACTURA
    FUNCTION CO_FACTURA_COMPLETA (p_codigo NUMBER) RETURN SYS_REFCURSOR; --ADDICIONAR TABLA DE TARJETAS
    FUNCTION CO_FACTURAS_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_FACTURAS_FALLIDAS RETURN SYS_REFCURSOR;
    FUNCTION CO_FACTURAS_EN_PROCESO RETURN SYS_REFCURSOR;
    PROCEDURE AD_TARJETA (p_codigoFactura NUMBER, p_nombrePropietario VARCHAR2,p_numeroTarjeta VARCHAR2,
                          p_fechaVencimiento DATE, p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2);
    PROCEDURE DE_TARJETA (p_codigoFactura NUMBER);
    FUNCTION CO_TARJETAS (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_TARJETAS_TOTAL RETURN SYS_REFCURSOR;
    PROCEDURE AD_NOTIFICACION (p_codigoFactura NUMBER, p_fecha DATE, p_descripcion VARCHAR2);
    PROCEDURE MO_NOTIFICACION (p_codigo NUMBER, p_descripcion VARCHAR2);
    PROCEDURE EL_NOTIFICACION (p_codigo NUMBER);
    FUNCTION CO_NOTIFICACIONES (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_NOTIFICACIONES_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_NOTIFICACIONES_TOTAL RETURN SYS_REFCURSOR;
END PA_ADMINISTRADOR2;
/

CREATE OR REPLACE PACKAGE PA_PROFESOR2 AS
    PROCEDURE AD_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE);
    PROCEDURE MO_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE);
    PROCEDURE DE_HORARIO(p_usuario IN NUMBER);
    FUNCTION CO_HORARIO(p_usuario IN NUMBER) RETURN SYS_REFCURSOR;
    PROCEDURE AD_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                          p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2);
    PROCEDURE MO_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                            p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2);
    PROCEDURE DE_ActividadExtracurricular(p_idActividad IN NUMBER);
    FUNCTION CO_ActividadExtracurricular(p_idActividad IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_ActividadExtracurricular RETURN SYS_REFCURSOR;
    PROCEDURE AD_AprendizajesGrupales(p_idAprendizaje IN NUMBER, p_descripcion IN VARCHAR);
    PROCEDURE MO_AprendizajeGrupales(p_idAprendizaje IN NUMBER, p_cantidadMiembros IN NUMBER, p_descripcion IN VARCHAR);
    PROCEDURE DE_AprendizajeGrupales(p_idAprendizaje IN NUMBER);
    FUNCTION CO_AprendizajeGrupales(p_idAprendizaje IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_AprendizajeGrupalesTotal RETURN SYS_REFCURSOR;
    PROCEDURE AD_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR);
    PROCEDURE MO_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR);
    PROCEDURE DE_Seguimiento(p_usuario IN NUMBER);
    FUNCTION CO_Seguimieneto(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_SeguimienetoTotal RETURN SYS_REFCURSOR;
    FUNCTION CO_SeguimienetoTotal(p_prioridad IN CHAR) RETURN SYS_REFCURSOR;
    PROCEDURE AD_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE);
    PROCEDURE MO_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE);
    PROCEDURE DE_Recordatorio(p_idRecordatorio IN NUMBER);
    FUNCTION CO_Recordatorio(p_idRecordatorio IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_RecordatorioUsuario(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR;
END PA_PROFESOR2;
/