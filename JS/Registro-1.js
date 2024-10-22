$(document).ready(function () {
    const form = $('.register-form');

    form.on('submit', function (e) {
        e.preventDefault(); // Evita el envío del formulario por defecto

        // Obtener los valores de los campos
        const fullName = $('#full-name').val().trim();
        const birthDate = $('#birth-date').val();
        const email = $('#email').val().trim();
        const gender = $('#gender').val();
        const password = $('#password').val().trim();
        const userRole = $('#user-role').val();
        const userPhoto = $('#user-photo').val().trim();

        // Mensaje de validación
        let messages = '';
        let valid = true;

        // Validar que ningún campo esté vacío
        if (!fullName || !birthDate || !email || !gender || !password || !userRole || !userPhoto) {
            messages += '<div>Todos los campos son obligatorios :v.</div>';
            valid = false;
        }

        // Validar que el Nombre Completo solo contenga letras
        const nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(fullName)) {
            messages += '<div>El Nombre Completo solo debe contener letras.</div>';
            valid = false;
        }

        // Validar el formato del correo electrónico
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            messages += '<div>El formato del Correo Electrónico no es válido.</div>';
            valid = false;
        }

        // Validar la contraseña
        const passwordRegex = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
        if (!passwordRegex.test(password)) {
            messages += '<div>La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial.</div>';
            valid = false;
        }

        // Mostrar mensajes de validación
        $('#messages').removeClass('d-none alert-success').addClass('alert-danger').html(messages);

        // Si todas las validaciones pasan, mostrar mensaje de éxito y redirigir después de 2 segundos
        if (valid) {
            $('#messages').removeClass('alert-danger').addClass('alert-success').html('<div>Registro exitoso. Redirigiendo...</div>');

            // Deshabilitar temporalmente el botón de envío para evitar múltiples envíos
            $('button[type="submit"]').prop('disabled', true);

            // Usar setTimeout para redirigir después de 2 segundos
            setTimeout(function () {
                form.off('submit').submit(); // Enviar el formulario
            }, 2000); // 2000 milisegundos = 2 segundos
        }
    });
});
