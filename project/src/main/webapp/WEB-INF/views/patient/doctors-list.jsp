<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Liste des Docteurs"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="doctors-list"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Nos Docteurs Spécialistes</h1>
                <div class="text-muted">Trouvez le spécialiste qu'il vous faut</div>
            </div>

            <!-- Filtres -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" class="form-control" placeholder="Rechercher un docteur...">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <select class="form-select">
                                <option value="">Tous les départements</option>
                                <option value="cardio">Cardiologie</option>
                                <option value="dermato">Dermatologie</option>
                                <option value="pediatrie">Pédiatrie</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select class="form-select">
                                <option value="">Trier par</option>
                                <option value="name">Nom</option>
                                <option value="specialty">Spécialité</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Liste des docteurs -->
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card doctor-card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="doctor-avatar bg-primary text-white rounded-circle mx-auto mb-3">
                                SM
                            </div>
                            <h5 class="card-title fw-bold">Dr. Sophie Martin</h5>
                            <p class="card-text text-primary mb-2">Cardiologie</p>
                            <p class="card-text text-muted small">
                                Spécialiste en cardiologie interventionnelle avec 15 ans d'expérience.
                            </p>

                            <div class="doctor-info mb-3">
                                <div class="row text-center">
                                    <div class="col-6">
                                        <small class="text-muted">Expérience</small>
                                        <div class="fw-bold">15 ans</div>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-muted">Patients</small>
                                        <div class="fw-bold">1,200+</div>
                                    </div>
                                </div>
                            </div>

                            <div class="availability mb-3">
                                <small class="text-muted d-block mb-1">
                                    <i class="fas fa-calendar me-1"></i>Disponibilité
                                </small>
                                <span class="badge bg-success">Lun - Ven</span>
                            </div>

                            <div class="doctor-actions">
                                <a href="book-appointment.jsp" class="btn btn-primary btn-sm me-2">
                                    <i class="fas fa-calendar-plus me-1"></i>Prendre RDV
                                </a>
                                <button class="btn btn-outline-primary btn-sm">
                                    <i class="fas fa-info me-1"></i>Détails
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card doctor-card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="doctor-avatar bg-success text-white rounded-circle mx-auto mb-3">
                                PD
                            </div>
                            <h5 class="card-title fw-bold">Dr. Pierre Dubois</h5>
                            <p class="card-text text-success mb-2">Dermatologie</p>
                            <p class="card-text text-muted small">
                                Expert en dermatologie esthétique et traitement des maladies de la peau.
                            </p>

                            <div class="doctor-info mb-3">
                                <div class="row text-center">
                                    <div class="col-6">
                                        <small class="text-muted">Expérience</small>
                                        <div class="fw-bold">12 ans</div>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-muted">Patients</small>
                                        <div class="fw-bold">800+</div>
                                    </div>
                                </div>
                            </div>

                            <div class="availability mb-3">
                                <small class="text-muted d-block mb-1">
                                    <i class="fas fa-calendar me-1"></i>Disponibilité
                                </small>
                                <span class="badge bg-success">Mar - Sam</span>
                            </div>

                            <div class="doctor-actions">
                                <a href="book-appointment.jsp" class="btn btn-primary btn-sm me-2">
                                    <i class="fas fa-calendar-plus me-1"></i>Prendre RDV
                                </a>
                                <button class="btn btn-outline-primary btn-sm">
                                    <i class="fas fa-info me-1"></i>Détails
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card doctor-card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="doctor-avatar bg-warning text-white rounded-circle mx-auto mb-3">
                                ML
                            </div>
                            <h5 class="card-title fw-bold">Dr. Marie Laurent</h5>
                            <p class="card-text text-warning mb-2">Pédiatrie</p>
                            <p class="card-text text-muted small">
                                Pédiatre dévouée avec une approche douce pour les jeunes patients.
                            </p>

                            <div class="doctor-info mb-3">
                                <div class="row text-center">
                                    <div class="col-6">
                                        <small class="text-muted">Expérience</small>
                                        <div class="fw-bold">10 ans</div>
                                    </div>
                                    <div class="col-6">
                                        <small class="text-muted">Patients</small>
                                        <div class="fw-bold">1,500+</div>
                                    </div>
                                </div>
                            </div>

                            <div class="availability mb-3">
                                <small class="text-muted d-block mb-1">
                                    <i class="fas fa-calendar me-1"></i>Disponibilité
                                </small>
                                <span class="badge bg-success">Lun - Jeu</span>
                            </div>

                            <div class="doctor-actions">
                                <a href="book-appointment.jsp" class="btn btn-primary btn-sm me-2">
                                    <i class="fas fa-calendar-plus me-1"></i>Prendre RDV
                                </a>
                                <button class="btn btn-outline-primary btn-sm">
                                    <i class="fas fa-info me-1"></i>Détails
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<style>
    .doctor-avatar {
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        font-weight: bold;
    }
    .doctor-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .doctor-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15) !important;
    }
</style>

<jsp:include page="../common/footer.jsp"/>