<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Clinique Privée</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
        }

        .auth-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 400px;
            width: 100%;
        }


        .auth-header {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            text-align: center;
            padding: 1.5rem 1rem;
        }
        .auth-header i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        .auth-header h4 {
            font-weight: 600;
            margin-bottom: 0.3rem;
        }
        .auth-header p {
            font-size: 0.9rem;
            opacity: 0.9;
        }


        .auth-body {
            padding: 1.8rem;
        }

        .input-group-text {
            background: #f8f9fa;
        }

        .btn-auth {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            padding: 10px;
            transition: all 0.3s ease;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            color: #fff;
        }

        a {
            text-decoration: none;
        }

        .input-group .toggle-password {
            cursor: pointer;
            user-select: none;
        }

        .toggle-password:hover {
            color: #0d6efd;
        }
    </style>
</head>

<body>
<div class="auth-card">
    <div class="auth-header">
        <i class="fas fa-heartbeat"></i>
        <h4>Clinique Privée</h4>
        <p>Connectez-vous à votre compte</p>
    </div>

    <div class="auth-body">
        <form method="post" action="${pageContext.request.contextPath}/auth/login">
            <div class="mb-3">
                <label for="email" class="form-label fw-semibold">Email</label>
                <div class="input-group">
                        <span class="input-group-text border-end-0">
                            <i class="fas fa-envelope text-primary"></i>
                        </span>
                    <input type="email" name="email" id="email" class="form-control border-start-0" placeholder="exemple@email.com" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label fw-semibold">Mot de passe</label>
                <div class="input-group">
                        <span class="input-group-text border-end-0">
                            <i class="fas fa-lock text-primary"></i>
                        </span>
                    <input type="password" name="password" id="password" class="form-control border-start-0" placeholder="Votre mot de passe" required>
                    <span class="input-group-text bg-light border-start-0 toggle-password">
                            <i class="fas fa-eye" id="togglePasswordIcon"></i>
                        </span>
                </div>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" name="remember" class="form-check-input" id="remember">
                <label class="form-check-label" for="remember">Se souvenir de moi</label>
            </div>

            <button type="submit" class="btn btn-auth w-100 mb-3">Se connecter</button>

            <hr>

            <div class="text-center">
                <p class="mb-2">
                    Nouveau patient ?
                    <a href="${pageContext.request.contextPath}/auth/register.jsp" class="fw-semibold text-primary">Créer un compte</a>
                </p>
                <a href="${pageContext.request.contextPath}/index.jsp" class="text-muted small">
                    <i class="fas fa-home me-1"></i>Retour à l'accueil
                </a>
            </div>
        </form>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

    const passwordInput = document.getElementById('password');
    const toggleIcon = document.getElementById('togglePasswordIcon');

    document.querySelector('.toggle-password').addEventListener('click', () => {
        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';
        toggleIcon.classList.toggle('fa-eye');
        toggleIcon.classList.toggle('fa-eye-slash');
    });
</script>
</body>
</html>
