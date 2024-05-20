
--ActoresI

CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS
    -- Cursos
    PROCEDURE AD_CURSO(codigo IN NUMBER, nombre IN VARCHAR2, listaDeMatriculados IN NUMBER, duracion IN NUMBER, supercursos IN NUMBER, codigoInstitucion IN NUMBER, nidProfesor IN NUMBER) IS
    BEGIN
        INSERT INTO Cursos (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor)
        VALUES (codigo, nombre, listaDeMatriculados, duracion, supercursos, codigoInstitucion, nidProfesor);
    END AD_CURSO;
    
    PROCEDURE MOD_CURSO(codigo IN NUMBER, nombre IN VARCHAR2, listaDeMatriculados IN NUMBER, duracion IN NUMBER, supercursos IN NUMBER, codigoInstitucion IN NUMBER, nidProfesor IN NUMBER) IS
    BEGIN
        UPDATE Cursos
        SET nombre = nombre, listaDeMatriculados = listaDeMatriculados, duracion = duracion, supercursos = supercursos, codigoInstitucion = codigoInstitucion, nidProfesor = nidProfesor
        WHERE codigo = codigo;
    END MOD_CURSO;
    
    PROCEDURE EL_CURSO(codigo IN NUMBER) IS
    BEGIN
        DELETE FROM Cursos WHERE codigo = codigo;
    END EL_CURSO;
    
    -- Profesores
    PROCEDURE AD_PROFESOR(nid IN NUMBER, nombre IN VARCHAR2, telefono IN NUMBER, profesion IN VARCHAR2) IS
    BEGIN
        INSERT INTO Profesores (nid, nombre, telefono, profesion)
        VALUES (nid, nombre, telefono, profesion);
    END AD_PROFESOR;
    
    PROCEDURE MOD_PROFESOR(nid IN NUMBER, nombre IN VARCHAR2, telefono IN NUMBER, profesion IN VARCHAR2) IS
    BEGIN
        UPDATE Profesores
        SET nombre = nombre, telefono = telefono, profesion = profesion
        WHERE nid = nid;
    END MOD_PROFESOR;
    
    PROCEDURE EL_PROFESOR(nid IN NUMBER) IS
    BEGIN
        DELETE FROM Profesores WHERE nid = nid;
    END EL_PROFESOR;
    
    -- Estudiantes
    PROCEDURE AD_ESTUDIANTE(usuario IN NUMBER, nombre IN VARCHAR2, correo IN VARCHAR2, contrasena IN NUMBER, programa IN VARCHAR2, registro IN DATE, codigoInstitucion IN NUMBER) IS
    BEGIN
        INSERT INTO Estudiantes (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion)
        VALUES (usuario, nombre, correo, contrasena, programa, registro, codigoInstitucion);
    END AD_ESTUDIANTE;
    
    PROCEDURE MOD_ESTUDIANTE(usuario IN NUMBER, nombre IN VARCHAR2, correo IN VARCHAR2, contrasena IN NUMBER, programa IN VARCHAR2, registro IN DATE, codigoInstitucion IN NUMBER) IS
    BEGIN
        UPDATE Estudiantes
        SET nombre = nombre, correo = correo, contrasena = contrasena, programa = programa, registro = registro, codigoInstitucion = codigoInstitucion
        WHERE usuario = usuario;
    END MOD_ESTUDIANTE;
    
    PROCEDURE EL_ESTUDIANTE(usuario IN NUMBER) IS
    BEGIN
        DELETE FROM Estudiantes WHERE usuario = usuario;
    END EL_ESTUDIANTE;
    
    -- Instituciones
    PROCEDURE AD_INSTITUCION(codigo IN NUMBER, nombre IN VARCHAR2, direccion IN VARCHAR2, tipo IN CHAR) IS
    BEGIN
        INSERT INTO Instituciones (codigo, nombre, direccion, tipo)
        VALUES (codigo, nombre, direccion, tipo);
    END AD_INSTITUCION;
    
    PROCEDURE MOD_INSTITUCION(codigo IN NUMBER, nombre IN VARCHAR2, direccion IN VARCHAR2, tipo IN CHAR) IS
    BEGIN
        UPDATE Instituciones
        SET nombre = nombre, direccion = direccion, tipo = tipo
        WHERE codigo = codigo;
    END MOD_INSTITUCION;
    
    PROCEDURE EL_INSTITUCION(codigo IN NUMBER) IS
    BEGIN
        DELETE FROM Instituciones WHERE codigo = codigo;
    END EL_INSTITUCION;
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE BODY PA_PROFESOR IS
    -- Cursos
    FUNCTION CO_CURSO(codigo IN NUMBER) RETURN SYS_REFCURSOR IS
        cursorCursos SYS_REFCURSOR;
    BEGIN
        OPEN cursorCursos FOR SELECT * FROM Cursos WHERE codigo = codigo;
        RETURN cursorCursos;
    END CO_CURSO;
    
    -- Recursos Adicionales
    PROCEDURE AD_RECURSO(idRecursos IN NUMBER, tipo IN CHAR, fechaPublicacion IN DATE, tema IN VARCHAR2, notasDeClase IN VARCHAR2, codigoCursos IN NUMBER) IS
    BEGIN
        INSERT INTO RecursosAdicionales (idRecursos, tipo, fechaPublicacion, tema, notasDeClase, codigoCursos)
        VALUES (idRecursos, tipo, fechaPublicacion, tema, notasDeClase, codigoCursos);
    END AD_RECURSO;
    
    PROCEDURE MOD_RECURSO(idRecursos IN NUMBER, tipo IN CHAR, fechaPublicacion IN DATE, tema IN VARCHAR2, notasDeClase IN VARCHAR2, codigoCursos IN NUMBER) IS
    BEGIN
        UPDATE RecursosAdicionales
        SET tipo = tipo, fechaPublicacion = fechaPublicacion, tema = tema, notasDeClase = notasDeClase, codigoCursos = codigoCursos
        WHERE idRecursos = idRecursos;
    END MOD_RECURSO;
    
    PROCEDURE EL_RECURSO(idRecursos IN NUMBER) IS
    BEGIN
        DELETE FROM RecursosAdicionales WHERE idRecursos = idRecursos;
    END EL_RECURSO;
    
    -- Tareas
    PROCEDURE AD_TAREA(idTarea IN NUMBER, nombre IN VARCHAR2, descripcion IN VARCHAR2, fechaDeAsignacion IN DATE, fechaDeVencimiento IN DATE, estado IN CHAR, codigoCurso IN NUMBER) IS
    BEGIN
        INSERT INTO Tareas (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso)
        VALUES (idTarea, nombre, descripcion, fechaDeAsignacion, fechaDeVencimiento, estado, codigoCurso);
    END AD_TAREA;
    
    PROCEDURE MOD_TAREA(idTarea IN NUMBER, nombre IN VARCHAR2, descripcion IN VARCHAR2, fechaDeAsignacion IN DATE, fechaDeVencimiento IN DATE, estado IN CHAR, codigoCurso IN NUMBER) IS
    BEGIN
        UPDATE Tareas
        SET nombre = nombre, descripcion = descripcion, fechaDeAsignacion = fechaDeAsignacion, fechaDeVencimiento = fechaDeVencimiento, estado = estado, codigoCurso = codigoCurso
        WHERE idTarea = idTarea;
    END MOD_TAREA;
    
    PROCEDURE EL_TAREA(idTarea IN NUMBER) IS
    BEGIN
        DELETE FROM Tareas WHERE idTarea = idTarea;
    END EL_TAREA;
    
    -- Calificaciones
    PROCEDURE AD_CALIFICACION(idTarea IN NUMBER, puntaje IN NUMBER, fecha IN DATE, comentario IN VARCHAR2, estudiante IN NUMBER) IS
    BEGIN
        INSERT INTO calificaciones (idTarea, puntaje, fecha, comentario, estudiante)
        VALUES (idTarea, puntaje, fecha, comentario, estudiante);
    END AD_CALIFICACION;
    
    PROCEDURE MOD_CALIFICACION(idTarea IN NUMBER, puntaje IN NUMBER, fecha IN DATE, comentario IN VARCHAR2, estudiante IN NUMBER) IS
    BEGIN
        UPDATE calificaciones
        SET puntaje = puntaje, fecha = fecha, comentario = comentario, estudiante = estudiante
        WHERE idTarea = idTarea;
    END MOD_CALIFICACION;
    
    PROCEDURE EL_CALIFICACION(idTarea IN NUMBER) IS
    BEGIN
        DELETE FROM calificaciones WHERE idTarea = idTarea;
    END EL_CALIFICACION;
END PA_PROFESOR;
/
