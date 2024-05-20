------Esta vista sirve para identificar posibles estudiantes que
--pueden beneficiarse de un actividad extracurricular---
CREATE OR REPLACE VIEW INFOESTUDIANTES AS 
    SELECT e.nombre AS "Nombre"
    FROM Estudiantes e
    LEFT JOIN RecursosAdicionales ra ON e.usuario = ra.idRecursos
    WHERE ra.idRecursos IS NULL;

-- Vista de Estudiantes con Información de Instituciones

CREATE OR REPLACE VIEW VistaEstudiantesInstituciones AS
	SELECT e.usuario, 
		   e.nombre AS nombre_estudiante, 
		   e.correo, e.programa, 
		   e.registro, 
		   i.nombre AS nombre_institucion, 
		   i.direccion, 
		   i.tipo
	FROM Estudiantes e
	LEFT JOIN Instituciones i ON e.codigoInstitucion = i.codigo;


-- Vista de Estudiantes Matriculados en Cada Curso

CREATE OR REPLACE VIEW VistaEstudiantesCursos AS
	SELECT c.nombre AS nombre_curso, 
		   e.usuario AS id_estudiante, 	
		   e.nombre AS nombre_estudiante, 
		   e.correo
	FROM EstudiantesCursos ec
	JOIN Estudiantes e ON ec.usuario = e.usuario
	JOIN Cursos c ON ec.codigoCurso = c.codigo;

-- Vista de Clientes Premium con Información de Estudiantes

CREATE OR REPLACE VIEW VistaClientesPremium AS
	SELECT cp.usuarioE AS id_cliente, 
		   e.nombre AS nombre_estudiante, 
		   e.correo, 
		   cp.membresia, 
		   cp.fechaDeVencimiento, 
		   cp.telefono, 
		   cp.direccion
	FROM ClientesPremium cp
	JOIN Estudiantes e ON cp.usuarioE = e.usuario;

-- Vista de Clientes Gratuitos con Información de Estudiantes
CREATE VIEW VistaClientesGratuitos AS
	SELECT cg.usuarioE AS id_cliente, 
		   e.nombre AS nombre_estudiante, 
		   e.correo, 
		   cg.correoTemporal
	FROM ClientesGratuitos cg
	JOIN Estudiantes e ON cg.usuarioE = e.usuario;