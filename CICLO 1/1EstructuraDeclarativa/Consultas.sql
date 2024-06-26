--Consultas

SELECT * FROM (
  SELECT e.usuario, e.nombre, AVG(c.puntaje) as Promedio
  FROM Estudiantes e
  JOIN calificaciones c ON e.usuario = c.estudiante
  GROUP BY e.usuario, e.nombre
  ORDER BY Promedio DESC
)
WHERE ROWNUM <= 5;
--Contexto: Esta consulta es relevante para identificar a los estudiantes con 
--mejor rendimiento académico en todos sus cursos.

SELECT c.nombre, COUNT(*) as NumEstudiantes
FROM Cursos c
JOIN EstudiantesCursos ec ON c.codigo = ec.codigoCurso
GROUP BY c.codigo, c.nombre
ORDER BY NumEstudiantes DESC;
--Contexto: Esta consulta puede ser útil para identificar qué cursos son los más 
--populares entre los estudiantes.

SELECT p.nombre, COUNT(*) as NumCursos
FROM Profesores p
JOIN Cursos c ON p.nid = c.nidProfesor
GROUP BY p.nid, p.nombre
HAVING COUNT(*) > 1;
--Contexto: Esta consulta es relevante para identificar a los profesores que 
--tienen una carga de trabajo más alta.

SELECT e.nombre
FROM Estudiantes e
LEFT JOIN RecursosAdicionales ra ON e.usuario = ra.idRecursos
WHERE ra.idRecursos IS NULL;
--Contexto: Esta consulta puede ser útil para identificar a los estudiantes que 
--podrían beneficiarse de participar en actividades extracurriculares.


INSERT INTO ESTUDIANTES(USUARIO, NOMBRE, CORREO, CONTRASENA, PROGRAMA, REGISTRO, CODIGOINSTITUCION)
VALUES (1234, 'Juan', 'jUAN123@GMAIL.COM', '12345', 'INGENIERIA', TO_DATE('2024-05-30', 'YYYY-MM-DD'), 1234);

INSERT INTO CLIENTESPREMIUM(USUARIOE, MEMBRESIA, FECHADEVENCIMIENTO, TELEFONO, DIRECCION)
VALUES(1234, 'P', TO_DATE('2023-05-30', 'YYYY-MM-DD'), '1234567890', 'CALLE 123');

SELECT *
FROM ClientesPremium
WHERE fechaDeVencimiento < ADD_MONTHS(SYSDATE, -6);
--Contexto: Esta consulta es esencial para el seguimiento del servicio al 
--cliente para fomentar las renovaciones o abordar cualquier problema que 
--conduzca a la no renovación.

SELECT COUNT(*) FROM ClientesPremium;
--La cantidad de clientes pagos que hay de la tabla ClientesPremium.

