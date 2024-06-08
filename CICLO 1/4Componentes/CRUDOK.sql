
/*---------------------CRUDOK-----------------------------------*/
/*Adicionar Institución*/
SELECT * FROM ESTUDIANTES;
Begin
    PC_INSTITUCION.AD_INSTITUCION(101, 'Católica', 'Kr 6 35-23', 'E');
END;
/

/*Modificar Institución*/
Begin
    PC_INSTITUCION.MOD_INSTITUCION('101', 'Konrad', 'Calle 57 #56-21', 'E');
END;
/

/*Consultar Institución*/
SELECT
    PC_INSTITUCION.CO_INSTITUCION(101)
FROM DUAL;

/*Eliminar Institución*/
Begin
    PC_INSTITUCION.EL_INSTITUCION(101);
END;
/


/*Adicionar Estudiante*/
Begin
    PC_ESTUDIANTE.AD_ESTUDIANTE(1, 'Alison Vald', 'alison@ejemplo.com', 123456, 'Ing Sistemas', SYSDATE, 1001300426);
END;
/

/*Modificar Estudiante*/
Begin
    PC_ESTUDIANTE.MOD_ESTUDIANTE(1, 'Diana Her', 'diana@ejemplo.com', 654321, 'Ing Estadística', SYSDATE, 1000046378);
END;
/

/*Consultar Estudiante*/
SELECT
    PC_ESTUDIANTE.CO_ESTUDIANTE(1)
FROM DUAL;

/*Eliminar Estudiante*/
Begin
    PC_ESTUDIANTE.EL_ESTUDIANTE(1);
END;
/

/*Adicionar Cliente Premium*/
Begin
    PC_PREMIUM.AD_PREMIUM(1, 'P', SYSDATE, 311269586, 'Calle 14B #3A');
END;
/

/*Modificar Cliente Premium*/
Begin
    PC_PREMIUM.MOD_PREMIUM(1, 'P', SYSDATE+30, 321212647, 'Calle 57 #56-21');
END;
/

/*Consultar Cliente Premium*/
SELECT
    PC_PREMIUM.CO_PREMIUM(1)
FROM DUAL;

/*Eliminar Cliente Premium*/
Begin
    PC_PREMIUM.EL_PREMIUM(1);
END;
/

select * from ESTUDIANTES;

/*Adicionar Cliente Gratuito*/
Begin
    PC_GRATUITO.AD_GRATUITO(1, 'alison_temporal@cfdf.edu');
END;
/

/*Consultar Cliente Gratuito*/
SELECT
    PC_GRATUITO.CO_GRATUITO(1)
FROM DUAL;

select * from clientesgratuitos;
select * from ESTUDIANTES;

/*Eliminar Cliente Gratuito Se implemta pero el disparador no se puede eliminar*/
Begin
    PC_GRATUITO.EL_GRATUITO(1);
END;
/

/*Adicionar Curso*/
Begin
    PC_CURSO.AD_CURSO(1, 'MBDA', 0, 30,NULL, 101, NULL);
END;
/

select * from cursos;
select * from INSTITUCIONES;

/*Modificar Curso*/
Begin
    PC_CURSO.MOD_CURSO(1, 'POOB', 0, 40, NULL,101, null);
END;
/

/*Consultar Curso*/
SELECT
    PC_CURSO.CO_CURSO(1)
FROM DUAL;

/*Eliminar Curso*/
Begin
    PC_CURSO.EL_CURSO(1);
END;
/

/*Agregar Estudiante a Curso*/
Begin
    PC_ESTCURSO.AD_ESTCURSO(1, 1);
END;
/

/*Consultar Estudiantes de un Curso*/
SELECT
    PC_ESTCURSO.CO_ESTCURSO(1)
FROM DUAL;

/*Quitar Estudiante de Curso*/
Begin
    PC_ESTCURSO.EL_ESTCURSO(1);
END;
/
SELECT * FROM PROFESORES;
/*Adicionar Profesor*/
Begin
    PC_PROFESOR.AD_PROFESOR(1, 'Orlando Gelves', 322237996, 'Ing Sistemas');
END;
/
/*Modificar Profesor*/
Begin
    PC_PROFESOR.MOD_PROFESOR(1, 'Maria Diaz', 31126879, 'Ing Sistemas');
END;
/

/*Consultar Profesor*/
SELECT
    PC_PROFESOR.CO_PROFESOR(1)
FROM DUAL;

/*Eliminar Profesor*/
Begin
    PC_PROFESOR.EL_PROFESOR(1);
END;
/
/*Agregar Recurso Adicional*/
Begin
    PC_RECURSO.AD_RECURSO(1, 'L', SYSDATE, 'XML', 'Notas de Clase', 101);
END;
/

/*Modificar Recurso Adicional*/
Begin
    PC_RECURSO.MOD_RECURSO(1, 'L', SYSDATE+1, 'MySQL', 'Trabajo en Clase', 101);
END;
/

/*Consultar Recurso Adicional*/
SELECT
    PC_RECURSO.CO_RECURSO(1)
FROM DUAL;

/*Eliminar Recurso Adicional*/
Begin
    PC_RECURSO.EL_RECURSO(1);
END;
/

/*Agregar Tarea*/
Begin
    PC_TAREA.AD_TAREA(6, 'Tarea MBDA', 'Hacer LAB', SYSDATE, SYSDATE+7, 'P', 1);
END;
/

/*Modificar Tarea*/
Begin
    PC_TAREA.MOD_TAREA(6, 'Tarea POOB ', 'Hacer proyecto', SYSDATE+1, SYSDATE+14, 'A', 1);
END;
/

/*Consultar Tarea*/
SELECT
    PC_TAREA.CO_TAREA(6)
FROM DUAL;

/*Eliminar Tarea*/
Begin
    PC_TAREA.EL_TAREA(6);
END;
/

/*Agregar Calificación*/
Begin
    PC_CALIFICACION.AD_CALIFICACION(6, 45, SYSDATE, 'Buen trabajo', 1);
END;
/

/*Consultar Calificación*/
SELECT
    PC_CALIFICACION.CO_CALIFICACION(6,1)
FROM DUAL;


/*Eliminar Calificación*/
Begin
    PC_CALIFICACION.EL_CALIFICACION(6, 1);
END;
/