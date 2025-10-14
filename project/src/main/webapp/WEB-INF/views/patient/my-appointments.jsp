<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Mes Rendez-vous"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="my-appointments"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Mes Rendez-vous</h1>
                <div class="text-muted">Gérez vos rendez-vous à venir</div>
            </div>

            <ul class="nav nav-tabs mb-4" id="appointmentTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="upcoming-tab" data-bs-toggle="tab" data-bs-target="#upcoming" type="button">
                        À venir (2)
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="past-tab" data-bs-toggle="tab" data-bs-target="#past" type="button">
                        Passés (12)
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab" data-bs-target="#cancelled" type="button">
                        Annulés (1)
                    </button>
                </li>
            </ul>

            <div class="tab-content" id="appointmentTabsContent">
                <!-- À venir -->
                <div class="tab-pane fade show active" id="upcoming" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Date et Heure</th>
                                        <th>Docteur</th>
                                        <th>Département</th>
                                        <th>Motif</th>
                                        <th>Statut</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>15 Oct 2025 - 10:30</td>
                                        <td>Dr. Sophie Martin</td>
                                        <td>Cardiologie</td>
                                        <td>Consultation de routine</td>
                                        <td><span class="badge bg-warning">Réservée</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">Modifier</button>
                                            <button class="btn btn-sm btn-outline-danger">Annuler</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>22 Oct 2025 - 14:15</td>
                                        <td>Dr. Pierre Dubois</td>
                                        <td>Dermatologie</td>
                                        <td>Examen cutané</td>
                                        <td><span class="badge bg-success">Validée</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">Modifier</button>
                                            <button class="btn btn-sm btn-outline-danger">Annuler</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Passés -->
                <div class="tab-pane fade" id="past" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Date et Heure</th>
                                        <th>Docteur</th>
                                        <th>Département</th>
                                        <th>Motif</th>
                                        <th>Diagnostic</th>
                                        <th>Statut</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>01 Oct 2025 - 09:00</td>
                                        <td>Dr. Marie Laurent</td>
                                        <td>Pédiatrie</td>
                                        <td>Vaccination</td>
                                        <td>Vaccin effectué</td>
                                        <td><span class="badge bg-secondary">Terminée</span></td>
                                    </tr>
                                    <tr>
                                        <td>25 Sep 2025 - 11:00</td>
                                        <td>Dr. Sophie Martin</td>
                                        <td>Cardiologie</td>
                                        <td>Contrôle cardiaque</td>
                                        <td>RAS</td>
                                        <td><span class="badge bg-secondary">Terminée</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Annulés -->
                <div class="tab-pane fade" id="cancelled" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Date et Heure</th>
                                        <th>Docteur</th>
                                        <th>Département</th>
                                        <th>Motif</th>
                                        <th>Raison annulation</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>05 Sep 2025 - 15:30</td>
                                        <td>Dr. Pierre Dubois</td>
                                        <td>Dermatologie</td>
                                        <td>Consultation</td>
                                        <td>Empêchement personnel</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>