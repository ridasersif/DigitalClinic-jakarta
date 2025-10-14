<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Historique des Patients"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="patient-history"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Historique des Patients</h1>
                <div class="text-muted">Dossiers médicaux des patients suivis</div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                            <tr>
                                <th>Patient</th>
                                <th>Dernière consultation</th>
                                <th>Total consultations</th>
                                <th>Diagnostic principal</th>
                                <th>Traitement en cours</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary text-white rounded-circle me-3 d-flex align-items-center justify-content-center"
                                             style="width: 40px; height: 40px;">
                                            JD
                                        </div>
                                        <div>
                                            <strong>Jean Dupont</strong><br>
                                            <small class="text-muted">45 ans • Homme</small>
                                        </div>
                                    </div>
                                </td>
                                <td>13 Oct 2025</td>
                                <td>8</td>
                                <td>Hypertension légère</td>
                                <td>Surveillance</td>
                                <td><span class="badge bg-success">Actif</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">Voir dossier</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success text-white rounded-circle me-3 d-flex align-items-center justify-content-center"
                                             style="width: 40px; height: 40px;">
                                            MC
                                        </div>
                                        <div>
                                            <strong>Marie Curie</strong><br>
                                            <small class="text-muted">52 ans • Femme</small>
                                        </div>
                                    </div>
                                </td>
                                <td>10 Oct 2025</td>
                                <td>12</td>
                                <td>Arythmie cardiaque</td>
                                <td>Médication beta-bloquant</td>
                                <td><span class="badge bg-success">Actif</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">Voir dossier</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-warning text-white rounded-circle me-3 d-flex align-items-center justify-content-center"
                                             style="width: 40px; height: 40px;">
                                            PM
                                        </div>
                                        <div>
                                            <strong>Pierre Martin</strong><br>
                                            <small class="text-muted">38 ans • Homme</small>
                                        </div>
                                    </div>
                                </td>
                                <td>05 Oct 2025</td>
                                <td>1</td>
                                <td>Première consultation</td>
                                <td>En évaluation</td>
                                <td><span class="badge bg-info">Nouveau</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">Voir dossier</button>
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

<jsp:include page="../common/footer.jsp"/>