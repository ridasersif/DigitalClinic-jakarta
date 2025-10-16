<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Consultation Médicale"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="consultation"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Consultation Médicale</h1>
                <div class="text-muted">Saisie du compte rendu médical</div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card shadow mb-4">
                        <div class="card-header bg-primary text-white">
                            <h6 class="mb-0">Informations patient</h6>
                        </div>
                        <div class="card-body">
                            <div class="text-center mb-3">
                                <div class="bg-light rounded-circle mx-auto d-flex align-items-center justify-content-center"
                                     style="width: 80px; height: 80px; font-size: 1.5rem;">
                                    JD
                                </div>
                                <h5 class="mt-2">Jean Dupont</h5>
                                <p class="text-muted">Patient régulier</p>
                            </div>

                            <div class="mb-3">
                                <strong>Âge:</strong> 45 ans<br>
                                <strong>Sexe:</strong> Masculin<br>
                                <strong>Poids:</strong> 75 kg<br>
                                <strong>Taille:</strong> 178 cm<br>
                                <strong>IMC:</strong> 23.7
                            </div>

                            <div class="mb-3">
                                <strong>Contact:</strong><br>
                                jean.dupont@email.com<br>
                                06 12 34 56 78
                            </div>

                            <div class="alert alert-info">
                                <small>
                                    <strong>Allergies:</strong> Aucune connue<br>
                                    <strong>Traitements en cours:</strong> Aucun
                                </small>
                            </div>
                        </div>
                    </div>

                    <div class="card shadow">
                        <div class="card-header bg-info text-white">
                            <h6 class="mb-0">Détails rendez-vous</h6>
                        </div>
                        <div class="card-body">
                            <p><strong>Date:</strong> 13 Oct 2025</p>
                            <p><strong>Heure:</strong> 08:00 - 08:30</p>
                            <p><strong>Salle:</strong> 201</p>
                            <p><strong>Motif:</strong> Consultation de routine</p>
                            <p><strong>Statut:</strong> <span class="badge bg-success">En cours</span></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-header bg-success text-white">
                            <h6 class="mb-0">Compte rendu médical</h6>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="symptoms" class="form-label">Symptômes rapportés</label>
                                    <textarea class="form-control" id="symptoms" rows="3" placeholder="Décrire les symptômes rapportés par le patient..."></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="examination" class="form-label">Examen clinique</label>
                                    <textarea class="form-control" id="examination" rows="3" placeholder="Résultats de l'examen clinique..."></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="diagnosis" class="form-label">Diagnostic</label>
                                    <textarea class="form-control" id="diagnosis" rows="3" placeholder="Diagnostic établi..." required></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="treatment" class="form-label">Traitement prescrit</label>
                                    <textarea class="form-control" id="treatment" rows="3" placeholder="Traitement médicamenteux et recommandations..."></textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="nextAppointment" class="form-label">Prochain rendez-vous</label>
                                        <input type="date" class="form-control" id="nextAppointment">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="status" class="form-label">Statut consultation</label>
                                        <select class="form-select" id="status" required>
                                            <option value="">Choisir un statut</option>
                                            <option value="completed">Terminée</option>
                                            <option value="followup">Suivi nécessaire</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="button" class="btn btn-outline-secondary me-md-2">Sauvegarder brouillon</button>
                                    <button type="submit" class="btn btn-success">Terminer la consultation</button>
                                </div>
                            </form>
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