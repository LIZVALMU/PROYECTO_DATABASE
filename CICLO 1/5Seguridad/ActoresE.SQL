
--Administrador

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS
    -- Cursos
    PROCEDURE AD_CURSO(codigo IN NUMBER, nombre IN VARCHAR2, listaDeMatriculados IN NUMBER, duracion IN NUMBER, supercursos IN NUMBER, codigoInstitucion IN NUMBER, nidProfesor IN NUMBER);
    PROCEDURE MOD_CURSO(codigo IN NUMBER, nombre IN VARCHAR2, listaDeMatriculados IN NUMBER, duracion IN NUMBER, supercursos IN NUMBER, codigoInstitucion IN NUMBER, nidProfesor IN NUMBER);
    PROCEDURE EL_CURSO(codigo IN NUMBER);
    
    -- Profesores
    PROCEDURE AD_PROFESOR(nid IN NUMBER, nombre IN VARCHAR2, telefono IN NUMBER, profesion IN VARCHAR2);
    PROCEDURE MOD_PROFESOR(nid IN NUMBER, nombre IN VARCHAR2, telefono IN NUMBER, profesion IN VARCHAR2);
    PROCEDURE EL_PROFESOR(nid IN NUMBER);
    
    -- Estudiantes
    PROCEDURE AD_ESTUDIANTE(usuario IN NUMBER, nombre IN VARCHAR2, correo IN VARCHAR2, contrasena IN NUMBER, programa IN VARCHAR2, registro IN DATE, codigoInstitucion IN NUMBER);
    PROCEDURE MOD_ESTUDIANTE(usuario IN NUMBER, nombre IN VARCHAR2, correo IN VARCHAR2, contrasena IN NUMBER, programa IN VARCHAR2, registro IN DATE, codigoInstitucion IN NUMBER);
    PROCEDURE EL_ESTUDIANTE(usuario IN NUMBER);
    
    -- Instituciones
    PROCEDURE AD_INSTITUCION(codigo IN NUMBER, nombre IN VARCHAR2, direccion IN VARCHAR2, tipo IN CHAR);
    PROCEDURE MOD_INSTITUCION(codigo IN NUMBER, nombre IN VARCHAR2, direccion IN VARCHAR2, tipo IN CHAR);
    PROCEDURE EL_INSTITUCION(codigo IN NUMBER);
END PA_ADMINISTRADOR;
/

--Profesor

CREATE OR REPLACE PACKAGE PA_PROFESOR IS
    -- Cursos
    FUNCTION CO_CURSO(codigo IN NUMBER) RETURN SYS_REFCURSOR;
    
    -- Recursos Adicionales
    PROCEDURE AD_RECURSO(idRecursos IN NUMBER, tipo IN CHAR, fechaPublicacion IN DATE, tema IN VARCHAR2, notasDeClase IN VARCHAR2, codigoCursos IN NUMBER);
    PROCEDURE MOD_RECURSO(idRecursos IN NUMBER, tipo IN CHAR, fechaPublicacion IN DATE, tema IN VARCHAR2, notasDeClase IN VARCHAR2, codigoCursos IN NUMBER);
    PROCEDURE EL_RECURSO(idRecursos IN NUMBER);
    
    -- Tareas
    PROCEDURE AD_TAREA(idTarea IN NUMBER, nombre IN VARCHAR2, descripcion IN VARCHAR2, fechaDeAsignacion IN DATE, fechaDeVencimiento IN DATE, estado IN CHAR, codigoCurso IN NUMBER);
    PROCEDURE MOD_TAREA(idTarea IN NUMBER, nombre IN VARCHAR2, descripcion IN VARCHAR2, fechaDeAsignacion IN DATE, fechaDeVencimiento IN DATE, estado IN CHAR, codigoCurso IN NUMBER);
    PROCEDURE EL_TAREA(idTarea IN NUMBER);
    
    -- Calificaciones
    PROCEDURE AD_CALIFICACION(idTarea IN NUMBER, puntaje IN NUMBER, fecha IN DATE, comentario IN VARCHAR2, estudiante IN NUMBER);
    PROCEDURE MOD_CALIFICACION(idTarea IN NUMBER, puntaje IN NUMBER, fecha IN DATE, comentario IN VARCHAR2, estudiante IN NUMBER);
    PROCEDURE EL_CALIFICACION(idTarea IN NUMBER);
END PA_PROFESOR;
/

--Estudiante

CREATE OR REPLACE PACKAGE PA_ESTUDIANTE IS
    -- Consultar Tareas
    FUNCTION CO_TAREAS(usuario IN NUMBER) RETURN SYS_REFCURSOR;
    
    -- Consultar Cursos
    FUNCTION CO_CURSOS(usuario IN NUMBER) RETURN SYS_REFCURSOR;
    
    -- Consultar Profesores
    FUNCTION CO_PROFESORES(codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
    
    -- Consultar Recursos Adicionales
    FUNCTION CO_RECURSOS(codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
    
    -- Consultar Calificaciones
    FUNCTION CO_CALIFICACIONES(usuario IN NUMBER, codigoCurso IN NUMBER) RETURN SYS_REFCURSOR;
END PA_ESTUDIANTE;
/

--Gerente

CREATE OR REPLACE PACKAGE PA_GERENTE IS
    -- Consultar cantidad de clientes de pago
    FUNCTION CO_CLIENTES_PAGO RETURN NUMBER;
    
    -- Consultar cantidad de notificaciones de incumplimiento
    FUNCTION CO_NOTIFICACIONES_INCUMPLIMIENTO RETURN NUMBER;
    
    -- Consultar porcentaje de estudiantes que han cumplido su meta
    FUNCTION CO_PORCENTAJE_META_CUMPLIDA RETURN NUMBER;
END PA_GERENTE;
/
