
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS

    PROCEDURE AD_CURSO(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_listaDeMatriculados IN NUMBER, p_duracion IN NUMBER, p_supercursos IN NUMBER, p_codigoInstitucion IN NUMBER, p_nidProfesor IN NUMBER) IS
    BEGIN
        PC_CURSO.AD_CURSO(p_codigo, p_nombre, p_listaDeMatriculados, p_duracion, p_supercursos, p_codigoInstitucion, p_nidProfesor);
    END AD_CURSO;

    PROCEDURE MOD_CURSO(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_listaDeMatriculados IN NUMBER, p_duracion IN NUMBER, p_supercursos IN NUMBER, p_codigoInstitucion IN NUMBER, p_nidProfesor IN NUMBER) IS
    BEGIN
        PC_CURSO.MOD_CURSO(p_codigo, p_nombre, p_listaDeMatriculados, p_duracion, p_supercursos, p_codigoInstitucion, p_nidProfesor);
    END MOD_CURSO;

    PROCEDURE EL_CURSO(p_codigo IN NUMBER) IS
    BEGIN
        PC_CURSO.EL_CURSO(p_codigo);
    END EL_CURSO;

    PROCEDURE AD_PROFESOR(p_nid IN NUMBER, p_nombre IN VARCHAR2, p_telefono IN NUMBER, p_profesion IN VARCHAR2) IS
    BEGIN
        PC_PROFESOR.AD_PROFESOR(p_nid, p_nombre, p_telefono, p_profesion);
    END AD_PROFESOR;

    PROCEDURE MOD_PROFESOR(p_nid IN NUMBER, p_nombre IN VARCHAR2, p_telefono IN NUMBER, p_profesion IN VARCHAR2) IS
    BEGIN
        PC_PROFESOR.MOD_PROFESOR(p_nid, p_nombre, p_telefono, p_profesion);
    END MOD_PROFESOR;

    PROCEDURE EL_PROFESOR(p_nid IN NUMBER) IS
    BEGIN
        PC_PROFESOR.EL_PROFESOR(p_nid);
    END EL_PROFESOR;

    PROCEDURE AD_ESTUDIANTE(p_usuario IN NUMBER, p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN NUMBER, p_programa IN VARCHAR2, p_registro IN DATE, p_codigoInstitucion IN NUMBER) IS
    BEGIN
        PC_ESTUDIANTE.AD_ESTUDIANTE(p_usuario, p_nombre, p_correo, p_contrasena, p_programa, p_registro, p_codigoInstitucion);
    END AD_ESTUDIANTE;

    PROCEDURE MOD_ESTUDIANTE(p_usuario IN NUMBER, p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN NUMBER, p_programa IN VARCHAR2, p_registro IN DATE, p_codigoInstitucion IN NUMBER) IS
    BEGIN
        PC_ESTUDIANTE.MOD_ESTUDIANTE(p_usuario, p_nombre, p_correo, p_contrasena, p_programa, p_registro, p_codigoInstitucion);
    END MOD_ESTUDIANTE;

    PROCEDURE EL_ESTUDIANTE(p_usuario IN NUMBER) IS
    BEGIN
        PC_ESTUDIANTE.EL_ESTUDIANTE(p_usuario);
    END EL_ESTUDIANTE;

    PROCEDURE AD_INSTITUCION(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_tipo IN CHAR) IS
    BEGIN
        PC_INSTITUCION.AD_INSTITUCION(p_codigo, p_nombre, p_direccion, p_tipo);
    END AD_INSTITUCION;

    PROCEDURE MOD_INSTITUCION(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_tipo IN CHAR) IS
    BEGIN
        PC_INSTITUCION.MOD_INSTITUCION(p_codigo, p_nombre, p_direccion, p_tipo);
    END MOD_INSTITUCION;

    PROCEDURE EL_INSTITUCION(p_codigo IN NUMBER) IS
    BEGIN
        PC_INSTITUCION.EL_INSTITUCION(p_codigo);
    END EL_INSTITUCION;
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE BODY PA_PROFESOR IS

    FUNCTION CO_CURSO(p_codigo IN NUMBER) RETURN SYS_REFCURSOR IS
    BEGIN
        RETURN PC_CURSO.CO_CURSO(p_codigo);
    END CO_CURSO;

    PROCEDURE AD_RECURSO(p_idRecursos IN NUMBER, p_tipo IN CHAR, p_fechaPublicacion IN DATE, p_tema IN VARCHAR2, p_notasDeClase IN VARCHAR2, p_codigoCursos IN NUMBER) IS
    BEGIN
        PC_RECURSO.AD_RECURSO(p_idRecursos, p_tipo, p_fechaPublicacion, p_tema, p_notasDeClase, p_codigoCursos);
    END AD_RECURSO;

    PROCEDURE MOD_RECURSO(p_idRecursos IN NUMBER, p_tipo IN CHAR, p_fechaPublicacion IN DATE, p_tema IN VARCHAR2, p_notasDeClase IN VARCHAR2, p_codigoCursos IN NUMBER) IS
    BEGIN
        PC_RECURSO.MOD_RECURSO(p_idRecursos, p_tipo, p_fechaPublicacion, p_tema, p_notasDeClase, p_codigoCursos);
    END MOD_RECURSO;

    PROCEDURE EL_RECURSO(p_idRecursos IN NUMBER) IS
    BEGIN
        PC_RECURSO.EL_RECURSO(p_idRecursos);
    END EL_RECURSO;

    PROCEDURE AD_TAREA(p_idTarea IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_fechaDeAsignacion IN DATE, p_fechaDeVencimiento IN DATE, p_estado IN CHAR, p_codigoCurso IN NUMBER) IS
    BEGIN
        PC_TAREA.AD_TAREA(p_idTarea, p_nombre, p_descripcion, p_fechaDeAsignacion, p_fechaDeVencimiento, p_estado, p_codigoCurso);
    END AD_TAREA;

    PROCEDURE MOD_TAREA(p_idTarea IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_fechaDeAsignacion IN DATE, p_fechaDeVencimiento IN DATE, p_estado IN CHAR, p_codigoCurso IN NUMBER) IS
    BEGIN
        PC_TAREA.MOD_TAREA(p_idTarea, p_nombre, p_descripcion, p_fechaDeAsignacion, p_fechaDeVencimiento, p_estado, p_codigoCurso);
    END MOD_TAREA;

    PROCEDURE EL_TAREA(p_idTarea IN NUMBER) IS
    BEGIN
        PC_TAREA.EL_TAREA(p_idTarea);
    END EL_TAREA;

    PROCEDURE AD_CALIFICACION(p_idTarea IN NUMBER, p_puntaje IN NUMBER, p_fecha IN DATE, p_comentario IN VARCHAR2, p_estudiante IN NUMBER) IS
    BEGIN
        PC_CALIFICACION.AD_CALIFICACION(p_idTarea, p_puntaje, p_fecha, p_comentario, p_estudiante);
    END AD_CALIFICACION;

    PROCEDURE MOD_CALIFICACION (p_idTarea IN NUMBER, p_puntaje IN NUMBER, p_fecha IN DATE, p_comentario IN VARCHAR2, p_estudiante IN NUMBER) IS
    BEGIN
        PC_CALIFICACION.MOD_CALIFICACION(p_idTarea, p_puntaje, p_fecha, p_comentario);
    END MOD_CALIFICACION;

    PROCEDURE EL_CALIFICACION(p_idTarea IN NUMBER) IS
    BEGIN
        PC_CALIFICACION.EL_CALIFICACION(p_idTarea, 1);
    END EL_CALIFICACION;
END PA_PROFESOR;
/

CREATE OR REPLACE PACKAGE BODY PA_ESTUDIANTE IS

    FUNCTION CO_TAREAS(p_usuario IN NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        v_cursor := PC_TAREA.CO_TAREA(p_usuario);
    END CO_TAREAS;

    FUNCTION CO_CURSOS(p_usuario IN NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        v_cursor := PC_CURSO.CO_CURSO(p_usuario);
    END CO_CURSOS;

    FUNCTION CO_PROFESORES(p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        v_cursor := PC_PROFESOR.CO_PROFESOR(p_codigoCurso);
    END CO_PROFESORES;

    FUNCTION CO_RECURSOS(p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        v_cursor := PC_RECURSO.CO_RECURSO(p_codigoCurso);
    END CO_RECURSOS;

    FUNCTION CO_CALIFICACIONES(p_usuario IN NUMBER, p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR IS v_cursor SYS_REFCURSOR;
    BEGIN
        v_cursor := PC_CALIFICACION.CO_CALIFICACION(p_usuario, p_codigoCurso);
    END CO_CALIFICACIONES;

END PA_ESTUDIANTE;
/
