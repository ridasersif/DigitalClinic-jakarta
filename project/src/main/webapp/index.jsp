<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value="Accueil - Clinique Privée"/>
</jsp:include>
<jsp:include page="WEB-INF/views/common/navbar.jsp"/>

<!-- Hero Section Moderne -->
<section class="hero-section position-relative overflow-hidden">
    <div class="container">
        <div class="row align-items-center min-vh-80 py-5">
            <div class="col-lg-6">
                <div class="hero-content">
                    <span class="badge bg-primary-soft text-primary mb-3">🏥 Excellence Médicale</span>
                    <h1 class="display-4 fw-bold text-dark mb-4">Votre santé, <span class="text-primary">notre engagement</span></h1>
                    <p class="lead text-muted mb-4">
                        Découvrez une expérience médicale exceptionnelle avec nos spécialistes.
                        Prenez rendez-vous en ligne et bénéficiez de soins personnalisés dans un environnement moderne.
                    </p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="auth/register.jsp" class="btn btn-primary btn-lg px-4 py-3">
                            <i class="fas fa-calendar-plus me-2"></i>Prendre Rendez-vous
                        </a>
                        <a href="patient/doctors-list.jsp" class="btn btn-outline-primary btn-lg px-4 py-3">
                            <i class="fas fa-user-md me-2"></i>Nos Spécialistes
                        </a>
                    </div>
                    <div class="mt-4 d-flex gap-4 text-muted">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-shield-alt text-success me-2"></i>
                            <small>100% Sécurisé</small>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-clock text-primary me-2"></i>
                            <small>Réservation 24h/24</small>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-star text-warning me-2"></i>
                            <small>98% de satisfaction</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hero-visual position-relative">
                    <div class="floating-card card-1">
                        <i class="fas fa-stethoscope fa-2x text-primary"></i>
                        <span>Consultation</span>
                    </div>
                    <div class="floating-card card-2">
                        <i class="fas fa-heartbeat fa-2x text-danger"></i>
                        <span>Cardiologie</span>
                    </div>
                    <div class="floating-card card-3">
                        <i class="fas fa-brain fa-2x text-info"></i>
                        <span>Neurologie</span>
                    </div>
                    <div class="main-hero-card bg-gradient-primary text-white rounded-4 shadow-lg">
                        <div class="p-5 text-center">
                            <i class="fas fa-heartbeat fa-4x mb-4"></i>
                            <h4 class="fw-bold mb-2">Clinique d'Excellence</h4>
                            <p class="mb-0 opacity-75">Soins spécialisés de haute qualité</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="hero-shape"></div>
</section>

<!-- Statistiques Modernes -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3">
                <div class="stat-card text-center p-4 rounded-3 border-0 bg-white shadow-sm-hover">
                    <div class="stat-icon bg-primary-soft text-primary rounded-circle mx-auto mb-3">
                        <i class="fas fa-users fa-2x"></i>
                    </div>
                    <h3 class="fw-bold text-dark display-6">1,248+</h3>
                    <p class="text-muted mb-0">Patients satisfaits</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card text-center p-4 rounded-3 border-0 bg-white shadow-sm-hover">
                    <div class="stat-icon bg-success-soft text-success rounded-circle mx-auto mb-3">
                        <i class="fas fa-user-md fa-2x"></i>
                    </div>
                    <h3 class="fw-bold text-dark display-6">18</h3>
                    <p class="text-muted mb-0">Médecins experts</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card text-center p-4 rounded-3 border-0 bg-white shadow-sm-hover">
                    <div class="stat-icon bg-warning-soft text-warning rounded-circle mx-auto mb-3">
                        <i class="fas fa-stethoscope fa-2x"></i>
                    </div>
                    <h3 class="fw-bold text-dark display-6">4</h3>
                    <p class="text-muted mb-0">Départements</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card text-center p-4 rounded-3 border-0 bg-white shadow-sm-hover">
                    <div class="stat-icon bg-info-soft text-info rounded-circle mx-auto mb-3">
                        <i class="fas fa-award fa-2x"></i>
                    </div>
                    <h3 class="fw-bold text-dark display-6">98%</h3>
                    <p class="text-muted mb-0">Satisfaction</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Services Professionnels -->
