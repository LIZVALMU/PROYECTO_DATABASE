

/*Adicionar Institución*/
Begin
    PC_INSTITUCION.AD_INSTITUCION(101, 'Católica', 'Kr 6 35-23', 'PREG');
END;
/

/*Modificar Institución*/
Begin
    PC_INSTITUCION.MOD_INSTITUCION(101, 'Konrad', 'Calle 57 #56-21', 'POSGR');
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
    AD_ESTUDIANTE(1, 'Alison Vald', 'alison.valderramaescuelaing@ejemplo.com', 123456, 'Ing Sistemas', SYSDATE, 1001300426);
END;
/

/*Modificar Estudiante*/
Begin
    MOD_ESTUDIANTE(1, 'Diana Her', 'diana.hernandezescuelaing@ejemplo.com', 654321, 'Ing Estadística', SYSDATE, 1000046378);
END;
/

/*Consultar Estudiante*/
SELECT 
    CO_ESTUDIANTE(1) 
FROM DUAL;

/*Eliminar Estudiante*/
Begin
    EL_ESTUDIANTE(1);
END;
/

/*Adicionar Cliente Premium*/
Begin
    AD_CLIENTE_PREMIUM(1, 'G', SYSDATE, 3112695860, 'Calle 14B #3A');
END;
/

/*Modificar Cliente Premium*/
Begin
    MOD_CLIENTE_PREMIUM(1, 'P', SYSDATE+30, 3212126478, 'Calle 57 #56-21');
END;
/

/*Consultar Cliente Premium*/
SELECT 
    CO_CLIENTE_PREMIUM(1) 
FROM DUAL;

/*Eliminar Cliente Premium*/
Begin
    EL_CLIENTE_PREMIUM(1);
END;
/

/*Adicionar Cliente Gratuito*/
Begin
    AD_CLIENTE_GRATUITO(1, 'alison_valderrama.escuelaingtemporal@ejemplo.com');
END;
/

/*Consultar Cliente Gratuito*/
SELECT 
    CO_CLIENTE_GRATUITO(1) 
FROM DUAL;


/*Eliminar Cliente Gratuito*/
Begin
    EL_CLIENTE_GRATUITO(1);
END;
/

/*Adicionar Curso*/
Begin
    AD_CURSO(1, 'Modelos de bases de datos', 10, 30, 5, 1, 6);
END;
/

/*Modificar Curso*/
Begin
    MOD_CURSO(1, 'Programacion orientada a objetos', 15, 40, 8, 2, 7);
END;
/

/*Consultar Curso*/
SELECT 
    CO_CURSO(1) 
FROM DUAL;

/*Eliminar Curso*/
Begin
    EL_CURSO(1);
END;
/

/*Agregar Estudiante a Curso*/
Begin
    AD_ESTUDIANTE_CURSO(21717453212126478, 01);
END;
/

/*Consultar Estudiantes de un Curso*/
SELECT 
    CO_ESTUDIANTES_CURSO(01) 
FROM DUAL;

/*Quitar Estudiante de Curso*/
Begin
    EL_ESTUDIANTE_CURSO(2171745, 01);
END;
/

/*Adicionar Profesor*/
Begin
    AD_PROFESOR(1, 'Orlando Gelves', 3222379967, 'Ing Sistemas');
END;
/

/*Modificar Profesor*/
Begin
    MOD_PROFESOR(1, 'Maria Diaz', 311268790, 'Ing Sistemas');
END;
/

/*Consultar Profesor*/
SELECT 
    CO_PROFESOR(1) 
FROM DUAL;

/*Eliminar Profesor*/
Begin
    EL_PROFESOR(1);
END;
/

/*Agregar Recurso Adicional*/
Begin
    AD_RECURSO_ADICIONAL(1, 'NDC', SYSDATE, 'XML', 'Notas de Clase', 1);
END;
/

/*Modificar Recurso Adicional*/
Begin
    MOD_RECURSO_ADICIONAL(1, 'TEC', SYSDATE+1, 'MySQL', 'Trabajo en Clase', 2);
END;
/

/*Consultar Recurso Adicional*/
SELECT 
    CO_RECURSO_ADICIONAL(1) 
FROM DUAL;

/*Eliminar Recurso Adicional*/
Begin
    EL_RECURSO_ADICIONAL(1);
END;
/

/*Agregar Tarea*/
Begin
    AD_TAREA(1, 'Tarea Modelos de bases de datos', 'Hacer LAB', SYSDATE, SYSDATE+7, 'P', 1);
END;
/

/*Modificar Tarea*/
Begin
    MOD_TAREA(1, 'Tarea Programacion orientada a objetos ', 'Hacer proyecto', SYSDATE+1, SYSDATE+14, 'A', 2);
END;
/

/*Consultar Tarea*/
SELECT 
    CO_TAREA(1) 
FROM DUAL;

/*Eliminar Tarea*/
Begin
    EL_TAREA(1);
END;
/

/*Agregar Calificación*/
Begin
    AD_CALIFICACION(1, 450, SYSDATE, 'Buen trabajo', 1);
END;
/

/*Modificar Calificación*/
Begin
    MOD_CALIFICACION(1, 700, SYSDATE-1, 'Excelente trabajo', 1);
END;
/

/*Consultar Calificación*/
SELECT 
    CO_CALIFICACION(1,1) 
FROM DUAL;


/*Eliminar Calificación*/
Begin
    EL_CALIFICACION(1, 1);
END;
/