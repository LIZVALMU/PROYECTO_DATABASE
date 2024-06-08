
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR2 AS
    PROCEDURE AD_FACTURA_COMPLETA(p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2,
                          p_nombrePropietario VARCHAR2, p_numeroTarjeta VARCHAR2, p_fechaVencimiento DATE,
                          p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2) IS
    BEGIN
        PC_PAGOS.AD_FACTURA_COMPLETA(p_usuario, p_costo, p_numeroCuotas, p_transaccion,
                          p_nombrePropietario, p_numeroTarjeta, p_fechaVencimiento,
                          p_codigoDeSeguridad, p_tipoTarjeta);
    end AD_FACTURA_COMPLETA;

    PROCEDURE AD_FACTURA(p_usuario NUMBER, p_costo NUMBER, p_numeroCuotas NUMBER, p_transaccion VARCHAR2) IS
    BEGIN
        PC_PAGOS.AD_FACTURA(p_usuario, p_costo, p_numeroCuotas, p_transaccion);
    end AD_FACTURA;

    PROCEDURE MO_FACTURA (p_codigo NUMBER, p_transaccion VARCHAR2) IS
    BEGIN
        PC_PAGOS.MO_FACTURA(p_codigo, p_transaccion);
    end MO_FACTURA;

    PROCEDURE EL_FACTURA (p_codigo NUMBER) IS
    BEGIN
        PC_PAGOS.EL_FACTURA(p_codigo);
    end EL_FACTURA;

    FUNCTION CO_FACTURAS RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURAS;
    end CO_FACTURAS;

    FUNCTION CO_FACTURA (p_codigo NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURA(p_codigo);
    end CO_FACTURA;

    FUNCTION CO_FACTURA_COMPLETA (p_codigo NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURA_COMPLETA(p_codigo);
    end CO_FACTURA_COMPLETA;

    FUNCTION CO_FACTURAS_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURAS_CLIENTES(p_usuario);
    end CO_FACTURAS_CLIENTES;

    FUNCTION CO_FACTURAS_FALLIDAS RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURAS_FALLIDAS;
    end CO_FACTURAS_FALLIDAS;

    FUNCTION CO_FACTURAS_EN_PROCESO RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_FACTURAS_EN_PROCESO;
    end CO_FACTURAS_EN_PROCESO;

    PROCEDURE AD_TARJETA (p_codigoFactura NUMBER, p_nombrePropietario VARCHAR2,p_numeroTarjeta VARCHAR2,
                          p_fechaVencimiento DATE, p_codigoDeSeguridad VARCHAR2, p_tipoTarjeta VARCHAR2) IS
    BEGIN
        PC_PAGOS.AD_TARJETA(p_codigoFactura, p_nombrePropietario,p_numeroTarjeta,
                          p_fechaVencimiento, p_codigoDeSeguridad, p_tipoTarjeta);
    end AD_TARJETA;

    PROCEDURE DE_TARJETA (p_codigoFactura NUMBER) IS
    BEGIN
        PC_PAGOS.DE_TARJETA(p_codigoFactura);
    end DE_TARJETA;

    FUNCTION CO_TARJETAS (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_TARJETAS(p_codigoFactura);
    end CO_TARJETAS;

    FUNCTION CO_TARJETAS_TOTAL RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_TARJETAS_TOTAL;
    end CO_TARJETAS_TOTAL;

    PROCEDURE AD_NOTIFICACION (p_codigoFactura NUMBER, p_fecha DATE, p_descripcion VARCHAR2) IS
    BEGIN
        PC_PAGOS.AD_NOTIFICACION(p_codigoFactura, p_fecha, p_descripcion);
    end AD_NOTIFICACION;

    PROCEDURE MO_NOTIFICACION (p_codigo NUMBER, p_descripcion VARCHAR2) IS
    BEGIN
        PC_PAGOS.MO_NOTIFICACION(p_codigo, p_descripcion);
    end MO_NOTIFICACION;

    PROCEDURE EL_NOTIFICACION (p_codigo NUMBER) IS
    BEGIN
        PC_PAGOS.EL_NOTIFICACION(p_codigo);
    end EL_NOTIFICACION;

    FUNCTION CO_NOTIFICACIONES (p_codigoFactura NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_NOTIFICACIONES(p_codigoFactura);
    end CO_NOTIFICACIONES;

    FUNCTION CO_NOTIFICACIONES_CLIENTES (p_usuario NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_NOTIFICACIONES_CLIENTES(p_usuario);
    end CO_NOTIFICACIONES_CLIENTES;

    FUNCTION CO_NOTIFICACIONES_TOTAL RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_PAGOS.CO_NOTIFICACIONES_TOTAL;
    end CO_NOTIFICACIONES_TOTAL;

END PA_ADMINISTRADOR2;
/

CREATE OR REPLACE PACKAGE BODY PA_PROFESOR2 AS
    PROCEDURE AD_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE) IS
    BEGIN
        PC_HORARIOS.AD_HORARIO(p_usuario, p_franjas);
    END AD_HORARIO;

    PROCEDURE MO_HORARIO(p_usuario IN NUMBER, p_franjas IN XMLTYPE) IS
    BEGIN
        PC_HORARIOS.MO_HORARIO(p_usuario, p_franjas);
    END MO_HORARIO;

    PROCEDURE DE_HORARIO(p_usuario IN NUMBER) IS
    BEGIN
        PC_HORARIOS.DE_HORARIO(p_usuario);
    END DE_HORARIO;

    FUNCTION CO_HORARIO(p_usuario IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_HORARIOS.CO_HORARIO(p_usuario);
    END CO_HORARIO;

    PROCEDURE AD_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                          p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2) IS
    BEGIN
        PC_HORARIOS.AD_ActividadExtracurricular(p_idActividad, p_usuario, p_nombre, p_tipo, p_duracion, p_ubicacion);
    END AD_ActividadExtracurricular;

    PROCEDURE MO_ActividadExtracurricular(p_idActividad IN NUMBER, p_usuario IN NUMBER, p_nombre IN VARCHAR2,
                                          p_tipo IN CHAR, p_duracion IN XMLTYPE, p_ubicacion IN VARCHAR2) IS
    BEGIN
        PC_HORARIOS.MO_ActividadExtracurricular(p_idActividad, p_usuario, p_nombre, p_tipo, p_duracion, p_ubicacion);
    END MO_ActividadExtracurricular;

    PROCEDURE DE_ActividadExtracurricular(p_idActividad IN NUMBER) IS
    BEGIN
        PC_HORARIOS.DE_ActividadExtracurricular(p_idActividad);
    END DE_ActividadExtracurricular;

    FUNCTION CO_ActividadExtracurricular(p_idActividad IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_HORARIOS.CO_ActividadExtracurricular(p_idActividad);
    END CO_ActividadExtracurricular;

    FUNCTION CO_ActividadExtracurricular RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_HORARIOS.CO_ActividadExtracurricular;
    END CO_ActividadExtracurricular;

    PROCEDURE AD_AprendizajesGrupales(p_idAprendizaje IN NUMBER, p_descripcion IN VARCHAR) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.AD_AprendizajesGrupales(p_idAprendizaje, p_descripcion);
    END AD_AprendizajesGrupales;

    PROCEDURE MO_AprendizajeGrupales(p_idAprendizaje IN NUMBER, p_cantidadMiembros IN NUMBER, p_descripcion IN VARCHAR) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.MO_AprendizajeGrupales(p_idAprendizaje, p_cantidadMiembros, p_descripcion);
    END MO_AprendizajeGrupales;

    PROCEDURE DE_AprendizajeGrupales(p_idAprendizaje IN NUMBER) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.DE_AprendizajeGrupales(p_idAprendizaje);
    END DE_AprendizajeGrupales;

    FUNCTION CO_AprendizajeGrupales(p_idAprendizaje IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_AprendizajeGrupales(p_idAprendizaje);
    END CO_AprendizajeGrupales;

    FUNCTION CO_AprendizajeGrupalesTotal RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_AprendizajeGrupalesTotal;
    END CO_AprendizajeGrupalesTotal;

    PROCEDURE AD_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.AD_Seguimiento(p_usuarioE, p_prioridad, p_fecha, p_descripcion);
    END AD_Seguimiento;

    PROCEDURE MO_Seguimiento(p_usuarioE IN NUMBER, p_prioridad IN CHAR, p_fecha IN DATE, p_descripcion IN VARCHAR) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.MO_Seguimiento(p_usuarioE, p_prioridad, p_fecha, p_descripcion);
    END MO_Seguimiento;

    PROCEDURE DE_Seguimiento(p_usuario IN NUMBER) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.DE_Seguimiento(p_usuario);
    END DE_Seguimiento;

    FUNCTION CO_Seguimieneto(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_Seguimieneto(p_usuarioE);
    END CO_Seguimieneto;

    FUNCTION CO_SeguimienetoTotal RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_SeguimienetoTotal;
    END CO_SeguimienetoTotal;

    FUNCTION CO_SeguimienetoTotal(p_prioridad IN CHAR) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_SeguimienetoTotal(p_prioridad);
    END CO_SeguimienetoTotal;

    PROCEDURE AD_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.AD_Recordatorio(p_usuarioE, p_nombre, p_horaInicio, p_horaFinal);
    END AD_Recordatorio;

    PROCEDURE MO_Recordatorio(p_usuarioE IN NUMBER, p_nombre IN VARCHAR, p_horaInicio IN DATE, p_horaFinal IN DATE) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.MO_Recordatorio(p_usuarioE, p_nombre, p_horaInicio, p_horaFinal);
    END MO_Recordatorio;

    PROCEDURE DE_Recordatorio(p_idRecordatorio IN NUMBER) IS
    BEGIN
        PC_FUNCIONESEXCLUSIVAS.DE_Recordatorio(p_idRecordatorio);
    END DE_Recordatorio;

    FUNCTION CO_Recordatorio(p_idRecordatorio IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_Recordatorio(p_idRecordatorio);
    END CO_Recordatorio;

    FUNCTION CO_RecordatorioUsuario(p_usuarioE IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_FUNCIONESEXCLUSIVAS.CO_RecordatorioUsuario(p_usuarioE);
    END CO_RecordatorioUsuario;
END PA_PROFESOR2;
/


