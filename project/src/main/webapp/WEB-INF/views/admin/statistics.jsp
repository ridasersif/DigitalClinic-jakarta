<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Statistiques"/>
</jsp:include>

<!-- Container principal avec margin pour la sidebar fixe -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar fixe -->
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="statistics"/>
        </jsp:include>

        <!-- Contenu principal avec offset pour la sidebar -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px);">

            <!-- En-tête de Page -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-4 border-bottom">
                <div>
                    <h1 class="h3 fw-bold text-dark mb-1">Statistiques de la Clinique</h1>
                    <p class="text-muted mb-0">Analyse détaillée des performances médicales</p>
                </div>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <select class="form-select form-select-sm rounded-3">
                        <option>Ce mois</option>
                        <option>Ce trimestre</option>
                        <option selected>Cette année</option>
                    </select>
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
                                        <i class="fas fa-arrow-up me-1"></i>12% vs année dernière
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
                                        <i class="fas fa-stethoscope fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Consultations/Mois</h5>
                                    <h3 class="fw-bold text-dark mb-0">156</h3>
                                    <small class="text-success">
                                        <i class="fas fa-arrow-up me-1"></i>8% croissance
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
                                        <i class="fas fa-percentage fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Taux de Remplissage</h5>
                                    <h3 class="fw-bold text-dark mb-0">78%</h3>
                                    <small class="text-success">
                                        <i class="fas fa-chart-line me-1"></i>Performance optimale
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
                                        <i class="fas fa-euro-sign fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Revenus/Mois</h5>
                                    <h3 class="fw-bold text-dark mb-0">€45,600</h3>
                                    <small class="text-success">
                                        <i class="fas fa-arrow-up me-1"></i>15% augmentation
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Deuxième ligne de statistiques -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-purple-soft text-purple rounded-3 p-3">
                                        <i class="fas fa-user-md fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Docteurs Actifs</h5>
                                    <h3 class="fw-bold text-dark mb-0">18</h3>
                                    <small class="text-success">
                                        <i class="fas fa-check-circle me-1"></i>Tous spécialisés
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
                                    <div class="bg-orange-soft text-orange rounded-3 p-3">
                                        <i class="fas fa-door-open fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Salles Opérationnelles</h5>
                                    <h3 class="fw-bold text-dark mb-0">12</h3>
                                    <small class="text-info">8 spécialités couvertes</small>
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
                                    <h5 class="card-title text-muted mb-1">Satisfaction Patients</h5>
                                    <h3 class="fw-bold text-dark mb-0">4.8/5</h3>
                                    <small class="text-warning">
                                        <i class="fas fa-star me-1"></i>Excellent
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
                                    <div class="bg-danger-soft text-danger rounded-3 p-3">
                                        <i class="fas fa-clock fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Temps d'Attente Moyen</h5>
                                    <h3 class="fw-bold text-dark mb-0">18min</h3>
                                    <small class="text-success">
                                        <i class="fas fa-arrow-down me-1"></i>5min de moins
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Graphique des consultations par département -->
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3 border-bottom">
                            <h5 class="card-title mb-0 fw-semibold text-dark">
                                <i class="fas fa-chart-bar me-2 text-primary"></i> Consultations par Département
                            </h5>
                        </div>
                        <div class="card-body">
                            <!-- Graphique à barres simulé -->
                            <div class="chart-container py-4">
                                <div class="d-flex align-items-end justify-content-between h-100 gap-3">
                                    <div class="d-flex flex-column align-items-center flex-grow-1">
                                        <div class="bg-primary mb-2 rounded-top position-relative" style="width: 100%; height: 120px;">
                                            <div class="position-absolute top-0 start-50 translate-middle-x mt-1">
                                                <strong class="text-white">85</strong>
                                            </div>
                                        </div>
                                        <small class="fw-semibold text-dark">Cardiologie</small>
                                        <small class="text-muted">Dr. Martin</small>
                                    </div>
                                    <div class="d-flex flex-column align-items-center flex-grow-1">
                                        <div class="bg-success mb-2 rounded-top position-relative" style="width: 100%; height: 90px;">
                                            <div class="position-absolute top-0 start-50 translate-middle-x mt-1">
                                                <strong class="text-white">62</strong>
                                            </div>
                                        </div>
                                        <small class="fw-semibold text-dark">Dermatologie</small>
                                        <small class="text-muted">Dr. Moreau</small>
                                    </div>
                                    <div class="d-flex flex-column align-items-center flex-grow-1">
                                        <div class="bg-warning mb-2 rounded-top position-relative" style="width: 100%; height: 70px;">
                                            <div class="position-absolute top-0 start-50 translate-middle-x mt-1">
                                                <strong class="text-white">45</strong>
                                            </div>
                                        </div>
                                        <small class="fw-semibold text-dark">Pédiatrie</small>
                                        <small class="text-muted">Dr. Lambert</small>
                                    </div>
                                    <div class="d-flex flex-column align-items-center flex-grow-1">
                                        <div class="bg-info mb-2 rounded-top position-relative" style="width: 100%; height: 50px;">
                                            <div class="position-absolute top-0 start-50 translate-middle-x mt-1">
                                                <strong class="text-white">38</strong>
                                            </div>
                                        </div>
                                        <small class="fw-semibold text-dark">Neurologie</small>
                                        <small class="text-muted">Dr. Petit</small>
                                    </div>
                                    <div class="d-flex flex-column align-items-center flex-grow-1">
                                        <div class="bg-purple mb-2 rounded-top position-relative" style="width: 100%; height: 80px;">
                                            <div class="position-absolute top-0 start-50 translate-middle-x mt-1">
                                                <strong class="text-white">55</strong>
                                            </div>
                                        </div>
                                        <small class="fw-semibold text-dark">Orthopédie</small>
                                        <small class="text-muted">Dr. Lefebvre</small>
                                    </div>
                                </div>
                            </div>

                            <!-- Légende du graphique -->
                            <div class="mt-4 p-3 bg-light rounded-3">
                                <h6 class="fw-semibold text-dark mb-3">Performance par Département</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="bg-primary me-2" style="width: 16px; height: 16px; border-radius: 4px;"></div>
                                            <small class="text-muted">Cardiologie - Leader (85 consultations)</small>
                                        </div>
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="bg-success me-2" style="width: 16px; height: 16px; border-radius: 4px;"></div>
                                            <small class="text-muted">Dermatologie - Croissance rapide</small>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="bg-warning me-2" style="width: 16px; height: 16px; border-radius: 4px;"></div>
                                            <small class="text-muted">Pédiatrie - Stable</small>
                                        </div>
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="bg-purple me-2" style="width: 16px; height: 16px; border-radius: 4px;"></div>
                                            <small class="text-muted">Orthopédie - En progression</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Répartition des statuts -->
                <div class="col-lg-4">
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-white py-3 border-bottom">
                            <h5 class="card-title mb-0 fw-semibold text-dark">
                                <i class="fas fa-chart-pie me-2 text-primary"></i> Répartition des Statuts
                            </h5>
                        </div>
                        <div class="card-body text-center">
                            <!-- Cercle de progression simulé -->
                            <div class="position-relative mb-4">
                                <div class="bg-primary-soft text-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                     style="width: 140px; height: 140px;">
                                    <div>
                                        <strong class="h4 mb-0">156</strong><br>
                                        <small class="text-muted">Total RDV</small>
                                    </div>
                                </div>
                                <!-- Indicateurs autour du cercle -->
                                <div class="position-absolute top-0 start-0">
                                    <span class="badge bg-success rounded-pill">✓ 65%</span>
                                </div>
                                <div class="position-absolute top-0 end-0">
                                    <span class="badge bg-primary rounded-pill">✓ 20%</span>
                                </div>
                                <div class="position-absolute bottom-0 start-0">
                                    <span class="badge bg-warning rounded-pill">⏰ 10%</span>
                                </div>
                                <div class="position-absolute bottom-0 end-0">
                                    <span class="badge bg-danger rounded-pill">✗ 5%</span>
                                </div>
                            </div>

                            <!-- Légende détaillée -->
                            <div class="legend">
                                <div class="d-flex align-items-center justify-content-between mb-3 p-2 bg-success-soft rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success rounded me-3" style="width: 20px; height: 20px;"></div>
                                        <span class="fw-semibold">Terminées</span>
                                    </div>
                                    <div>
                                        <strong>101</strong>
                                        <small class="text-muted"> (65%)</small>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center justify-content-between mb-3 p-2 bg-primary-soft rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary rounded me-3" style="width: 20px; height: 20px;"></div>
                                        <span class="fw-semibold">Confirmées</span>
                                    </div>
                                    <div>
                                        <strong>31</strong>
                                        <small class="text-muted"> (20%)</small>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center justify-content-between mb-3 p-2 bg-warning-soft rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-warning rounded me-3" style="width: 20px; height: 20px;"></div>
                                        <span class="fw-semibold">Réservées</span>
                                    </div>
                                    <div>
                                        <strong>16</strong>
                                        <small class="text-muted"> (10%)</small>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center justify-content-between p-2 bg-danger-soft rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-danger rounded me-3" style="width: 20px; height: 20px;"></div>
                                        <span class="fw-semibold">Annulées</span>
                                    </div>
                                    <div>
                                        <strong>8</strong>
                                        <small class="text-muted"> (5%)</small>
                                    </div>
                                </div>
                            </div>

                            <!-- Résumé -->
                            <div class="mt-4 p-3 bg-light rounded-3">
                                <h6 class="fw-semibold text-dark mb-2">Performance Globale</h6>
                                <div class="d-flex justify-content-between">
                                    <small class="text-muted">Taux de réussite</small>
                                    <strong class="text-success">85%</strong>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <small class="text-muted">Taux d'annulation</small>
                                    <strong class="text-danger">5%</strong>
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