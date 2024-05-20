/*------------------------------------ Disparadores------------------------------------*/
---Solo se pueden modificar puntuje y fecha de las calificaciones---
CREATE OR REPLACE TRIGGER TR_CALIFICACIONES_BU
BEFORE UPDATE ON calificaciones
FOR EACH ROW
BEGIN 
    IF :NEW.comentario <> :OLD.comentario OR :NEW.estudiante <> :OLD.estudiante THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se puede modificar estos atributos');
    END IF;
END;
/

----Si el profesor no tiene nombre se actualiza a personal 
CREATE OR REPLACE TRIGGER TR_PROFESORNOMBRE_BI
BEFORE INSERT ON Profesores
FOR EACH ROW
BEGIN 
    IF :NEW.nombre IS NULL THEN 
        :NEW.nombre := 'Personal';
    END IF;
END;
/

----No se puede eliminar una Tarea con una Calificacion asignada--------
CREATE OR REPLACE TRIGGER TR_TAREA_CALIFICACION_BD
BEFORE DELETE ON Tareas
FOR EACH ROW
DECLARE
    Cali NUMBER;
BEGIN 
    SELECT COUNT(*) INTO Cali FROM calificaciones WHERE IdTarea = :OLD.IdTarea;
    IF Cali > 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se pueden eliminar tareas con una calificacion asignada');
    END IF;
END;
/

----En calificacion la fecha va hacer automatica-------
CREATE OR REPLACE TRIGGER TR_CALIFICACIONFECHA_BI
BEFORE INSERT ON calificaciones
FOR EACH ROW 
BEGIN 
    :NEW.fecha := SYSDATE;
END;
/

-----Solo se puede actualizar un cliente premium si su membresia esta en estado Paga---------
CREATE OR REPLACE TRIGGER TR_CLIENTEEstado_BU
BEFORE UPDATE ON ClientesPremium
FOR EACH ROW
BEGIN 
    IF :OLD.membresia = 'PE' THEN
    RAISE_APPLICATION_ERROR(-20003, 'No se puede actualizar los clientes que tienen su membresia pendiente');
    END IF;
END;
/

----Cada vez que ingrese un estudiante se actualiza la lista de matriculados-----
CREATE OR REPLACE TRIGGER TR_ESTUDIANTEMatricula_AI
AFTER INSERT OR DELETE ON EstudiantesCursos
BEGIN
    UPDATE cursos c
    SET listaDeMatriculados = (SELECT COUNT(*) FROM EstudiantesCursos e WHERE e.codigoCurso = c.codigo) 
    WHERE c.codigo IN (SELECT DISTINCT codigoCurso FROM EstudiantesCursos);
END;
/
    

----No se puede eliminar un cliente gratuito
CREATE OR REPLACE TRIGGER TR_CLIENTEGratuito_BD
BEFORE DELETE ON ClientesGratuitos
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20004, 'No se pueden eliminar clientes gratuitos');
END;
/

----El registro es automatico ----
CREATE OR REPLACE TRIGGER TR_ESTUDIANTERegistro
BEFORE INSERT ON Estudiantes
FOR EACH ROW
BEGIN 
    :New.registro := SYSDATE;
END;
/

----Si la profesion es Nula se tomara como por asignar----
CREATE OR REPLACE TRIGGER TR_PROFESORProf_BI
BEFORE INSERT ON Profesores
FOR EACH ROW
BEGIN 
    IF :NEW.profesion IS NULL THEN
    :NEW.profesion := 'Por asignar';
    END IF;
END;
/

SELECT * from calificaciones;
/*-------------------------------------------DisparadoresOk-------------------------------------------*/
----Ejecutando TR_CALIFICACIONES_BU----OK
UPDATE calificaciones SET COMENTARIO = 'Cambio' WHERE idTarea = 2;

----Ejecutando TR_PROFESORNOMBRE_BI----OK
INSERT INTO Profesores(nid,nombre,telefono,profesion) VALUES(20910979,NULL,325678459,'Pedagogia');

select * from TAREAS;
select * from CALIFICACIONES;
----Ejecutando TR_TAREA_CALIFICACION_BD----OK
INSERT INTO calificaciones(idTarea,puntaje,fecha,comentario,estudiante) VALUES(5,30,TO_DATE('2024-04-25', 'YYYY-MM-DD'),'Falta punto 4',1054562);
DELETE FROM TAREAS WHERE idTarea = '50';

SELECT * FROM CALIFICACIONES;
SELECT * FROM ESTUDIANTES;
----Ejecutando TR_CALIFICACIONFECHA_BI----OK
INSERT INTO calificaciones(idTarea,puntaje,comentario,estudiante) VALUES (1,45,'Excelente trabajo',1002546);

SELECT * FROM CLIENTESPREMIUM;
----Ejecutando TR_CLIENTEEstado_BU----
UPDATE ClientesPremium SET membresia = 'PE' WHERE USUARIOE = 1;
UPDATE ClientesPremium SET telefono = 300681785 WHERE USUARIOE = 1077083;

---Ejecutando TR_ESTUDIANTEMatricula_AI----
SELECT * FROM CURSOS;
SELECT * FROM ESTUDIANTESCURSOS;
DELETE FROM ESTUDIANTESCURSOS WHERE CODIGOCURSO = 101;
INSERT INTO ESTUDIANTESCURSOS VALUES(1046584,101);

---Ejecutando TR_CLIENTEGratuito_BD----OK
SELECT * FROM CLIENTESGRATUITOS;
DELETE FROM CLIENTESGRATUITOS WHERE USUARIOE = 1077083;

---Ejecutando TR_ESTUDIANTERegistro---OK
SELECT * FROM ESTUDIANTES;

INSERT INTO estudiantes(usuario, nombre, correo, contrasena, programa, registro ,codigoInstitucion)
VALUES(1046584, 'Valentina Munar', 'munarVale@hotmail.com', 845621547, 'Comunicaciones',NULL ,304587);

---Ejecutando TR_PROFESORProf_BI--OK
SELECT * FROM PROFESORES;
INSERT INTO Profesores(nid,nombre,telefono,profesion) VALUES(2091099,'Juan',325678459,NULL);
/*------------------------------------DisparadoresNoOk------------------------------------*/
----Ejecutando TR_CALIFICACIONES_BU----OK---Este no permite modificar los atributos debido a que viola la integridad--
UPDATE calificaciones SET COMENTARIO = 'Cambio' WHERE idTarea = 2;

INSERT INTO calificaciones(idTarea,puntaje,fecha,comentario,estudiante) VALUES(5,30,TO_DATE('2024-04-25', 'YYYY-MM-DD'),'Falta punto 4',1054562);
DELETE FROM TAREAS WHERE idTarea = '50';



