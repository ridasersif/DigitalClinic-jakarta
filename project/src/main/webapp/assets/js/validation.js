// Validation functions for Clinic Management System

// Patient registration validation
function validatePatientRegistration(formData) {
    const errors = [];

    // Name validation
    if (!formData.firstName || formData.firstName.length < 2) {
        errors.push('Le prénom doit contenir au moins 2 caractères.');
    }

    if (!formData.lastName || formData.lastName.length < 2) {
        errors.push('Le nom doit contenir au moins 2 caractères.');
    }

    // Email validation
    if (!isValidEmail(formData.email)) {
        errors.push('Veuillez entrer une adresse email valide.');
    }

    // Password validation
    if (!isValidPassword(formData.password)) {
        errors.push('Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre.');
    }

    if (formData.password !== formData.confirmPassword) {
        errors.push('Les mots de passe ne correspondent pas.');
    }

    // Medical data validation
    if (formData.weight && (formData.weight < 20 || formData.weight > 300)) {
        errors.push('Le poids doit être compris entre 20 et 300 kg.');
    }

    if (formData.height && (formData.height < 100 || formData.height > 250)) {
        errors.push('La taille doit être comprise entre 100 et 250 cm.');
    }

    return errors;
}

// Appointment booking validation
function validateAppointmentBooking(formData) {
    const errors = [];

    if (!formData.department) {
        errors.push('Veuillez sélectionner un département.');
    }

    if (!formData.doctor) {
        errors.push('Veuillez sélectionner un docteur.');
    }

    if (!formData.date) {
        errors.push('Veuillez sélectionner une date.');
    }

    if (!formData.time) {
        errors.push('Veuillez sélectionner une heure.');
    }

    if (!formData.reason || formData.reason.length < 10) {
        errors.push('Veuillez décrire le motif de consultation (au moins 10 caractères).');
    }

    // Validate date is not in the past
    const selectedDate = new Date(formData.date + 'T' + formData.time);
    const now = new Date();

    if (selectedDate <= now) {
        errors.push('Veuillez sélectionner une date et heure futures.');
    }

    return errors;
}

// Medical consultation validation
function validateMedicalConsultation(formData) {
    const errors = [];

    if (!formData.diagnosis || formData.diagnosis.length < 5) {
        errors.push('Le diagnostic est requis (au moins 5 caractères).');
    }

    if (!formData.status) {
        errors.push('Veuillez sélectionner un statut pour la consultation.');
    }

    return errors;
}

// Utility validation functions
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function isValidPassword(password) {
    // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
    return passwordRegex.test(password);
}

function isValidPhone(phone) {
    // French phone number format
    const phoneRegex = /^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$/;
    return phoneRegex.test(phone.replace(/\s/g, ''));
}

function isValidLicenseNumber(license) {
    // Basic license number validation (can be enhanced based on country)
    return license && license.length >= 6;
}

// Real-time validation handlers
function setupRealTimeValidation() {
    // Email validation
    const emailInputs = document.querySelectorAll('input[type="email"]');
    emailInputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateEmailField(this);
        });
    });

    // Password strength
    const passwordInputs = document.querySelectorAll('input[type="password"]');
    passwordInputs.forEach(input => {
        input.addEventListener('input', function() {
            checkPasswordStrength(this);
        });
    });

    // Phone number validation
    const phoneInputs = document.querySelectorAll('input[type="tel"]');
    phoneInputs.forEach(input => {
        input.addEventListener('blur', function() {
            validatePhoneField(this);
        });
    });
}
// Field-specific validation functions
function validateEmailField(field) {
    if (field.value && !isValidEmail(field.value)) {
        markFieldInvalid(field);
        showFieldError(field, 'Veuillez entrer une adresse email valide.');
        return false;
    } else {
        markFieldValid(field);
        return true;
    }
}

function validatePhoneField(field) {
    if (field.value && !isValidPhone(field.value)) {
        markFieldInvalid(field);
        showFieldError(field, 'Veuillez entrer un numéro de téléphone valide.');
        return false;
    } else {
        markFieldValid(field);
        return true;
    }
}

function checkPasswordStrength(field) {
    const password = field.value;
    const strengthMeter = field.parentNode.querySelector('.password-strength');

    if (!strengthMeter) {
        return;
    }

    let strength = 0;
    let feedback = '';

    // Length check
    if (password.length >= 8) strength++;

    // Lowercase check
    if (/[a-z]/.test(password)) strength++;

    // Uppercase check
    if (/[A-Z]/.test(password)) strength++;

    // Number check
    if (/\d/.test(password)) strength++;

    // Special character check
    if (/[^A-Za-z0-9]/.test(password)) strength++;

    // Update strength meter
    const strengthClasses = ['bg-danger', 'bg-warning', 'bg-info', 'bg-primary', 'bg-success'];
    strengthMeter.className = 'progress-bar ' + (strengthClasses[strength - 1] || 'bg-danger');
    strengthMeter.style.width = (strength * 20) + '%';

    // Provide feedback
    switch(strength) {
        case 1:
        case 2:
            feedback = 'Faible';
            break;
        case 3:
            feedback = 'Moyen';
            break;
        case 4:
            feedback = 'Fort';
            break;
        case 5:
            feedback = 'Très fort';
            break;
        default:
            feedback = 'Très faible';
    }

    strengthMeter.textContent = feedback;
}

// Time slot validation
function validateTimeSlot(date, time, duration = 30) {
    const selectedDateTime = new Date(date + 'T' + time);
    const now = new Date();

    // Check if selected time is in the future
    if (selectedDateTime <= now) {
        return { isValid: false, message: 'Veuillez sélectionner un créneau futur.' };
    }

    // Check if time is within working hours (8:00-12:00 and 14:00-18:00)
    const hour = selectedDateTime.getHours();
    const minute = selectedDateTime.getMinutes();

    const isMorningSlot = (hour >= 8 && hour < 12) || (hour === 12 && minute === 0);
    const isAfternoonSlot = (hour >= 14 && hour < 18) || (hour === 18 && minute === 0);

    if (!isMorningSlot && !isAfternoonSlot) {
        return { isValid: false, message: 'Veuillez sélectionner un créneau entre 8h-12h ou 14h-18h.' };
    }

    // Check if time is on 30-minute increments
    if (minute !== 0 && minute !== 30) {
        return { isValid: false, message: 'Veuillez sélectionner un créneau de 30 minutes (00 ou 30).' };
    }

    return { isValid: true, message: 'Créneau valide.' };
}

// Export validation functions
window.ClinicValidation = {
    validatePatientRegistration,
    validateAppointmentBooking,
    validateMedicalConsultation,
    isValidEmail,
    isValidPassword,
    isValidPhone,
    isValidLicenseNumber,
    validateTimeSlot,
    setupRealTimeValidation
};

// Initialize real-time validation when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    ClinicValidation.setupRealTimeValidation();
});