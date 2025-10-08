// Email Validation
function validateEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}

// Phone Validation
function validatePhone(phone) {
    const regex = /^(06|07|05)[0-9]{8}$/;
    return regex.test(phone);
}

// Password Validation
function validatePassword(password) {
    return password.length >= 8;
}

// CIN Validation
function validateCIN(cin) {
    const regex = /^[A-Z]{1,2}[0-9]{5,6}$/;
    return regex.test(cin);
}

// Date Validation (not in past)
function validateFutureDate(dateString) {
    const selectedDate = new Date(dateString);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return selectedDate >= today;
}

// Login Form Validation
function validateLoginForm() {
    let isValid = true;
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();

    // Clear previous errors
    clearErrors();

    // Validate email
    if (!email) {
        showError('email', 'Email est obligatoire');
        isValid = false;
    } else if (!validateEmail(email)) {
        showError('email', 'Email invalide');
        isValid = false;
    }

    // Validate password
    if (!password) {
        showError('password', 'Mot de passe est obligatoire');
        isValid = false;
    }

    return isValid;
}

// Register Form Validation
function validateRegisterForm() {
    let isValid = true;
    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const cin = document.getElementById('cin').value.trim();
    const password = document.getElementById('password').value.trim();
    const confirmPassword = document.getElementById('confirmPassword').value.trim();

    clearErrors();

    // Validate first name
    if (!firstName) {
        showError('firstName', 'Prénom est obligatoire');
        isValid = false;
    }

    // Validate last name
    if (!lastName) {
        showError('lastName', 'Nom est obligatoire');
        isValid = false;
    }

    // Validate email
    if (!email) {
        showError('email', 'Email est obligatoire');
        isValid = false;
    } else if (!validateEmail(email)) {
        showError('email', 'Email invalide');
        isValid = false;
    }

    // Validate phone
    if (!phone) {
        showError('phone', 'Téléphone est obligatoire');
        isValid = false;
    } else if (!validatePhone(phone)) {
        showError('phone', 'Téléphone invalide (ex: 0612345678)');
        isValid = false;
    }

    // Validate CIN
    if (!cin) {
        showError('cin', 'CIN est obligatoire');
        isValid = false;
    } else if (!validateCIN(cin)) {
        showError('cin', 'CIN invalide (ex: AB123456)');
        isValid = false;
    }

    // Validate password
    if (!password) {
        showError('password', 'Mot de passe est obligatoire');
        isValid = false;
    } else if (!validatePassword(password)) {
        showError('password', 'Mot de passe doit contenir au moins 8 caractères');
        isValid = false;
    }

    // Validate confirm password
    if (password !== confirmPassword) {
        showError('confirmPassword', 'Les mots de passe ne correspondent pas');
        isValid = false;
    }

    return isValid;
}

// Appointment Form Validation
function validateAppointmentForm() {
    let isValid = true;
    const doctorId = document.getElementById('doctorId').value;
    const appointmentDate = document.getElementById('appointmentDate').value;
    const appointmentTime = document.getElementById('appointmentTime').value;

    clearErrors();

    // Validate doctor selection
    if (!doctorId) {
        showError('doctorId', 'Veuillez sélectionner un médecin');
        isValid = false;
    }

    // Validate date
    if (!appointmentDate) {
        showError('appointmentDate', 'Date est obligatoire');
        isValid = false;
    } else if (!validateFutureDate(appointmentDate)) {
        showError('appointmentDate', 'La date doit être dans le futur');
        isValid = false;
    }

    // Validate time
    if (!appointmentTime) {
        showError('appointmentTime', 'Heure est obligatoire');
        isValid = false;
    }

    return isValid;
}

// Doctor Form Validation
function validateDoctorForm() {
    let isValid = true;
    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const specialization = document.getElementById('specialization').value.trim();
    const departmentId = document.getElementById('departmentId').value;

    clearErrors();

    if (!firstName) {
        showError('firstName', 'Prénom est obligatoire');
        isValid = false;
    }

    if (!lastName) {
        showError('lastName', 'Nom est obligatoire');
        isValid = false;
    }

    if (!email) {
        showError('email', 'Email est obligatoire');
        isValid = false;
    } else if (!validateEmail(email)) {
        showError('email', 'Email invalide');
        isValid = false;
    }

    if (!phone) {
        showError('phone', 'Téléphone est obligatoire');
        isValid = false;
    } else if (!validatePhone(phone)) {
        showError('phone', 'Téléphone invalide');
        isValid = false;
    }

    if (!specialization) {
        showError('specialization', 'Spécialisation est obligatoire');
        isValid = false;
    }

    if (!departmentId) {
        showError('departmentId', 'Département est obligatoire');
        isValid = false;
    }

    return isValid;
}

// Department Form Validation
function validateDepartmentForm() {
    let isValid = true;
    const name = document.getElementById('name').value.trim();
    const description = document.getElementById('description').value.trim();

    clearErrors();

    if (!name) {
        showError('name', 'Nom du département est obligatoire');
        isValid = false;
    }

    if (!description) {
        showError('description', 'Description est obligatoire');
        isValid = false;
    }

    return isValid;
}

// Room Form Validation
function validateRoomForm() {
    let isValid = true;
    const roomNumber = document.getElementById('roomNumber').value.trim();
    const departmentId = document.getElementById('departmentId').value;

    clearErrors();

    if (!roomNumber) {
        showError('roomNumber', 'Numéro de salle est obligatoire');
        isValid = false;
    }

    if (!departmentId) {
        showError('departmentId', 'Département est obligatoire');
        isValid = false;
    }

    return isValid;
}

// Helper Functions
function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    if (!field) return;

    field.classList.add('error');

    // Create error message element
    const errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.style.color = '#ef4444';
    errorDiv.style.fontSize = '0.875rem';
    errorDiv.style.marginTop = '0.25rem';
    errorDiv.textContent = message;

    // Insert error message after field
    field.parentNode.appendChild(errorDiv);
}

function clearErrors() {
    // Remove error classes
    document.querySelectorAll('.error').forEach(el => {
        el.classList.remove('error');
    });

    // Remove error messages
    document.querySelectorAll('.error-message').forEach(el => {
        el.remove();
    });
}

// Real-time validation
document.addEventListener('DOMContentLoaded', () => {
    // Email field validation
    const emailFields = document.querySelectorAll('input[type="email"]');
    emailFields.forEach(field => {
        field.addEventListener('blur', function() {
            if (this.value && !validateEmail(this.value)) {
                this.classList.add('error');
            } else {
                this.classList.remove('error');
            }
        });
    });

    // Phone field validation
    const phoneFields = document.querySelectorAll('input[name="phone"]');
    phoneFields.forEach(field => {
        field.addEventListener('blur', function() {
            if (this.value && !validatePhone(this.value)) {
                this.classList.add('error');
            } else {
                this.classList.remove('error');
            }
        });
    });

    // Password confirmation
    const confirmPasswordField = document.getElementById('confirmPassword');
    const passwordField = document.getElementById('password');

    if (confirmPasswordField && passwordField) {
        confirmPasswordField.addEventListener('input', function() {
            if (this.value !== passwordField.value) {
                this.classList.add('error');
            } else {
                this.classList.remove('error');
            }
        });
    }
});