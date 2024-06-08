/*------------------------------Paquete para la tabla Instituciones------------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_INSTITUCION IS 
    PROCEDURE AD_INSTITUCION(Xcodigo IN NUMBER, Xnombre IN VARCHAR2, Xdireccion IN VARCHAR2, Xtipo IN CHAR);
    PROCEDURE MOD_INSTITUCION(Xcodigo IN NUMBER, Xnombre IN VARCHAR2, Xdireccion IN VARCHAR2, Xtipo IN CHAR);
    PROCEDURE EL_INSTITUCION(Xcodigo IN NUMBER);
    FUNCTION CO_INSTITUCION(Xcodigo IN NUMBER) RETURN SYS_REFCURSOR;
END PC_INSTITUCION;
/


/*------------------------------Paquete para la tabla Estudiantes------------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_ESTUDIANTE IS 
    PROCEDURE AD_ESTUDIANTE(Xusuario IN NUMBER, Xnombre IN VARCHAR2, Xcorreo IN VARCHAR2, Xcontrasena IN NUMBER, Xprograma IN VARCHAR2, Xregistro IN DATE, XcodigoInstitucion IN NUMBER);
    PROCEDURE MOD_ESTUDIANTE(Xusuario IN NUMBER, Xnombre IN VARCHAR2, Xcorreo IN VARCHAR2, Xcontrasena IN NUMBER, Xprograma IN VARCHAR2, Xregistro IN DATE, XcodigoInstitucion IN NUMBER);
    PROCEDURE EL_ESTUDIANTE(Xusuario IN NUMBER);
    FUNCTION CO_ESTUDIANTE(Xusuario IN NUMBER) RETURN SYS_REFCURSOR;
END PC_ESTUDIANTE;
/


/*------------------------------Paquete para la tabla ClientesPremium------------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_PREMIUM IS 
    PROCEDURE AD_PREMIUM(XusuarioE IN NUMBER, Xmembresia IN CHAR, XfechaDeVencimiento IN DATE, Xtelefono IN NUMBER, Xdireccion IN VARCHAR2);
    PROCEDURE MOD_PREMIUM(XusuarioE IN NUMBER, Xmembresia IN CHAR, XfechaDeVencimiento IN DATE, Xtelefono IN NUMBER, Xdireccion IN VARCHAR2);
    PROCEDURE EL_PREMIUM(XusuarioE IN NUMBER);
    FUNCTION CO_PREMIUM(XusuarioE IN NUMBER) RETURN SYS_REFCURSOR;
END PC_PREMIUM;
/


/*------------------------------Paquete para la tabla ClientesGratuitos------------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_GRATUITO IS
    PROCEDURE AD_GRATUITO(XusuarioE IN NUMBER, XcorreoTemporal IN VARCHAR2);
    PROCEDURE EL_GRATUITO(XusuarioE IN NUMBER);
    FUNCTION CO_GRATUITO(XusuarioE IN NUMBER) RETURN SYS_REFCURSOR;
END PC_GRATUITO;
/


/*------------------------------Paquete para la tabla Cursos------------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_CURSO IS 
    PROCEDURE AD_CURSO(Xcodigo IN NUMBER, Xnombre IN VARCHAR2, XlistaDeMatriculados IN NUMBER, Xduracion IN NUMBER, Xsupercursos IN NUMBER, XcodigoInstitucion IN NUMBER, XnidProfesor IN NUMBER);
    PROCEDURE MOD_CURSO(Xcodigo IN NUMBER, Xnombre IN VARCHAR2, XlistaDeMatriculados IN NUMBER, Xduracion IN NUMBER, Xsupercursos IN NUMBER, XcodigoInstitucion IN NUMBER, XnidProfesor IN NUMBER);
    PROCEDURE EL_CURSO(Xcodigo IN NUMBER);
    FUNCTION CO_CURSO(Xcodigo IN NUMBER) RETURN SYS_REFCURSOR;
END PC_CURSO;
/


/*-----------------------------Paquete para la tabla EstudiantesCursos-----------------------------------------------*/


