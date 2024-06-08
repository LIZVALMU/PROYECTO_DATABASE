-- Crear Institución
CREATE OR REPLACE PACKAGE BODY PC_INSTITUCION AS
    PROCEDURE AD_INSTITUCION(Xcodigo IN NUMBER, Xnombre IN VARCHAR2, Xdireccion IN VARCHAR2, Xtipo IN CHAR) IS
    BEGIN
        INSERT INTO Instituciones (codigo, nombre, direccion, tipo)
        VALUES (Xcodigo, Xnombre, Xdireccion, Xtipo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20201, 'Error al insertar la institución');
    END AD_INSTITUCION;

    -- Modificar Institución
    PROCEDURE MOD_INSTITUCION(
        Xcodigo IN NUMBER,
        Xnombre IN VARCHAR2,
        Xdireccion IN VARCHAR2,
        Xtipo IN CHAR
    ) IS
    BEGIN
        UPDATE Instituciones
        SET nombre    = Xnombre,
            direccion = Xdireccion,
            tipo      = Xtipo
        WHERE codigo = Xcodigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20202, 'Error al modificar la institución');
    END MOD_INSTITUCION;


    -- Eliminar Institución
    PROCEDURE EL_INSTITUCION(
        Xcodigo IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM Instituciones
        WHERE codigo = Xcodigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20203, 'Error al eliminar la institución');
    END EL_INSTITUCION;


    -- Consultar Institución
    FUNCTION CO_INSTITUCION(
        Xcodigo IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        InstitucionesCursor SYS_REFCURSOR;
    BEGIN
        OPEN InstitucionesCursor FOR
            SELECT *
            FROM Instituciones
            WHERE codigo = Xcodigo;
        RETURN InstitucionesCursor;
    END CO_INSTITUCION;
END PC_INSTITUCION;
/

-- Crear Estudiante
CREATE OR REPLACE PACKAGE BODY PC_ESTUDIANTE AS
    PROCEDURE AD_ESTUDIANTE(
        Xusuario IN NUMBER,
        Xnombre IN VARCHAR2,
        Xcorreo IN VARCHAR2,
        Xcontrasena IN NUMBER,
        Xprograma IN VARCHAR2,
        Xregistro IN DATE,
        XcodigoInstitucion IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
        VALUES (Xusuario, Xnombre, Xcorreo, Xcontrasena, Xprograma, Xregistro, XcodigoInstitucion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20204, 'Error al insertar el estudiante');
    END AD_ESTUDIANTE;

    -- Modificar Estudiante
    PROCEDURE MOD_ESTUDIANTE(
        Xusuario IN NUMBER,
        Xnombre IN VARCHAR2,
        Xcorreo IN VARCHAR2,
        Xcontrasena IN NUMBER,
        Xprograma IN VARCHAR2,
        Xregistro IN DATE,
        XcodigoInstitucion IN NUMBER
    ) IS
    BEGIN
        UPDATE Estudiantes
        SET nombre            = Xnombre,
            correo            = Xcorreo,
            contrasena        = Xcontrasena,
            programa          = Xprograma,
            registro          = Xregistro,
            codigoInstitucion = XcodigoInstitucion
        WHERE usuario = Xusuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20205, 'Error al modificar el estudiante');
    END MOD_ESTUDIANTE;

    -- Eliminar Estudiante
    PROCEDURE EL_ESTUDIANTE(
        Xusuario IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM Estudiantes
        WHERE usuario = Xusuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20206, 'Error al eliminar el estudiante');
    END EL_ESTUDIANTE;

    -- Consultar Estudiante
    FUNCTION CO_ESTUDIANTE(
        Xusuario IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        EstudiantesCursor SYS_REFCURSOR;
    BEGIN
        OPEN EstudiantesCursor FOR
            SELECT *
            FROM Estudiantes
            WHERE usuario = Xusuario;
        RETURN EstudiantesCursor;
    END CO_ESTUDIANTE;
END PC_ESTUDIANTE;
/

-- Crear Cliente Premium
CREATE OR REPLACE PACKAGE BODY PC_PREMIUM AS
    PROCEDURE AD_PREMIUM(
        XusuarioE IN NUMBER,
        Xmembresia IN CHAR,
        XfechaDeVencimiento IN DATE,
        Xtelefono IN NUMBER,
        Xdireccion IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO ClientesPremium (usuarioE, membresia, fechaDeVencimiento, telefono, direccion)
        VALUES (XusuarioE, Xmembresia, XfechaDeVencimiento, Xtelefono, Xdireccion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20207, 'Error al insertar el cliente premium');
    END AD_PREMIUM;

    -- Modificar Cliente Premium
    PROCEDURE MOD_PREMIUM(
        XusuarioE IN NUMBER,
        Xmembresia IN CHAR,
        XfechaDeVencimiento IN DATE,
        Xtelefono IN NUMBER,
        Xdireccion IN VARCHAR2
    ) IS
    BEGIN
        UPDATE ClientesPremium
        SET membresia          = Xmembresia,
            fechaDeVencimiento = XfechaDeVencimiento,
            telefono           = Xtelefono,
            direccion          = Xdireccion
        WHERE usuarioE = XusuarioE;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20208, 'Error al modificar el cliente premium');
    END MOD_PREMIUM;

    -- Eliminar Cliente Premium
    PROCEDURE EL_PREMIUM(
        XusuarioE IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM ClientesPremium
        WHERE usuarioE = XusuarioE;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20209, 'Error al eliminar el cliente premium');
    END EL_PREMIUM;

    -- Consultar Cliente Premium
    FUNCTION CO_PREMIUM(
        XusuarioE IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        ClientesPremiumCursor SYS_REFCURSOR;
    BEGIN
        OPEN ClientesPremiumCursor FOR
            SELECT *
            FROM ClientesPremium
            WHERE usuarioE = XusuarioE;
        RETURN ClientesPremiumCursor;
    END CO_PREMIUM;
END PC_PREMIUM;
/
-- Crear Cliente Gratuito
CREATE OR REPLACE PACKAGE BODY PC_GRATUITO AS
    PROCEDURE AD_GRATUITO(XusuarioE IN NUMBER, XcorreoTemporal IN VARCHAR2) IS
    BEGIN
        INSERT INTO ClientesGratuitos (usuarioE, correoTemporal)
        VALUES (XusuarioE, XcorreoTemporal);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20210, 'Error al insertar el cliente gratuito');
    END AD_GRATUITO;

    PROCEDURE EL_GRATUITO(XusuarioE IN NUMBER) IS
    BEGIN
        DELETE
        FROM ClientesGratuitos
        WHERE usuarioE = XusuarioE;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20211, 'Error al eliminar el cliente gratuito');
    END EL_GRATUITO;

    FUNCTION CO_GRATUITO(XusuarioE IN NUMBER) RETURN SYS_REFCURSOR IS
        ClientesGratuitosCursor SYS_REFCURSOR;
    BEGIN
        OPEN ClientesGratuitosCursor FOR
            SELECT *
            FROM ClientesGratuitos
            WHERE usuarioE = XusuarioE;
        RETURN ClientesGratuitosCursor;
    END CO_GRATUITO;
END PC_GRATUITO;
/

---- Crear Curso---
CREATE OR REPLACE PACKAGE BODY PC_CURSO AS
    PROCEDURE AD_CURSO(
        Xcodigo IN NUMBER,
        Xnombre IN VARCHAR2,
        XlistaDeMatriculados IN NUMBER,
        Xduracion IN NUMBER,
        Xsupercursos IN NUMBER,
        XcodigoInstitucion IN NUMBER,
        XnidProfesor IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor)
        VALUES (Xcodigo, Xnombre, XlistaDeMatriculados, Xduracion, Xsupercursos, XcodigoInstitucion, XnidProfesor);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20212, 'Error al insertar el curso');
    END AD_CURSO;

    -- Modificar Curso
    PROCEDURE MOD_CURSO(
        Xcodigo IN NUMBER,
        Xnombre IN VARCHAR2,
        XlistaDeMatriculados IN NUMBER,
        Xduracion IN NUMBER,
        Xsupercursos IN NUMBER,
        XcodigoInstitucion IN NUMBER,
        XnidProfesor IN NUMBER
    ) IS
    BEGIN
        UPDATE Cursos
        SET nombre              = Xnombre,
            listaDeMatriculados = XlistaDeMatriculados,
            duracion            = Xduracion,
            supercursos         = Xsupercursos,
            codigoInstitucion   = XcodigoInstitucion,
            nidProfesor         = XnidProfesor
        WHERE codigo = Xcodigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20213, 'Error al modificar el curso');
    END MOD_CURSO;

    -- Eliminar Curso
    PROCEDURE EL_CURSO(
        Xcodigo IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM Cursos
        WHERE codigo = Xcodigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20214, 'Error al eliminar el curso');
    END EL_CURSO;

    -- Consultar Curso
    FUNCTION CO_CURSO(
        Xcodigo IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        CursosCursor SYS_REFCURSOR;
    BEGIN
        OPEN CursosCursor FOR
            SELECT *
            FROM Cursos
            WHERE codigo = Xcodigo;
        RETURN CursosCursor;
    END CO_CURSO;
END PC_CURSO;
/

-- Agregar Estudiante a Curso
CREATE OR REPLACE PACKAGE BODY PC_ESTCURSO AS
    PROCEDURE AD_ESTCURSO(Xusuario IN NUMBER, XcodigoCurso IN NUMBER) IS
    BEGIN
        INSERT INTO ESTUDIANTESCURSOS(usuario, codigoCurso)
        VALUES (Xusuario, XcodigoCurso);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20215, 'Error al agregar estudiante al curso');
    END AD_ESTCURSO;

    PROCEDURE EL_ESTCURSO(Xusuario IN NUMBER) IS
    BEGIN
        DELETE
        FROM EstudiantesCursos
        WHERE usuario = Xusuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20216, 'Error al quitar estudiante del curso');
    END EL_ESTCURSO;

    FUNCTION CO_ESTCURSO(Xusuario IN NUMBER) RETURN SYS_REFCURSOR IS
        EstudiantesCursoCursor SYS_REFCURSOR;
    BEGIN
        OPEN EstudiantesCursoCursor FOR
            SELECT usuario
            FROM EstudiantesCursos
            WHERE codigoCurso = Xusuario;
        RETURN EstudiantesCursoCursor;
    END CO_ESTCURSO;
