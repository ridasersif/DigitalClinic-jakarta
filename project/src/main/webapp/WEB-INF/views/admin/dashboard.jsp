<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Tableau de bord Admin"/>
</jsp:include>

<!-- Container principal avec margin pour la sidebar fixe -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar fixe -->
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="dashboard"/>
        </jsp:include>

        <!-- Contenu principal avec offset pour la sidebar -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px);">

            <!-- En-tête de Page -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-4 border-bottom">
                <div>
                    <h1 class="h3 fw-bold text-dark mb-1">Tableau de Bord Administration</h1>
                    <p class="text-muted mb-0">Aperçu général de votre clinique médicale</p>
                </div>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-primary rounded-3">Aujourd'hui</button>
                        <button type="button" class="btn btn-sm btn-outline-primary rounded-3">Cette semaine</button>
                        <button type="button" class="btn btn-sm btn-primary rounded-3">Ce mois</button>
                    </div>
                </div>
            </div>

            <!-- Cartes de Statistiques -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-primary-soft text-primary rounded-3 p-3">
                                        <i class="fas fa-users fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Patients Total</h5>
                                    <h3 class="fw-bold text-dark mb-0">1,248</h3>
                                    <small class="text-success">
                                        <i class="fas fa-arrow-up me-1"></i>12% ce mois
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-success-soft text-success rounded-3 p-3">
                                        <i class="fas fa-user-md fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Docteurs Actifs</h5>
                                    <h3 class="fw-bold text-dark mb-0">18</h3>
                                    <small class="text-success">
                                        <i class="fas fa-check-circle me-1"></i>Tous disponibles
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-warning-soft text-warning rounded-3 p-3">
                                        <i class="fas fa-stethoscope fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Consultations/Mois</h5>
                                    <h3 class="fw-bold text-dark mb-0">156</h3>
                                    <small class="text-success">
                                        <i class="fas fa-arrow-up me-1"></i>8% vs mois dernier
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-info-soft text-info rounded-3 p-3">
                                        <i class="fas fa-percentage fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Taux Occupation</h5>
                                    <h3 class="fw-bold text-dark mb-0">78%</h3>
                                    <small class="text-success">
                                        <i class="fas fa-chart-line me-1"></i>Performance optimale
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Deuxième ligne de cartes -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-danger-soft text-danger rounded-3 p-3">
                                        <i class="fas fa-clock fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">En Attente</h5>
                                    <h3 class="fw-bold text-dark mb-0">12</h3>
                                    <small class="text-muted">Patients en salle d'attente</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-purple-soft text-purple rounded-3 p-3">
                                        <i class="fas fa-door-open fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Salles Libres</h5>
                                    <h3 class="fw-bold text-dark mb-0">8</h3>
                                    <small class="text-success">Disponibles immédiatement</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-orange-soft text-orange rounded-3 p-3">
                                        <i class="fas fa-calendar-day fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">RDV Aujourd'hui</h5>
                                    <h3 class="fw-bold text-dark mb-0">24</h3>
                                    <small class="text-info">Dont 3 urgences</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-teal-soft text-teal rounded-3 p-3">
                                        <i class="fas fa-star fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Satisfaction</h5>
                                    <h3 class="fw-bold text-dark mb-0">4.8/5</h3>
                                    <small class="text-warning">
                                        <i class="fas fa-star me-1"></i>Excellent
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Activité Récente -->
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3 border-bottom">
                            <h5 class="card-title mb-0 fw-semibold text-dark">
                                <i class="fas fa-list me-2 text-primary"></i> Activité Récente
                            </h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="list-group list-group-flush">
                                <div class="list-group-item d-flex justify-content-between align-items-center py-3 hover-item">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success-soft text-success rounded-2 p-2 me-3">
                                            <i class="fas fa-calendar-plus"></i>
                                        </div>
                                        <div>
                                            <h6 class="fw-semibold text-dark mb-0">Nouvelle réservation</h6>
                                            <small class="text-muted">Luc Moreau - Cardiologie</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <small class="text-muted d-block">Il y a 5 min</small>
                                        <span class="badge bg-success rounded-pill">Nouveau</span>
                                    </div>
                                </div>

                                <div class="list-group-item d-flex justify-content-between align-items-center py-3 hover-item">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary-soft text-primary rounded-2 p-2 me-3">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <div>
                                            <h6 class="fw-semibold text-dark mb-0">Consultation terminée</h6>
                                            <small class="text-muted">Dr. Martin - Consultation générale</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <small class="text-muted d-block">Il y a 15 min</small>
                                        <span class="badge bg-primary rounded-pill">Terminé</span>
                                    </div>
                                </div>

                                <div class="list-group-item d-flex justify-content-between align-items-center py-3 hover-item">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-info-soft text-info rounded-2 p-2 me-3">
                                            <i class="fas fa-user-plus"></i>
                                        </div>
                                        <div>
                                            <h6 class="fw-semibold text-dark mb-0">Nouveau patient</h6>
                                            <small class="text-muted">Paul Bernard - Première visite</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <small class="text-muted d-block">Il y a 1 heure</small>
                                        <span class="badge bg-info rounded-pill">Inscription</span>
                                    </div>
                                </div>

                                <div class="list-group-item d-flex justify-content-between align-items-center py-3 hover-item">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-warning-soft text-warning rounded-2 p-2 me-3">
                                            <i class="fas fa-exclamation-triangle"></i>
                                        </div>
                                        <div>
                                            <h6 class="fw-semibold text-dark mb-0">Rendez-vous annulé</h6>
                                            <small class="text-muted">Marie Dubois - Dermatologie</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <small class="text-muted d-block">Il y a 2 heures</small>
                                        <span class="badge bg-warning rounded-pill">Annulé</span>
                                    </div>
                                </div>

                                <div class="list-group-item d-flex justify-content-between align-items-center py-3 hover-item">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-purple-soft text-purple rounded-2 p-2 me-3">
                                            <i class="fas fa-file-medical"></i>
                                        </div>
                                        <div>
                                            <h6 class="fw-semibold text-dark mb-0">Nouveau diagnostic</h6>
                                            <small class="text-muted">Dr. Lefebvre - Orthopédie</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <small class="text-muted d-block">Il y a 3 heures</small>
                                        <span class="badge bg-purple rounded-pill">Médical</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Occupation des Salles -->
                <div class="col-lg-4">
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3 border-bottom">
                            <h5 class="card-title mb-0 fw-semibold text-dark">
                                <i class="fas fa-door-open me-2 text-primary"></i> Occupation des Salles
                            </h5>
                        </div>
                        <div class="card-body">
                            <!-- Salle 1 -->
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary-soft text-primary rounded-2 p-2 me-2">
                                            <i class="fas fa-door-closed"></i>
                                        </div>
                                        <span class="fw-semibold text-dark">Salle 101 - Cardiologie</span>
                                    </div>
                                    <span class="fw-bold text-dark">85%</span>
                                </div>
                                <div class="progress" style="height: 8px;">
                                    <div class="progress-bar bg-success" style="width: 85%" role="progressbar"></div>
                                </div>
                                <small class="text-muted">Dr. Martin - 3 patients en attente</small>
                            </div>

                            <!-- Salle 2 -->
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-warning-soft text-warning rounded-2 p-2 me-2">
                                            <i class="fas fa-door-closed"></i>
                                        </div>
                                        <span class="fw-semibold text-dark">Salle 102 - Pédiatrie</span>
                                    </div>
                                    <span class="fw-bold text-dark">60%</span>
                                </div>
                                <div class="progress" style="height: 8px;">
                                    <div class="progress-bar bg-warning" style="width: 60%" role="progressbar"></div>
                                </div>
                                <small class="text-muted">Dr. Lambert - 1 patient en attente</small>
                            </div>

                            <!-- Salle 3 -->
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success-soft text-success rounded-2 p-2 me-2">
                                            <i class="fas fa-door-closed"></i>
                                        </div>
                                        <span class="fw-semibold text-dark">Salle 201 - Orthopédie</span>
                                    </div>
                                    <span class="fw-bold text-dark">90%</span>
                                </div>
                                <div class="progress" style="height: 8px;">
                                    <div class="progress-bar bg-success" style="width: 90%" role="progressbar"></div>
                                </div>
                                <small class="text-muted">Dr. Lefebvre - 4 patients en attente</small>
                            </div>

                            <!-- Salle 4 -->
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-info-soft text-info rounded-2 p-2 me-2">
                                            <i class="fas fa-door-open"></i>
                                        </div>
                                        <span class="fw-semibold text-dark">Salle 202 - Dermatologie</span>
                                    </div>
                                    <span class="fw-bold text-dark">40%</span>
                                </div>
                                <div class="progress" style="height: 8px;">
                                    <div class="progress-bar bg-info" style="width: 40%" role="progressbar"></div>
                                </div>
                                <small class="text-muted">Dr. Moreau - Disponible</small>
                            </div>

                            <!-- Légende -->
                            <div class="mt-4 p-3 bg-light rounded-3">
                                <h6 class="fw-semibold text-dark mb-2">Légende</h6>
                                <div class="d-flex align-items-center mb-1">
                                    <div class="bg-success me-2" style="width: 12px; height: 12px; border-radius: 2px;"></div>
                                    <small class="text-muted">Élevée (75-100%)</small>
                                </div>
                                <div class="d-flex align-items-center mb-1">
                                    <div class="bg-warning me-2" style="width: 12px; height: 12px; border-radius: 2px;"></div>
                                    <small class="text-muted">Moyenne (50-74%)</small>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="bg-info me-2" style="width: 12px; height: 12px; border-radius: 2px;"></div>
                                    <small class="text-muted">Faible (0-49%)</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<style>
    .shadow-sm-hover {
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }
    .shadow-sm-hover:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    }
    .hover-item {
        transition: all 0.3s ease;
    }
    .hover-item:hover {
        background-color: #f8fafc;
        transform: translateX(2px);
    }
    .bg-primary-soft {
        background-color: #dbeafe;
    }
    .bg-success-soft {
        background-color: #d1fae5;
    }
    .bg-warning-soft {
        background-color: #fef3c7;
    }
    .bg-info-soft {
        background-color: #d1f5f3;
    }
    .bg-danger-soft {
        background-color: #fee2e2;
    }
    .bg-purple-soft {
        background-color: #e9d5ff;
    }
    .bg-orange-soft {
        background-color: #fed7aa;
    }
    .bg-teal-soft {
        background-color: #99f6e4;
    }
    .text-purple {
        color: #8b5cf6;
    }
    .text-orange {
        color: #f97316;
    }
    .text-teal {
        color: #14b8a6;
    }
    .bg-purple {
        background-color: #8b5cf6 !important;
    }

    /* Correction du layout */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }
    .container-fluid {
        padding-left: 0 !important;
        padding-right: 0 !important;
    }

    /* MARGIN AJOUTÉE ENTRE SIDEBAR ET CONTENU */
    main {
        width: calc(100% - 300px);
        margin-left: 300px;
        padding-left: 20px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        main {
            width: 100%;
            margin-left: 0;
            padding-left: 15px;
        }
        .sidebar {
            transform: translateX(-100%);
        }
        .sidebar.show {
            transform: translateX(0);
        }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>