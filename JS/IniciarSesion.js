/*$(document).ready(function() {
    $('#loginForm').submit(function(event) {
        event.preventDefault(); // Prevenir el envío del formulario

        // Limpiar mensajes de error
        $('#usernameError').text('');
        $('#passwordError').text('');

        let username = $('#username').val().trim();
        let password = $('#password').val().trim();
        let isValid = true;

        // Validar el nombre de usuario
        if (username === '') {
            $('#usernameError').text('El nombre de usuario es obligatorio.');
            isValid = false;
        }

        // Validar la contraseña
        if (password === '') {
            $('#passwordError').text('La contraseña es obligatoria.');
            isValid = false;
        }

        // Si todos los campos son válidos, enviar el formulario
        if (isValid) {
            $.ajax({
                type: 'POST',
                url: '../PHP/IniciarSesion.php',
                data: {
                    username: username,
                    password: password
                },
                success: function(response) {
                    let data = JSON.parse(response);
                    if (data.mensaje) {
                        alert(data.mensaje);
                    }
                },
                error: function() {
                    alert('Error en la comunicación con el servidor.');
                }
            });
        }
    });
});*/