END PC_ESTCURSO;
/

-- Agregar Estudiante a Curso
CREATE OR REPLACE PACKAGE BODY PC_ESTCURSO AS
    PROCEDURE AD_ESTCURSO(Xusuario IN NUMBER, XcodigoCurso IN NUMBER) IS
    BEGIN
        INSERT INTO ESTUDIANTESCURSOS(usuario, codigoCurso)
        VALUES (Xusuario, XcodigoCurso);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20215, 'Error al agregar estudiante al curso');
    END AD_ESTCURSO;

    PROCEDURE EL_ESTCURSO(Xusuario IN NUMBER) IS
    BEGIN
        DELETE
        FROM EstudiantesCursos
        WHERE usuario = Xusuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20216, 'Error al quitar estudiante del curso');
    END EL_ESTCURSO;

    FUNCTION CO_ESTCURSO(Xusuario IN NUMBER) RETURN SYS_REFCURSOR IS
        EstudiantesCursoCursor SYS_REFCURSOR;
    BEGIN
        OPEN EstudiantesCursoCursor FOR
            SELECT usuario
            FROM EstudiantesCursos
            WHERE codigoCurso = Xusuario;
        RETURN EstudiantesCursoCursor;
    END CO_ESTCURSO;
END PC_ESTCURSO;
/


