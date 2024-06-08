
--Administrador
CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS
    -- Cursos
    PROCEDURE AD_CURSO(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_listaDeMatriculados IN NUMBER, p_duracion IN NUMBER, p_supercursos IN NUMBER, p_codigoInstitucion IN NUMBER, p_nidProfesor IN NUMBER);
    PROCEDURE MOD_CURSO(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_listaDeMatriculados IN NUMBER, p_duracion IN NUMBER, p_supercursos IN NUMBER, p_codigoInstitucion IN NUMBER, p_nidProfesor IN NUMBER);
    PROCEDURE EL_CURSO(p_codigo IN NUMBER);
    -- Profesores
    PROCEDURE AD_PROFESOR(p_nid IN NUMBER, p_nombre IN VARCHAR2, p_telefono IN NUMBER, p_profesion IN VARCHAR2);
    PROCEDURE MOD_PROFESOR(p_nid IN NUMBER, p_nombre IN VARCHAR2, p_telefono IN NUMBER, p_profesion IN VARCHAR2);
    PROCEDURE EL_PROFESOR(p_nid IN NUMBER);
    -- Estudiantes
    PROCEDURE AD_ESTUDIANTE(p_usuario IN NUMBER, p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN NUMBER, p_programa IN VARCHAR2, p_registro IN DATE, p_codigoInstitucion IN NUMBER);
    PROCEDURE MOD_ESTUDIANTE(p_usuario IN NUMBER, p_nombre IN VARCHAR2, p_correo IN VARCHAR2, p_contrasena IN NUMBER, p_programa IN VARCHAR2, p_registro IN DATE, p_codigoInstitucion IN NUMBER);
    PROCEDURE EL_ESTUDIANTE(p_usuario IN NUMBER);
    -- Instituciones
    PROCEDURE AD_INSTITUCION(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_tipo IN CHAR);
    PROCEDURE MOD_INSTITUCION(p_codigo IN NUMBER, p_nombre IN VARCHAR2, p_direccion IN VARCHAR2, p_tipo IN CHAR);
    PROCEDURE EL_INSTITUCION(p_codigo IN NUMBER);
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE PA_PROFESOR IS
    -- Cursos
    FUNCTION CO_CURSO(p_codigo IN NUMBER) RETURN SYS_REFCURSOR;
    -- Recursos Adicionales
    PROCEDURE AD_RECURSO(p_idRecursos IN NUMBER, p_tipo IN CHAR, p_fechaPublicacion IN DATE, p_tema IN VARCHAR2, p_notasDeClase IN VARCHAR2, p_codigoCursos IN NUMBER);
    PROCEDURE MOD_RECURSO(p_idRecursos IN NUMBER, p_tipo IN CHAR, p_fechaPublicacion IN DATE, p_tema IN VARCHAR2, p_notasDeClase IN VARCHAR2, p_codigoCursos IN NUMBER);
    PROCEDURE EL_RECURSO(p_idRecursos IN NUMBER);
    -- Tareas
    PROCEDURE AD_TAREA(p_idTarea IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_fechaDeAsignacion IN DATE, p_fechaDeVencimiento IN DATE, p_estado IN CHAR, p_codigoCurso IN NUMBER);
    PROCEDURE MOD_TAREA(p_idTarea IN NUMBER, p_nombre IN VARCHAR2, p_descripcion IN VARCHAR2, p_fechaDeAsignacion IN DATE, p_fechaDeVencimiento IN DATE, p_estado IN CHAR, p_codigoCurso IN NUMBER);
    PROCEDURE EL_TAREA(p_idTarea IN NUMBER);
    -- Calificaciones
    PROCEDURE AD_CALIFICACION(p_idTarea IN NUMBER, p_puntaje IN NUMBER, p_fecha IN DATE, p_comentario IN VARCHAR2, p_estudiante IN NUMBER);
    PROCEDURE MOD_CALIFICACION(p_idTarea IN NUMBER, p_puntaje IN NUMBER, p_fecha IN DATE, p_comentario IN VARCHAR2, p_estudiante IN NUMBER);
    PROCEDURE EL_CALIFICACION(p_idTarea IN NUMBER);
END PA_PROFESOR;
/

CREATE OR REPLACE PACKAGE PA_ESTUDIANTE IS
    FUNCTION CO_TAREAS(p_usuario IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_CURSOS(p_usuario IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_PROFESORES(p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_RECURSOS(p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_CALIFICACIONES(p_usuario IN NUMBER, p_codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
END PA_ESTUDIANTE;
/