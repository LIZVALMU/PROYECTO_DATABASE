CREATE INDEX Idx_NotificacionCodigo ON NotificacionesIncumplimientos(codigoFactura);
CREATE INDEX Idx_Factura_usuario ON Facturas(UsuarioP);
CREATE INDEX Idx_tarjeta_nombre ON Tarjetas(nombrepropietario);
CREATE INDEX Idx_RecordatorioNombre ON Recordatorios(nombre);