$(document).ready(function () {
    const form = $('#loginForm');

    form.on('submit', function (e) {
        e.preventDefault(); // Evita el envío del formulario por defecto

        // Obtener los valores de los campos
        const email = $('#email').val().trim();
        const password = $('#password').val().trim();

        // Mensaje de validación
        let messages = '';
        let valid = true;

        // Validar que ningún campo esté vacío
        if (!email || !password) {
            messages += '<div>Todos los campos son obligatorios.</div>';
            valid = false;
        }

        // Validar el formato del correo electrónico
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            messages += '<div>El formato del Correo Electrónico no es válido.</div>';
            valid = false;
        }

        // Mostrar mensajes de validación
        if (!valid) {
            $('#messages').removeClass('d-none alert-success').addClass('alert-danger').html(messages);
        } else {
            $('#messages').removeClass('alert-danger').addClass('alert-success').html('<div>Iniciando sesión...</div>');

            // Deshabilitar temporalmente el botón de envío para evitar múltiples envíos
            $('button[type="submit"]').prop('disabled', true);

            // Enviar el formulario
            form.off('submit').submit();
        }
    });
});