CREATE OR REPLACE PACKAGE PC_ESTCURSO IS
    PROCEDURE AD_ESTCURSO(Xusuario IN NUMBER, XcodigoCurso IN NUMBER);
    PROCEDURE EL_ESTCURSO(Xusuario IN NUMBER);
    FUNCTION CO_ESTCURSO(Xusuario IN NUMBER) RETURN SYS_REFCURSOR;
END PC_ESTCURSO;
/

/*-----------------------------Paquete para la tabla Profesores-----------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_PROFESOR IS 
    PROCEDURE AD_PROFESOR(Xnid IN NUMBER, Xnombre IN VARCHAR2, Xtelefono IN NUMBER, Xprofesion IN VARCHAR2);
    PROCEDURE MOD_PROFESOR(Xnid IN NUMBER, Xnombre IN VARCHAR2, Xtelefono IN NUMBER, Xprofesion IN VARCHAR2);
    PROCEDURE EL_PROFESOR(Xnid IN NUMBER);
    FUNCTION CO_PROFESOR(Xnid IN NUMBER) RETURN SYS_REFCURSOR;
END PC_PROFESOR;
/


/*-----------------------------Paquete para la tabla RecursosAdicionales-----------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_RECURSO IS 
    PROCEDURE AD_RECURSO(XidRecursos IN NUMBER, Xtipo IN CHAR, XfechaPublicacion IN DATE, Xtema IN VARCHAR2, XnotasDeClase IN VARCHAR2, XcodigoCursos IN NUMBER);
    PROCEDURE MOD_RECURSO(XidRecursos IN NUMBER, Xtipo IN CHAR, XfechaPublicacion IN DATE, Xtema IN VARCHAR2, XnotasDeClase IN VARCHAR2, XcodigoCursos IN NUMBER);
    PROCEDURE EL_RECURSO(XidRecursos IN NUMBER);
    FUNCTION CO_RECURSO(XidRecursos IN NUMBER) RETURN SYS_REFCURSOR;
END PC_RECURSO;
/


/*-----------------------------Paquete para la tabla Tareas-----------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_TAREA IS 
    PROCEDURE AD_TAREA(XidTarea IN NUMBER, Xnombre IN VARCHAR2, Xdescripcion IN VARCHAR2, XfechaDeAsignacion IN DATE, XfechaDeVencimiento IN DATE, Xestado IN CHAR, XcodigoCurso IN NUMBER);
    PROCEDURE MOD_TAREA(XidTarea IN NUMBER, Xnombre IN VARCHAR2, Xdescripcion IN VARCHAR2, XfechaDeAsignacion IN DATE, XfechaDeVencimiento IN DATE, Xestado IN CHAR, XcodigoCurso IN NUMBER);
    PROCEDURE EL_TAREA(XidTarea IN NUMBER);
    FUNCTION CO_TAREA(XidTarea IN NUMBER) RETURN SYS_REFCURSOR;
END PC_TAREA;
/


/*-----------------------------Paquete para la tabla calificaciones-----------------------------------------------*/

CREATE OR REPLACE PACKAGE PC_CALIFICACION IS 
    PROCEDURE AD_CALIFICACION(XidTarea IN NUMBER, Xpuntaje IN NUMBER, Xfecha IN DATE, Xcomentario IN VARCHAR2, Xestudiante IN NUMBER);
    PROCEDURE MOD_CALIFICACION(XidTarea IN NUMBER, Xpuntaje IN NUMBER, Xfecha IN DATE, Xcomentario IN VARCHAR2);
    PROCEDURE EL_CALIFICACION(XidTarea IN NUMBER, Xestudiante IN NUMBER);
    FUNCTION CO_CALIFICACION(XidTarea IN NUMBER, Xestudiante IN NUMBER) RETURN SYS_REFCURSOR;
END PC_CALIFICACION;
/