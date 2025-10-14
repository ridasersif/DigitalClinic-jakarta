// Main JavaScript for Clinic Management System

document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

function initializeApp() {
    initializeDatePickers();
    initializeFormValidations();
    initializeInteractiveElements();
    initializeDataTables();
}

// Initialize date pickers with constraints
function initializeDatePickers() {
    const dateInputs = document.querySelectorAll('input[type="date"]');
    const today = new Date().toISOString().split('T')[0];

    dateInputs.forEach(input => {
        // Set min date to today for future dates
        if (input.id === 'date' || input.id === 'nextAppointment') {
            input.min = today;
        }

        // Add change event listeners
        input.addEventListener('change', function() {
            validateDate(this);
        });
    });
}

// Date validation
function validateDate(dateInput) {
    const selectedDate = new Date(dateInput.value);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        showAlert('Veuillez sélectionner une date future.', 'warning');
        dateInput.value = '';
        return false;
    }

    return true;
}

// Form validation initialization
function initializeFormValidations() {
    const forms = document.querySelectorAll('form');

    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
                showAlert('Veuillez corriger les erreurs dans le formulaire.', 'danger');
            }
        });
    });
}

// Generic form validation
function validateForm(form) {
    let isValid = true;
    const requiredFields = form.querySelectorAll('[required]');

    requiredFields.forEach(field => {
        if (!field.value.trim()) {
            markFieldInvalid(field);
            isValid = false;
        } else {
            markFieldValid(field);
        }
    });

    // Password confirmation validation
    const password = form.querySelector('#password');
    const confirmPassword = form.querySelector('#confirmPassword');

    if (password && confirmPassword) {
        if (password.value !== confirmPassword.value) {
            markFieldInvalid(confirmPassword);
            showFieldError(confirmPassword, 'Les mots de passe ne correspondent pas.');
            isValid = false;
        }
    }

    return isValid;
}

// Field validation helpers
function markFieldInvalid(field) {
    field.classList.add('is-invalid');
    field.classList.remove('is-valid');
}

function markFieldValid(field) {
    field.classList.remove('is-invalid');
    field.classList.add('is-valid');
}

function showFieldError(field, message) {
    let errorDiv = field.parentNode.querySelector('.invalid-feedback');
    if (!errorDiv) {
        errorDiv = document.createElement('div');
        errorDiv.className = 'invalid-feedback';
        field.parentNode.appendChild(errorDiv);
    }
    errorDiv.textContent = message;
}

// Interactive elements initialization
function initializeInteractiveElements() {
    // Tab functionality
    const tabLinks = document.querySelectorAll('[data-bs-toggle="tab"]');
    tabLinks.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('data-bs-target'));
            if (target) {
                // Custom tab change logic can be added here
                console.log('Tab changed to:', target.id);
            }
        });
    });

    // Modal handlers
    const modals = document.querySelectorAll('.modal');
    modals.forEach(modal => {
        modal.addEventListener('show.bs.modal', function() {
            console.log('Modal opening:', this.id);
        });

        modal.addEventListener('hidden.bs.modal', function() {
            console.log('Modal closed:', this.id);
            // Reset form inside modal
            const form = this.querySelector('form');
            if (form) {
                form.reset();
                clearValidation(form);
            }
        });
    });

    // Department and doctor selection联动
    const departmentSelect = document.getElementById('department');
    const doctorSelect = document.getElementById('doctor');

    if (departmentSelect && doctorSelect) {
        departmentSelect.addEventListener('change', function() {
            updateDoctorsByDepartment(this.value, doctorSelect);
        });
    }
}

// Update doctors based on selected department
function updateDoctorsByDepartment(departmentId, doctorSelect) {
    // Clear existing options except the first one
    while (doctorSelect.options.length > 1) {
        doctorSelect.remove(1);
    }

    // Simulate fetching doctors based on department
    const doctors = getDoctorsByDepartment(departmentId);

    doctors.forEach(doctor => {
        const option = document.createElement('option');
        option.value = doctor.id;
        option.textContent = doctor.name;
        doctorSelect.appendChild(option);
    });
}

// Mock data for doctors by department
function getDoctorsByDepartment(departmentId) {
    const doctors = {
        'cardio': [
            { id: '1', name: 'Dr. Sophie Martin' },
            { id: '4', name: 'Dr. Alain Bernard' }
        ],
        'dermato': [
            { id: '2', name: 'Dr. Pierre Dubois' },
            { id: '5', name: 'Dr. Claire Moreau' }
        ],
        'pediatrie': [
            { id: '3', name: 'Dr. Marie Laurent' },
            { id: '6', name: 'Dr. Jean Petit' }
        ],
        'neurologie': [
            { id: '7', name: 'Dr. Alain Petit' },
            { id: '8', name: 'Dr. Nicole Blanc' }
        ]
    };

    return doctors[departmentId] || [];
}

// Data tables initialization (for future enhancement)
function initializeDataTables() {
    // This would initialize DataTables if the library is included
    console.log('Data tables initialization ready');
}

// Alert system
function showAlert(message, type = 'info') {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
    alertDiv.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

    // Prepend to the container or body
    const container = document.querySelector('.container') || document.body;
    container.insertBefore(alertDiv, container.firstChild);

    // Auto remove after 5 seconds
    setTimeout(() => {
        if (alertDiv.parentNode) {
            alertDiv.remove();
        }
    }, 5000);
}

// Clear validation states
function clearValidation(form) {
    const fields = form.querySelectorAll('.is-invalid, .is-valid');
    fields.forEach(field => {
        field.classList.remove('is-invalid', 'is-valid');
    });

    const errorMessages = form.querySelectorAll('.invalid-feedback');
    errorMessages.forEach(msg => msg.remove());
}

// Utility function for API calls (for future backend integration)
async function apiCall(endpoint, method = 'GET', data = null) {
    try {
        const options = {
            method: method,
            headers: {
                'Content-Type': 'application/json',
            },
        };

        if (data && (method === 'POST' || method === 'PUT')) {
            options.body = JSON.stringify(data);
        }

        const response = await fetch(endpoint, options);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        return await response.json();
    } catch (error) {
        console.error('API call failed:', error);
        showAlert('Une erreur est survenue lors de la communication avec le serveur.', 'danger');
        throw error;
    }
}

// Export functions for global access
window.ClinicApp = {
    showAlert,
    apiCall,
    validateForm
};