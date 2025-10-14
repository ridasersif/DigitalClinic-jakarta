<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Historique Médical"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="history"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Historique Médical</h1>
                <div class="text-muted">Vos consultations et diagnostics</div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-primary text-white">
                            <h6 class="mb-0">Informations médicales</h6>
                        </div>
                        <div class="card-body text-center">
                            <div class="mb-3">
                                <strong>Poids:</strong> 70 kg<br>
                                <strong>Taille:</strong> 175 cm<br>
                                <strong>IMC:</strong> 22.9
                            </div>
                            <button class="btn btn-sm btn-outline-primary">Mettre à jour</button>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="card shadow">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Historique des consultations</h5>
                        </div>
                        <div class="card-body">
                            <div class="timeline">
                                <div class="timeline-item">
                                    <div class="timeline-marker bg-success"></div>
                                    <div class="timeline-content">
                                        <div class="d-flex justify-content-between">
                                            <h6>Consultation - Cardiologie</h6>
                                            <small class="text-muted">01 Oct 2025</small>
                                        </div>
                                        <p class="mb-1"><strong>Docteur:</strong> Dr. Sophie Martin</p>
                                        <p class="mb-1"><strong>Motif:</strong> Consultation de routine</p>
                                        <p class="mb-1"><strong>Diagnostic:</strong> Rythme cardiaque normal, tension artérielle stable</p>
                                        <p class="mb-0"><strong>Traitement:</strong> Aucun traitement nécessaire, contrôle dans 6 mois</p>
                                    </div>
                                </div>

                                <div class="timeline-item">
                                    <div class="timeline-marker bg-primary"></div>
                                    <div class="timeline-content">
                                        <div class="d-flex justify-content-between">
                                            <h6>Vaccination - Pédiatrie</h6>
                                            <small class="text-muted">25 Sep 2025</small>
                                        </div>
                                        <p class="mb-1"><strong>Docteur:</strong> Dr. Marie Laurent</p>
                                        <p class="mb-1"><strong>Motif:</strong> Vaccination annuelle</p>
                                        <p class="mb-1"><strong>Vaccin:</strong> Grippe saisonnière</p>
                                        <p class="mb-0"><strong>Effets secondaires:</strong> Aucun</p>
                                    </div>
                                </div>

                                <div class="timeline-item">
                                    <div class="timeline-marker bg-info"></div>
                                    <div class="timeline-content">
                                        <div class="d-flex justify-content-between">
                                            <h6>Consultation - Dermatologie</h6>
                                            <small class="text-muted">15 Sep 2025</small>
                                        </div>
                                        <p class="mb-1"><strong>Docteur:</strong> Dr. Pierre Dubois</p>
                                        <p class="mb-1"><strong>Motif:</strong> Examen de la peau</p>
                                        <p class="mb-1"><strong>Diagnostic:</strong> Peau saine, recommandation protection solaire</p>
                                        <p class="mb-0"><strong>Recommandations:</strong> Crème hydratante quotidienne</p>
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

<style>
    .timeline {
        position: relative;
        padding-left: 30px;
    }
    .timeline-item {
        position: relative;
        margin-bottom: 30px;
    }
    .timeline-marker {
        position: absolute;
        left: -30px;
        top: 0;
        width: 20px;
        height: 20px;
        border-radius: 50%;
    }
    .timeline-content {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 5px;
        border-left: 3px solid #dee2e6;
    }
</style>

<jsp:include page="../common/footer.jsp"/>