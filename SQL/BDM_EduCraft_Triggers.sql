USE DB_BDM_CURSOS;


DELIMITER //

CREATE TRIGGER BajaLogicaPorIntentos
BEFORE UPDATE ON Usuario
FOR EACH ROW
BEGIN
    IF NEW.NumeroIntentosContraseña >= 3 THEN
        SET NEW.EstatusUsuario = 'Inactivo';
        SET NEW.FechaRegistroYActualizacionInfo = NOW();
    END IF;
END //

DELIMITER ;
