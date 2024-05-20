CREATE INDEX Ind_UsuariosEstudiante ON ESTUDIANTES(usuario);
CREATE INDEX Ind_CodigoInstitucion ON INSTITUCIONES(codigo);
CREATE INDEX Ind_CodigoCursos ON CURSOS(codigo);
CREATE INDEX Ind_CodigoTareas ON TAREAS(idTarea);
CREATE INDEX Ind_NotaCalificaciones ON CALIFICACIONES(idTarea);