-- Crear Profesor
CREATE OR REPLACE PACKAGE BODY PC_PROFESOR AS
    PROCEDURE AD_PROFESOR(
        Xnid IN NUMBER,
        Xnombre IN VARCHAR2,
        Xtelefono IN NUMBER,
        Xprofesion IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Profesores (nid, nombre, telefono, profesion)
        VALUES (Xnid, Xnombre, Xtelefono, Xprofesion);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20217, 'Error al insertar el profesor');
    END AD_PROFESOR;

    -- Modificar Profesor
    PROCEDURE MOD_PROFESOR(
        Xnid IN NUMBER,
        Xnombre IN VARCHAR2,
        Xtelefono IN NUMBER,
        Xprofesion IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Profesores
        SET nombre    = Xnombre,
            telefono  = Xtelefono,
            profesion = Xprofesion
        WHERE nid = Xnid;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20218, 'Error al modificar el profesor');
    END MOD_PROFESOR;

    -- Eliminar Profesor
    PROCEDURE EL_PROFESOR(
        Xnid IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM Profesores
        WHERE nid = Xnid;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20219, 'Error al eliminar el profesor');
    END EL_PROFESOR;

    -- Consultar Profesor
    FUNCTION CO_PROFESOR(
        Xnid IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        ProfesorCursor SYS_REFCURSOR;
    BEGIN
        OPEN ProfesorCursor FOR
            SELECT *
            FROM Profesores
            WHERE nid = Xnid;
        RETURN ProfesorCursor;
    END CO_PROFESOR;
END PC_PROFESOR;
/

-- Agregar Recurso Adicional
CREATE OR REPLACE PACKAGE BODY PC_RECURSO AS
    PROCEDURE AD_RECURSO(
        XidRecursos IN NUMBER,
        Xtipo IN CHAR,
        XfechaPublicacion IN DATE,
        Xtema IN VARCHAR2,
        XnotasDeClase IN VARCHAR2,
        XcodigoCursos IN NUMBER
    ) IS
    BEGIN
        INSERT INTO RecursosAdicionales (idRecursos, tipo, fechaPublicacion, tema, notasDeClase, codigoCurso)
        VALUES (XidRecursos, Xtipo, XfechaPublicacion, Xtema, XnotasDeClase, XcodigoCursos);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20220, 'Error al agregar recurso adicional');
    END AD_RECURSO;


    -- Modificar Recurso Adicional
    PROCEDURE MOD_RECURSO(
        XidRecursos IN NUMBER,
        Xtipo IN CHAR,
        XfechaPublicacion IN DATE,
        Xtema IN VARCHAR2,
        XnotasDeClase IN VARCHAR2,
        XcodigoCursos IN NUMBER
    ) IS
    BEGIN
        UPDATE RecursosAdicionales
        SET tipo             = Xtipo,
            fechaPublicacion = XfechaPublicacion,
            tema             = Xtema,
            notasDeClase     = XnotasDeClase,
            codigoCurso      = XcodigoCursos
        WHERE idRecursos = XidRecursos;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20221, 'Error al modificar recurso adicional');
    END MOD_RECURSO;

    -- Eliminar Recurso Adicional
    PROCEDURE EL_RECURSO(
        XidRecursos IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM RecursosAdicionales
        WHERE idRecursos = XidRecursos;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20222, 'Error al eliminar recurso adicional');
    END EL_RECURSO;


    -- Consultar Recurso Adicional
    FUNCTION CO_RECURSO(
        XidRecursos IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        RecursoAdicionalCursor SYS_REFCURSOR;
    BEGIN
        OPEN RecursoAdicionalCursor FOR
            SELECT *
            FROM RecursosAdicionales
            WHERE idRecursos = XidRecursos;
        RETURN RecursoAdicionalCursor;
    END CO_RECURSO;
END PC_RECURSO;
/

-- Agregar Tarea
CREATE OR REPLACE PACKAGE BODY PC_TAREA AS
    PROCEDURE AD_TAREA(
        XidTarea IN NUMBER,
        Xnombre IN VARCHAR2,
        Xdescripcion IN VARCHAR2,
        XfechaDeAsignacion IN DATE,
        XfechaDeVencimiento IN DATE,
        Xestado IN CHAR,
        XcodigoCurso IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
        VALUES (XidTarea, Xnombre, Xdescripcion, XfechaDeAsignacion, XfechaDeVencimiento, Xestado, XcodigoCurso);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20223, 'Error al agregar la tarea');
    END AD_TAREA;

    -- Modificar Tarea
    PROCEDURE MOD_TAREA(
        XidTarea IN NUMBER,
        Xnombre IN VARCHAR2,
        Xdescripcion IN VARCHAR2,
        XfechaDeAsignacion IN DATE,
        XfechaDeVencimiento IN DATE,
        Xestado IN CHAR,
        XcodigoCurso IN NUMBER
    ) IS
    BEGIN
        UPDATE Tareas
        SET nombre             = Xnombre,
            descripcion        = Xdescripcion,
            fechaDeAsignacion  = XfechaDeAsignacion,
            fechaDeVencimiento = XfechaDeVencimiento,
            estado             = Xestado,
            codigoCurso        = XcodigoCurso
        WHERE idTarea = XidTarea;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20224, 'Error al modificar la tarea');
    END MOD_TAREA;

    -- Eliminar Tarea
    PROCEDURE EL_TAREA(
        XidTarea IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM Tareas
        WHERE idTarea = XidTarea;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20225, 'Error al eliminar la tarea');
    END EL_TAREA;

    -- Consultar Tarea
    FUNCTION CO_TAREA(
        XidTarea IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        TareaCursor SYS_REFCURSOR;
    BEGIN
        OPEN TareaCursor FOR
            SELECT *
            FROM Tareas
            WHERE idTarea = XidTarea;
        RETURN TareaCursor;
    END CO_TAREA;
END PC_TAREA;
/

-- Agregar Calificación
CREATE OR REPLACE PACKAGE BODY PC_CALIFICACION AS
    PROCEDURE AD_CALIFICACION(XidTarea IN NUMBER,Xpuntaje IN NUMBER,Xfecha IN DATE,Xcomentario IN VARCHAR2,Xestudiante IN NUMBER) IS
    BEGIN
        INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
        VALUES (XidTarea, Xpuntaje, Xfecha, Xcomentario, Xestudiante);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20226, 'Error al agregar la calificación');
    END AD_CALIFICACION;

    PROCEDURE MOD_CALIFICACION(
        XidTarea IN NUMBER,
        Xpuntaje IN NUMBER,
        Xfecha IN DATE,
        Xcomentario IN VARCHAR2
    ) IS
    BEGIN
        UPDATE calificaciones
        SET puntaje    = Xpuntaje,
            fecha      = Xfecha,
            comentario = Xcomentario
        WHERE idTarea = XidTarea;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20227, 'Error al modificar la calificación');
    END MOD_CALIFICACION;

    -- Eliminar Calificación
    PROCEDURE EL_CALIFICACION(
        XidTarea IN NUMBER,
        Xestudiante IN NUMBER
    ) IS
    BEGIN
        DELETE
        FROM calificaciones
        WHERE idTarea = XidTarea
          AND estudiante = Xestudiante;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20228, 'Error al eliminar la calificación');
    END EL_CALIFICACION;

    -- Consultar Calificación
    FUNCTION CO_CALIFICACION(
        XidTarea IN NUMBER,
        Xestudiante IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        CalificacionCursor SYS_REFCURSOR;
    BEGIN
        OPEN CalificacionCursor FOR
            SELECT *
            FROM calificaciones
            WHERE idTarea = XidTarea
              AND estudiante = Xestudiante;
        RETURN CalificacionCursor;
    END CO_CALIFICACION;
END PC_CALIFICACION;
/


