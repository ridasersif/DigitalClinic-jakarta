<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value="Accueil - Clinique Privée"/>
</jsp:include>
<jsp:include page="WEB-INF/views/common/navbar.jsp"/>

<!-- Hero Section -->
<section class="hero-section py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold text-dark mb-4">Votre santé, notre priorité</h1>
                <p class="lead text-muted mb-4">
                    Bienvenue à la Clinique Privée. Prenez rendez-vous en ligne avec nos spécialistes
                    et gérez facilement vos consultations médicales dans un environnement moderne et sécurisé.
                </p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="auth/register.jsp" class="btn btn-primary btn-lg px-4 py-2">
                        <i class="fas fa-user-plus me-2"></i>Créer un compte
                    </a>
                    <a href="patient/doctors-list.jsp" class="btn btn-outline-primary btn-lg px-4 py-2">
                        <i class="fas fa-user-md me-2"></i>Nos docteurs
                    </a>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <div class="hero-image">
                    <div class="bg-primary text-white rounded-3 p-5 shadow">
                        <i class="fas fa-heartbeat fa-6x mb-3"></i>
                        <h4>Clinique Privée</h4>
                        <p class="mb-0">Soins d'excellence</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Statistiques -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3 mb-4">
                <div class="stat-card p-4 rounded-3 shadow-sm border-0 bg-white">
                    <i class="fas fa-users fa-3x text-primary mb-3"></i>
                    <h3 class="fw-bold text-dark">1,248+</h3>
                    <p class="text-muted mb-0">Patients satisfaits</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card p-4 rounded-3 shadow-sm border-0 bg-white">
                    <i class="fas fa-user-md fa-3x text-success mb-3"></i>
                    <h3 class="fw-bold text-dark">18</h3>
                    <p class="text-muted mb-0">Médecins spécialistes</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card p-4 rounded-3 shadow-sm border-0 bg-white">
                    <i class="fas fa-stethoscope fa-3x text-warning mb-3"></i>
                    <h3 class="fw-bold text-dark">4</h3>
                    <p class="text-muted mb-0">Départements médicaux</p>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="stat-card p-4 rounded-3 shadow-sm border-0 bg-white">
                    <i class="fas fa-heart fa-3x text-danger mb-3"></i>
                    <h3 class="fw-bold text-dark">98%</h3>
                    <p class="text-muted mb-0">Taux de satisfaction</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Services -->
<section class="py-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="fw-bold text-dark mb-3">Nos Services Médicaux</h2>
                <p class="lead text-muted">Des soins de qualité dans un environnement moderne et accueillant</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card service-card h-100 border-0 shadow-sm hover-shadow">
                    <div class="card-body text-center p-4">
                        <div class="icon-wrapper bg-primary text-white rounded-circle mx-auto mb-3">
                            <i class="fas fa-heartbeat fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold">Cardiologie</h5>
                        <p class="card-text text-muted">Soins cardiaques spécialisés avec des équipements de pointe.</p>
                        <a href="#" class="btn btn-outline-primary btn-sm">En savoir plus</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card service-card h-100 border-0 shadow-sm hover-shadow">
                    <div class="card-body text-center p-4">
                        <div class="icon-wrapper bg-success text-white rounded-circle mx-auto mb-3">
                            <i class="fas fa-allergies fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold">Dermatologie</h5>
                        <p class="card-text text-muted">Traitements cutanés et consultations esthétiques.</p>
                        <a href="#" class="btn btn-outline-success btn-sm">En savoir plus</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card service-card h-100 border-0 shadow-sm hover-shadow">
                    <div class="card-body text-center p-4">
                        <div class="icon-wrapper bg-warning text-white rounded-circle mx-auto mb-3">
                            <i class="fas fa-baby fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold">Pédiatrie</h5>
                        <p class="card-text text-muted">Soins adaptés aux enfants et adolescents.</p>
                        <a href="#" class="btn btn-outline-warning btn-sm">En savoir plus</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="card service-card h-100 border-0 shadow-sm hover-shadow">
                    <div class="card-body text-center p-4">
                        <div class="icon-wrapper bg-info text-white rounded-circle mx-auto mb-3">
                            <i class="fas fa-brain fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold">Neurologie</h5>
                        <p class="card-text text-muted">Diagnostic et traitement des troubles neurologiques.</p>
                        <a href="#" class="btn btn-outline-info btn-sm">En savoir plus</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-5 bg-primary text-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8">
                <h3 class="fw-bold mb-3">Prêt à prendre rendez-vous ?</h3>
                <p class="mb-0">Rejoignez nos milliers de patients satisfaits et prenez le contrôle de votre santé dès aujourd'hui.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a href="auth/register.jsp" class="btn btn-light btn-lg px-4">
                    <i class="fas fa-calendar-plus me-2"></i>Prendre RDV
                </a>
            </div>
        </div>
    </div>
</section>

<style>
    .hero-section {
        background: linear-gradient(135deg, #f5f7fb 0%, #e4edf5 100%);
    }
    .icon-wrapper {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .hover-shadow {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .hover-shadow:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important;
    }
    .stat-card {
        transition: transform 0.3s ease;
    }
    .stat-card:hover {
        transform: translateY(-3px);
    }
</style>

<jsp:include page="WEB-INF/views/common/footer.jsp"/>