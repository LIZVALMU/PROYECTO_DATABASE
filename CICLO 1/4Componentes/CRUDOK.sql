/*---------------------CRUDOK-----------------------------------*/
/*Adicionar Institución*/
Begin
    PC_INSTITUCION.AD_INSTITUCION(101, 'Católica', 'Kr 6 35-23', 'P');
END;
/

/*Modificar Institución*/
Begin
    PC_INSTITUCION.MOD_INSTITUCION(101, 'Konrad', 'Calle 57 #56-21', 'N');
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
    PC_PREMIUM.AD_PREMIUM(1, 'G', SYSDATE, 311269586, 'Calle 14B #3A');
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

/*Adicionar Cliente Gratuito*/
Begin
    PC_GRATUITO.AD_GRATUITO(1, 'alison_temporal@ejemplo.com');
END;
/

/*Consultar Cliente Gratuito*/
SELECT 
    PC_GRATUITO.CO_GRATUITO(1) 
FROM DUAL;


/*Eliminar Cliente Gratuito*/
Begin
    PC_GRATUITO.EL_GRATUITO(1);
END;
/

/*Adicionar Curso*/
Begin
    PC_CURSO.AD_CURSO(1, 'MBDA', 10, 30,NULL, 102, NULL);
END;
/

/*Modificar Curso*/
Begin
    PC_CURSO.MOD_CURSO(1, 'POOB', 15, 40, NULL, 102, NULL);
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

//*Agregar Estudiante a Curso*/
Begin
    PC_ESTCURSO.AD_ESTCURSO(1, 2);
END;
/

/*Consultar Estudiantes de un Curso*/
SELECT 
    PC_ESTCURSO.CO_ESTCURSO(2) 
FROM DUAL;

/*Quitar Estudiante de Curso*/
Begin
    PC_ESTCURSO.EL_ESTCURSO(1, 2);
END;
/

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
    PC_RECURSO.AD_RECURSO(1, 'T', SYSDATE, 'XML', 'Notas de Clase', 1);
END;
/

/*Modificar Recurso Adicional*/
Begin
    PC_RECURSO.MOD_RECURSO(1, 'N', SYSDATE+1, 'MySQL', 'Trabajo en Clase', 2);
END;
/

/*Consultar Recurso Adicional*/
SELECT 
    CO_RECURSO(1) 
FROM DUAL;

/*Eliminar Recurso Adicional*/
Begin
    PC_RECURSO.EL_RECURSO(1);
END;
/

/*Agregar Tarea*/
Begin
    PC_TAREA.AD_TAREA(1, 'Tarea MBDA', 'Hacer LAB', SYSDATE, SYSDATE+7, 'P', 1);
END;
/

/*Modificar Tarea*/
Begin
    PC_TAREA.MOD_TAREA(1, 'Tarea POOB ', 'Hacer proyecto', SYSDATE+1, SYSDATE+14, 'A', 2);
END;
/

/*Consultar Tarea*/
SELECT 
    PC_TAREA.CO_TAREA(1) 
FROM DUAL;

/*Eliminar Tarea*/
Begin
    PC_TAREA.EL_TAREA(1);
END;
/

/*Agregar Calificación*/
Begin
    PC_CALIFICACION.AD_CALIFICACION(1, 45, SYSDATE, 'Buen trabajo', 1);
END;
/

/*Modificar Calificación*/
Begin
    PC_CALIFICACION.MOD_CALIFICACION(1, 50, SYSDATE-1, 'Excelente trabajo', 1);
END;
/

/*Consultar Calificación*/
SELECT 
    PC_CALIFICACION.CO_CALIFICACION(1,1) 
FROM DUAL;


/*Eliminar Calificación*/
Begin
    PC_CALIFICACION.EL_CALIFICACION(1, 1);
END;
/