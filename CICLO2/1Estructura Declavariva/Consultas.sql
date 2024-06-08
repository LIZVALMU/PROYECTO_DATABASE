--Me da las ganancias de las facturas aprobadas
select sum(costo) from facturas where transaccion = 'A';

--Obtener todos los seguimientos y la información del cliente
SELECT s.*, cp.*
FROM Seguimientos s
JOIN ClientesPremium cp ON s.usuarioP = cp.usuarioE;

--Listar todas las actividades extracurriculares junto con los datos del estudiante:
SELECT ae.*, e.*
FROM ActividadesExtracurriculares ae
JOIN Estudiantes e ON ae.usuario = e.usuario;

--Contar el número de actividades extracurriculares por tipo:
SELECT tipo, COUNT(*) as total
FROM ActividadesExtracurriculares
GROUP BY tipo;

--Contar el número de recordatorios para cada usuario:
SELECT usuarioP, COUNT(*) as total_recordatorios
FROM Recordatorios
GROUP BY usuarioP;

--Listar las facturas cuyo usuario tenga una tarjeta de crédito:
SELECT f.*
FROM Facturas f
WHERE EXISTS (
    SELECT 1
    FROM Tarjetas t
    WHERE t.codigoFactura = f.codigo AND t.tipoTarjeta = 'CR'
);

--La consulta retorna todas las actividades de un Estudiante
SELECT
    EXTRACTVALUE(value(h), '/Franja/Actividad') AS Actividad
FROM
    HORARIOS h,
    TABLE(XMLSEQUENCE(EXTRACT(h.franjas, '/Horarios/Semana/Dia/Franja'))) h
WHERE
    h.usuario = 1002546;

--Me retorna todas las actividades de un Estudiante con horas 
SELECT
    EXTRACTVALUE(value(h), '/Franja/Actividad') AS Actividad,
    EXTRACTVALUE(value(h), '/Franja/FranjaInicio') AS FranjaInicio,
    EXTRACTVALUE(value(h), '/Franja/FranjaFinal') AS FranjaFinal
FROM
    HORARIOS h,
    TABLE(XMLSEQUENCE(EXTRACT(h.franjas, '/Horarios/Semana/Dia/Franja'))) h
WHERE
    h.usuario = 1002546;

--Me da las actividades de un estudiante en un dia Especifico

SELECT
    EXTRACTVALUE(value(f), '/Franja/Actividad') AS Actividad,
    EXTRACTVALUE(value(f), '/Franja/FranjaInicio') AS FranjaInicio,
    EXTRACTVALUE(value(f), '/Franja/FranjaFinal') AS FranjaFinal
FROM
    HORARIOS h,
    TABLE(XMLSEQUENCE(EXTRACT(h.franjas, '/Horarios/Semana/Dia[Nombre="Lunes"]/Franja'))) f
WHERE
    h.usuario = 1002546;


---Consultas Operativas

SELECT COUNT(*) FROM NotificacionesIncumplimientos;
SELECT COUNT(*) FROM ClientesPremium;
SELECT SUM(COSTO) FROM facturas WHERE TRANSACCION ='E';