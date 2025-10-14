<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Tableau de bord Docteur"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="dashboard"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Tableau de bord Docteur</h1>
                <div class="text-muted">Dr. Sophie Martin - Cardiologie</div>
            </div>

            <!-- Statistiques -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        RDV Aujourd'hui
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">8</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar-day fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        En attente
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clock fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        Patients ce mois
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">45</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-users fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Disponibilité
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">85%</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-percentage fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Prochaines consultations</h6>
                        </div>
                        <div class="card-body">
                            <div class="list-group list-group-flush">
                                <div class="list-group-item">
                                    <div class="d-flex w-100 justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">Jean Dupont</h6>
                                            <p class="mb-1 text-muted">Consultation de routine</p>
                                            <small class="text-muted"><i class="fas fa-map-marker-alt me-1"></i>Salle 201</small>
                                        </div>
                                        <div class="text-end">
                                            <div class="text-primary fw-bold">10:00 - 10:30</div>
                                            <small class="text-muted">Dans 15 min</small>
                                        </div>
                                    </div>
                                    <div class="mt-2">
                                        <button class="btn btn-sm btn-outline-primary">Commencer</button>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="d-flex w-100 justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">Marie Curie</h6>
                                            <p class="mb-1 text-muted">Suivi traitement</p>
                                            <small class="text-muted"><i class="fas fa-map-marker-alt me-1"></i>Salle 201</small>
                                        </div>
                                        <div class="text-end">
                                            <div class="text-primary fw-bold">11:00 - 11:30</div>
                                            <small class="text-muted">Dans 1h15</small>
                                        </div>
                                    </div>
                                    <div class="mt-2">
                                        <button class="btn btn-sm btn-outline-secondary" disabled>À venir</button>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="d-flex w-100 justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">Pierre Martin</h6>
                                            <p class="mb-1 text-muted">Première consultation</p>
                                            <small class="text-muted"><i class="fas fa-map-marker-alt me-1"></i>Salle 202</small>
                                        </div>
                                        <div class="text-end">
                                            <div class="text-primary fw-bold">14:00 - 14:30</div>
                                            <small class="text-muted">Dans 4h</small>
                                        </div>
                                    </div>
                                    <div class="mt-2">
                                        <button class="btn btn-sm btn-outline-secondary" disabled>À venir</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Actions rapides</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-grid gap-2">
                                <a href="planning.jsp" class="btn btn-outline-primary text-start">
                                    <i class="fas fa-calendar-alt me-2"></i>Voir mon planning
                                </a>
                                <a href="appointments.jsp" class="btn btn-outline-success text-start">
                                    <i class="fas fa-list-alt me-2"></i>Gérer les rendez-vous
                                </a>
                                <a href="consultation.jsp" class="btn btn-outline-warning text-start">
                                    <i class="fas fa-stethoscope me-2"></i>Saisir une consultation
                                </a>
                                <a href="patient-history.jsp" class="btn btn-outline-info text-start">
                                    <i class="fas fa-history me-2"></i>Historique patients
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>