<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Mes Rendez-vous"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="appointments"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Gestion des Rendez-vous</h1>
                <div class="text-muted">Valider et gérer les réservations</div>
            </div>

            <ul class="nav nav-tabs mb-4" id="appointmentTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="pending-tab" data-bs-toggle="tab" data-bs-target="#pending" type="button">
                        En attente (3)
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="confirmed-tab" data-bs-toggle="tab" data-bs-target="#confirmed" type="button">
                        Confirmés (12)
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="today-tab" data-bs-toggle="tab" data-bs-target="#today" type="button">
                        Aujourd'hui (8)
                    </button>
                </li>
            </ul>

            <div class="tab-content" id="appointmentTabsContent">
                <!-- En attente -->
                <div class="tab-pane fade show active" id="pending" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Patient</th>
                                        <th>Date demandée</th>
                                        <th>Heure</th>
                                        <th>Motif</th>
                                        <th>Contact</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <strong>Luc Moreau</strong><br>
                                            <small class="text-muted">Nouveau patient</small>
                                        </td>
                                        <td>15 Oct 2025</td>
                                        <td>09:30</td>
                                        <td>Consultation cardiaque</td>
                                        <td>
                                            <small>luc.moreau@email.com<br>06 12 34 56 78</small>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-success">Valider</button>
                                                <button class="btn btn-outline-danger">Refuser</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Alice Dubois</strong><br>
                                            <small class="text-muted">Patient régulier</small>
                                        </td>
                                        <td>18 Oct 2025</td>
                                        <td>11:00</td>
                                        <td>Suivi traitement</td>
                                        <td>
                                            <small>alice.dubois@email.com<br>06 23 45 67 89</small>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-success">Valider</button>
                                                <button class="btn btn-outline-danger">Refuser</button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Confirmés -->
                <div class="tab-pane fade" id="confirmed" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Patient</th>
                                        <th>Date</th>
                                        <th>Heure</th>
                                        <th>Motif</th>
                                        <th>Salle</th>
                                        <th>Statut</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Jean Dupont</td>
                                        <td>13 Oct 2025</td>
                                        <td>08:00</td>
                                        <td>Consultation de routine</td>
                                        <td>Salle 201</td>
                                        <td><span class="badge bg-success">Confirmé</span></td>
                                    </tr>
                                    <tr>
                                        <td>Marie Curie</td>
                                        <td>13 Oct 2025</td>
                                        <td>10:00</td>
                                        <td>Suivi traitement</td>
                                        <td>Salle 202</td>
                                        <td><span class="badge bg-success">Confirmé</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Aujourd'hui -->
                <div class="tab-pane fade" id="today" role="tabpanel">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                    <tr>
                                        <th>Heure</th>
                                        <th>Patient</th>
                                        <th>Motif</th>
                                        <th>Salle</th>
                                        <th>Statut</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><strong>08:00 - 08:30</strong></td>
                                        <td>Jean Dupont</td>
                                        <td>Consultation de routine</td>
                                        <td>Salle 201</td>
                                        <td><span class="badge bg-success">Présent</span></td>
                                        <td>
                                            <a href="consultation.jsp" class="btn btn-sm btn-primary">
                                                Commencer
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>09:00 - 09:30</strong></td>
                                        <td>Luc Moreau</td>
                                        <td>Examen cardiaque</td>
                                        <td>Salle 202</td>
                                        <td><span class="badge bg-warning">En attente</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-secondary" disabled>
                                                À venir
                                            </button>
                                        </td>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>