<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Clinique Privée</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .auth-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .auth-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 480px;
            width: 100%;
        }
        .auth-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.8rem;
            text-align: center;
        }
        .auth-body {
            padding: 1.8rem;
        }
        .btn-auth {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            padding: 10px;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            color: white;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .progress {
            height: 5px;
            margin-bottom: 5px;
        }
        small.text-muted { font-size: 0.85rem; }
    </style>
</head>
<body>
<div class="auth-container">
    <div class="auth-card">
        <div class="auth-header">
            <i class="fas fa-user-md fa-3x mb-2"></i>
            <h3 class="mb-0">Clinique Privée</h3>
            <p class="mb-0 small">Créer un compte patient</p>
        </div>

        <div class="auth-body">
            <form method="post" action="<%= request.getContextPath() %>/auth/register">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName" class="form-label">Prénom</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="fas fa-user text-primary"></i></span>
                            <input type="text" class="form-control border-start-0" id="firstName" name="firstName" placeholder="Votre prénom" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" class="form-label">Nom</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="fas fa-user text-primary"></i></span>
                            <input type="text" class="form-control border-start-0" id="lastName" name="lastName" placeholder="Votre nom" required>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-envelope text-primary"></i></span>
                        <input type="email" class="form-control border-start-0" id="email" name="email" placeholder="votre@email.com" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Mot de passe</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-primary"></i></span>
                        <input type="password" class="form-control border-start-0" id="password" name="password" placeholder="Mot de passe" required>
                    </div>
                    <div class="progress mt-2">
                        <div class="progress-bar bg-danger" id="passwordStrength" style="width: 0%"></div>
                    </div>
                    <small id="passwordFeedback" class="text-muted">Force du mot de passe</small>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="weight" class="form-label">Poids (kg)</label>
                        <input type="number" class="form-control" id="weight" name="weight" placeholder="70" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="height" class="form-label">Taille (cm)</label>
                        <input type="number" class="form-control" id="height" name="height" placeholder="175" required>
                    </div>
                </div>

                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" id="terms" required>
                    <label class="form-check-label small" for="terms">
                        J'accepte les <a href="#" class="text-decoration-none">conditions d'utilisation</a>
                    </label>
                </div>

                <button type="submit" class="btn btn-auth w-100">S'inscrire</button>

                <div class="text-center mt-3">
                    <p class="mb-1 small">Déjà un compte ?
                        <a href="<%= request.getContextPath() %>/auth/login" class="text-decoration-none fw-bold">Se connecter</a>
                    </p>
                    <p class="mb-0 small">
                        <a href="<%= request.getContextPath() %>/" class="text-decoration-none"><i class="fas fa-home me-1"></i>Accueil</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('password').addEventListener('input', function() {
        const password = this.value;
        const strengthBar = document.getElementById('passwordStrength');
        const feedback = document.getElementById('passwordFeedback');

        let strength = 0;
        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password)) strength++;
        if (/[A-Z]/.test(password)) strength++;
        if (/\d/.test(password)) strength++;
        if (/[^A-Za-z0-9]/.test(password)) strength++;

        const strengthPercent = (strength / 5) * 100;
        strengthBar.style.width = strengthPercent + '%';

        if (strengthPercent <= 20) {
            strengthBar.className = 'progress-bar bg-danger';
            feedback.textContent = 'Très faible';
        } else if (strengthPercent <= 40) {
            strengthBar.className = 'progress-bar bg-warning';
            feedback.textContent = 'Faible';
        } else if (strengthPercent <= 60) {
            strengthBar.className = 'progress-bar bg-info';
            feedback.textContent = 'Moyen';
        } else if (strengthPercent <= 80) {
            strengthBar.className = 'progress-bar bg-primary';
            feedback.textContent = 'Fort';
        } else {
            strengthBar.className = 'progress-bar bg-success';
            feedback.textContent = 'Très fort';
        }
    });
</script>
</body>
</html>