<section class="py-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <span class="badge bg-primary-soft text-primary mb-2">Nos Services</span>
                <h2 class="fw-bold text-dark mb-3">Soins Spécialisés de Qualité</h2>
                <p class="lead text-muted">Des solutions médicales complètes adaptées à vos besoins</p>
            </div>
        </div>
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="service-card card border-0 shadow-sm-hover h-100">
                    <div class="card-body p-4 text-center">
                        <div class="service-icon bg-primary text-white rounded-3 mx-auto mb-4">
                            <i class="fas fa-heartbeat fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold text-dark">Cardiologie</h5>
                        <p class="card-text text-muted small">Soins cardiaques spécialisés avec technologies de pointe pour votre santé cardiovasculaire.</p>
                        <a href="#" class="btn btn-link text-primary text-decoration-none p-0">
                            En savoir plus <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card card border-0 shadow-sm-hover h-100">
                    <div class="card-body p-4 text-center">
                        <div class="service-icon bg-success text-white rounded-3 mx-auto mb-4">
                            <i class="fas fa-allergies fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold text-dark">Dermatologie</h5>
                        <p class="card-text text-muted small">Diagnostic et traitement des affections cutanées avec approche personnalisée.</p>
                        <a href="#" class="btn btn-link text-success text-decoration-none p-0">
                            En savoir plus <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card card border-0 shadow-sm-hover h-100">
                    <div class="card-body p-4 text-center">
                        <div class="service-icon bg-warning text-white rounded-3 mx-auto mb-4">
                            <i class="fas fa-baby fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold text-dark">Pédiatrie</h5>
                        <p class="card-text text-muted small">Soins complets dédiés à la santé et au développement des enfants et adolescents.</p>
                        <a href="#" class="btn btn-link text-warning text-decoration-none p-0">
                            En savoir plus <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="service-card card border-0 shadow-sm-hover h-100">
                    <div class="card-body p-4 text-center">
                        <div class="service-icon bg-info text-white rounded-3 mx-auto mb-4">
                            <i class="fas fa-brain fa-2x"></i>
                        </div>
                        <h5 class="card-title fw-bold text-dark">Neurologie</h5>
                        <p class="card-text text-muted small">Expertise avancée dans le diagnostic et traitement des troubles neurologiques.</p>
                        <a href="#" class="btn btn-link text-info text-decoration-none p-0">
                            En savoir plus <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section Moderne -->
<section class="py-5 bg-gradient-primary text-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8">
                <h3 class="fw-bold mb-3 display-5">Prêt à prendre soin de votre santé ?</h3>
                <p class="mb-0 lead opacity-75">Rejoignez notre communauté de patients satisfaits et bénéficiez de soins d'excellence.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <a href="auth/register.jsp" class="btn btn-light btn-lg px-4 py-3 fw-bold">
                    <i class="fas fa-calendar-plus me-2"></i>Commencer Maintenant
                </a>
            </div>
        </div>
    </div>
</section>

<style>
    :root {
        --primary: #2563eb;
        --primary-dark: #1e40af;
        --primary-soft: #dbeafe;
        --success: #059669;
        --success-soft: #d1fae5;
        --warning: #d97706;
        --warning-soft: #fef3c7;
        --info: #0891b2;
        --info-soft: #cffafe;
    }

    .min-vh-80 {
        min-height: 80vh;
    }

    .hero-section {
        background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
        position: relative;
    }

    .hero-shape {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 100px;
        background: linear-gradient(180deg, transparent 0%, #ffffff 100%);
    }

    .bg-gradient-primary {
        background: linear-gradient(135deg, var(--primary), var(--primary-dark));
    }

    .hero-visual {
        position: relative;
        height: 500px;
    }

    .main-hero-card {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 300px;
        height: 300px;
        z-index: 2;
    }

    .floating-card {
        position: absolute;
        background: white;
        padding: 1rem;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        font-weight: 500;
        z-index: 3;
        animation: float 3s ease-in-out infinite;
    }

    .card-1 {
        top: 20%;
        left: 10%;
        animation-delay: 0s;
    }

    .card-2 {
        top: 10%;
        right: 15%;
        animation-delay: 1s;
    }

    .card-3 {
        bottom: 20%;
        right: 5%;
        animation-delay: 2s;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(-10px); }
    }

    .service-icon {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .stat-icon {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .shadow-sm-hover {
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    .shadow-sm-hover:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    }

    .service-card, .stat-card {
        transition: all 0.3s ease;
    }

    .bg-primary-soft { background-color: var(--primary-soft); }
    .bg-success-soft { background-color: var(--success-soft); }
    .bg-warning-soft { background-color: var(--warning-soft); }
    .bg-info-soft { background-color: var(--info-soft); }
</style>

<jsp:include page="WEB-INF/views/common/footer.jsp"/>