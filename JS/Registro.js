document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('.register-form');

    form.addEventListener('submit', function (e) {
        // Evitar el envío del formulario si hay errores
        e.preventDefault();
        
        // Obtener los valores de los campos
        const fullName = document.getElementById('full-name').value.trim();
        const username = document.getElementById('username').value.trim();
        const birthDate = document.getElementById('birth-date').value;
        const email = document.getElementById('email').value.trim();
        const gender = document.getElementById('gender').value;
        const password = document.getElementById('password').value.trim();
        const userRole = document.getElementById('user-role').value;
        
        // Validaciones
        let valid = true;
        
        // Validar que ningún campo esté vacío
        if (!fullName || !username || !birthDate || !email || !gender || !password || !userRole) {
            alert('Todos los campos son obligatorios.');
            valid = false;
        }

        // Validar que el Nombre Completo solo contenga letras
        const nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(fullName)) {
            alert('El Nombre Completo solo debe contener letras.');
            valid = false;
        }

        // Validar que el Nombre de Usuario no tenga más de 20 caracteres
        if (username.length > 20) {
            alert('El Nombre de Usuario no puede tener más de 20 caracteres.');
            valid = false;
        }

        // Validar el formato del correo electrónico
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('El formato del Correo Electrónico no es válido.');
            valid = false;
        }

        // Validar la contraseña
        const passwordRegex = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
        if (!passwordRegex.test(password)) {
            alert('La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial.');
            valid = false;
        }

        // Si todas las validaciones pasan, se envía el formulario
        if (valid) {
            form.submit();
        }
    });
});
