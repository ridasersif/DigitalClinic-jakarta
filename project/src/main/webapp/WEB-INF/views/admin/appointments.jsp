<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Supervision des Rendez-vous"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="appointments"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Supervision des Rendez-vous</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-primary">Aujourd'hui</button>
                        <button type="button" class="btn btn-sm btn-outline-primary">Cette semaine</button>
                        <button type="button" class="btn btn-sm btn-outline-primary">Ce mois</button>
                    </div>
                </div>
            </div>

            <!-- Filtres -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Date</label>
                            <input type="date" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Département</label>
                            <select class="form-select">
                                <option>Tous les départements</option>
                                <option>Cardiologie</option>
                                <option>Dermatologie</option>
                                <option>Pédiatrie</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Statut</label>
                            <select class="form-select">
                                <option>Tous les statuts</option>
                                <option>Réservée</option>
                                <option>Confirmée</option>
                                <option>Terminée</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">&nbsp;</label>
                            <button class="btn btn-primary w-100">Filtrer</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                            <tr>
                                <th>Date/Heure</th>
                                <th>Patient</th>
                                <th>Docteur</th>
                                <th>Département</th>
                                <th>Salle</th>
                                <th>Motif</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <strong>Aujourd'hui</strong><br>
                                    <small>08:00 - 08:30</small>
                                </td>
                                <td>
                                    <strong>Jean Dupont</strong><br>
                                    <small class="text-muted">45 ans</small>
                                </td>
                                <td>Dr. Sophie Martin</td>
                                <td>Cardiologie</td>
                                <td>Salle 101</td>
                                <td>Consultation de routine</td>
                                <td><span class="badge bg-success">Terminée</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Aujourd'hui</strong><br>
                                    <small>10:00 - 10:30</small>
                                </td>
                                <td>
                                    <strong>Marie Curie</strong><br>
                                    <small class="text-muted">52 ans</small>
                                </td>
                                <td>Dr. Pierre Dubois</td>
                                <td>Dermatologie</td>
                                <td>Salle 102</td>
                                <td>Examen cutané</td>
                                <td><span class="badge bg-warning">En cours</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Aujourd'hui</strong><br>
                                    <small>11:00 - 11:30</small>
                                </td>
                                <td>
                                    <strong>Pierre Martin</strong><br>
                                    <small class="text-muted">38 ans</small>
                                </td>
                                <td>Dr. Marie Laurent</td>
                                <td>Pédiatrie</td>
                                <td>Salle 201</td>
                                <td>Vaccination</td>
                                <td><span class="badge bg-primary">Confirmée</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

</div> <!-- Fermeture du container principal -->

<footer class="bg-dark text-light mt-5">

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>