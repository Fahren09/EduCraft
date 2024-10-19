USE DB_BDM_CURSOS;


-- LOGIN
DELIMITER //

CREATE PROCEDURE IniciarSesion(
    IN p_Email VARCHAR(50),
    IN p_Contraseña VARCHAR(20),
    OUT p_EstatusSesion VARCHAR(50) -- Parámetro de salida para indicar el estado del inicio de sesión
)
BEGIN
    DECLARE v_ContraseñaActual VARCHAR(20);
    DECLARE v_NumeroIntentos INT;
    DECLARE v_EstatusUsuario VARCHAR(15);
    DECLARE v_UsuarioEncontrado INT;

    -- Verifica si el usuario existe
    SELECT COUNT(*) INTO v_UsuarioEncontrado
    FROM Usuario
    WHERE Email = p_Email;

    IF v_UsuarioEncontrado = 0 THEN
        -- Si no existe el usuario
        SET p_EstatusSesion = 'Usuario no encontrado';
    ELSE
        -- Si el usuario existe, obtenemos sus datos
        SELECT Contraseña, NumeroIntentosContraseña, EstatusUsuario
        INTO v_ContraseñaActual, v_NumeroIntentos, v_EstatusUsuario
        FROM Usuario
        WHERE Email = p_Email;

        -- Verifica si el usuario está inactivo
        IF v_EstatusUsuario = 'Inactivo' THEN
            SET p_EstatusSesion = 'Usuario inactivo por intentos fallidos. Contacte a un administrador.';
        ELSE
            -- Compara la contraseña
            IF p_Contraseña = v_ContraseñaActual THEN
                -- Si la contraseña es correcta, restablece el número de intentos a 0
                UPDATE Usuario
                SET NumeroIntentosContraseña = 0
                WHERE Email = p_Email;

                SET p_EstatusSesion = 'Inicio de sesión exitoso'; -- Contraseña correcta
            ELSE
                -- Si la contraseña es incorrecta, incrementa el número de intentos
                UPDATE Usuario
                SET NumeroIntentosContraseña = NumeroIntentosContraseña + 1
                WHERE Email = p_Email;

                SET p_EstatusSesion = 'Contraseña incorrecta'; -- Contraseña incorrecta
            END IF;
        END IF;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerRolUsuario(
    IN p_Email VARCHAR(50),
    OUT p_RolUsuario VARCHAR(20) -- Parámetro de salida para devolver el rol del usuario
)
BEGIN
    -- Obtener el rol del usuario con el email proporcionado
    SELECT Rol
    INTO p_RolUsuario
    FROM Usuario
    WHERE Email = p_Email;
END //

DELIMITER ;




-- USUARIO
DELIMITER //

CREATE PROCEDURE InsertarUsuario(
    IN p_Rol VARCHAR(20),
    IN p_ImagenAvatar VARCHAR(200),
    IN p_NombreCompleto VARCHAR(100),
    IN p_Genero VARCHAR(20),
    IN p_FechaNacimiento DATE,
    IN p_Email VARCHAR(50),
    IN p_Contraseña VARCHAR(20)
    -- IN p_EstatusUsuario VARCHAR(15)
)
BEGIN
    INSERT INTO Usuario (
        Rol, ImagenAvatar, NombreCompleto, Genero, FechaNacimiento, Email, Contraseña, NumeroIntentosContraseña, FechaRegistroYActualizacionInfo, EstatusUsuario
    )
    VALUES (
        p_Rol, p_ImagenAvatar, p_NombreCompleto, p_Genero, p_FechaNacimiento, p_Email, p_Contraseña, 0, NOW(), 'Activo'
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ModificarUsuario(
    IN p_Id_Usuario INT,
    -- IN p_Rol VARCHAR(20),
    IN p_ImagenAvatar VARCHAR(200),
    IN p_NombreCompleto VARCHAR(100),
    -- IN p_Genero VARCHAR(20),
    IN p_FechaNacimiento DATE,
    IN p_Email VARCHAR(50),
    IN p_Contraseña VARCHAR(20)
    -- IN p_EstatusUsuario VARCHAR(15)
)
BEGIN
    UPDATE Usuario
    SET 
        -- Rol = p_Rol,
        ImagenAvatar = p_ImagenAvatar,
        NombreCompleto = p_NombreCompleto,
        -- Genero = p_Genero,
        FechaNacimiento = p_FechaNacimiento,
        Email = p_Email,
        Contraseña = p_Contraseña,
        FechaRegistroYActualizacionInfo = NOW()
        -- EstatusUsuario = p_EstatusUsuario
    WHERE Id_Usuario = p_Id_Usuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BajaLogicaUsuario(
    IN p_Id_Usuario INT
)
BEGIN
    UPDATE Usuario
    SET 
        EstatusUsuario = 'Inactivo' -- BAJA LÓGICA
    WHERE Id_Usuario = p_Id_Usuario;
END //

DELIMITER ;

