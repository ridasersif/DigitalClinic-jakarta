<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Tableau de bord Patient"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="dashboard"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Tableau de bord Patient</h1>
                <a href="book-appointment.jsp" class="btn btn-primary">
                    <i class="fas fa-calendar-plus me-2"></i>Nouveau RDV
                </a>
            </div>

            <!-- Cartes statistiques -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Prochain RDV
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">15 Oct</div>
                                    <div class="text-xs text-muted">Dr. Martin - Cardiologie</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar-check fa-2x text-gray-300"></i>
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
                                        Consultations
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">12</div>
                                    <div class="text-xs text-muted">Total effectuées</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-stethoscope fa-2x text-gray-300"></i>
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
                                        RDV à venir
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">2</div>
                                    <div class="text-xs text-muted">Prochains rendez-vous</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clock fa-2x text-gray-300"></i>
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
                                        Départements
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">3</div>
                                    <div class="text-xs text-muted">Consultés</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-building fa-2x text-gray-300"></i>
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
                            <h6 class="m-0 font-weight-bold text-primary">Actions rapides</h6>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <a href="book-appointment.jsp" class="btn btn-outline-primary w-100 h-100 py-3 text-center">
                                        <i class="fas fa-calendar-plus fa-2x mb-2 d-block"></i>
                                        Prendre RDV
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="my-appointments.jsp" class="btn btn-outline-success w-100 h-100 py-3 text-center">
                                        <i class="fas fa-list-alt fa-2x mb-2 d-block"></i>
                                        Mes RDV
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="doctors-list.jsp" class="btn btn-outline-warning w-100 h-100 py-3 text-center">
                                        <i class="fas fa-user-md fa-2x mb-2 d-block"></i>
                                        Docteurs
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <a href="history.jsp" class="btn btn-outline-info w-100 h-100 py-3 text-center">
                                        <i class="fas fa-history fa-2x mb-2 d-block"></i>
                                        Historique
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Prochains rendez-vous</h6>
                        </div>
                        <div class="card-body p-0">
                            <div class="list-group list-group-flush">
                                <div class="list-group-item">
                                    <div class="d-flex w-100 justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">Dr. Sophie Martin</h6>
                                            <p class="mb-1 text-muted">Cardiologie - Consultation de routine</p>
                                            <small class="text-muted"><i class="fas fa-map-marker-alt me-1"></i>Salle 201</small>
                                        </div>
                                        <div class="text-end">
                                            <span class="badge bg-warning mb-2">Réservée</span>
                                            <div class="text-primary fw-bold">15 Oct 2025</div>
                                            <small class="text-muted">10:30 - 11:00</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="d-flex w-100 justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">Dr. Pierre Dubois</h6>
                                            <p class="mb-1 text-muted">Dermatologie - Examen cutané</p>
                                            <small class="text-muted"><i class="fas fa-map-marker-alt me-1"></i>Salle 102</small>
                                        </div>
                                        <div class="text-end">
                                            <span class="badge bg-success mb-2">Validée</span>
                                            <div class="text-primary fw-bold">22 Oct 2025</div>
                                            <small class="text-muted">14:15 - 14:45</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>