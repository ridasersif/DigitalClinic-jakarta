<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Prendre un Rendez-vous"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="book-appointment"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-primary">Prendre un rendez-vous</h1>
                <div class="text-muted">Réservez votre consultation en ligne</div>
            </div>

            <div class="card shadow">
                <div class="card-header bg-primary text-white py-3">
                    <h4 class="card-title mb-0">
                        <i class="fas fa-calendar-plus me-2"></i>Nouveau rendez-vous
                    </h4>
                </div>
                <div class="card-body p-4">
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="department" class="form-label fw-bold">Département</label>
                                <select class="form-select" id="department" required>
                                    <option value="">Sélectionnez un département</option>
                                    <option value="cardio">Cardiologie</option>
                                    <option value="dermato">Dermatologie</option>
                                    <option value="pediatrie">Pédiatrie</option>
                                    <option value="neurologie">Neurologie</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="doctor" class="form-label fw-bold">Docteur</label>
                                <select class="form-select" id="doctor" required>
                                    <option value="">Choisissez un docteur</option>
                                    <option value="1">Dr. Sophie Martin</option>
                                    <option value="2">Dr. Pierre Dubois</option>
                                    <option value="3">Dr. Marie Laurent</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="date" class="form-label fw-bold">Date</label>
                                <input type="date" class="form-control" id="date" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="time" class="form-label fw-bold">Heure</label>
                                <select class="form-select" id="time" required>
                                    <option value="">Choisissez une heure</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:30">08:30</option>
                                    <option value="09:00">09:00</option>
                                    <option value="09:30">09:30</option>
                                    <option value="10:00">10:00</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="reason" class="form-label fw-bold">Motif de consultation</label>
                            <textarea class="form-control" id="reason" rows="4"
                                      placeholder="Décrivez brièvement la raison de votre consultation..."
                                      required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="room" class="form-label fw-bold">Préférence de salle (optionnel)</label>
                            <select class="form-select" id="room">
                                <option value="">Aucune préférence</option>
                                <option value="101">Salle 101 - Cardiologie</option>
                                <option value="102">Salle 102 - Dermatologie</option>
                                <option value="201">Salle 201 - Pédiatrie</option>
                            </select>
                        </div>

                        <div class="alert alert-info">
                            <small>
                                <strong>Information:</strong> Votre rendez-vous sera réservé pour une durée de 30 minutes.
                                Vous recevrez une confirmation par email.
                            </small>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">Réserver le rendez-vous</button>
                            <a href="dashboard.jsp" class="btn btn-outline-secondary">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>