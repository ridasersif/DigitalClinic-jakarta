<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Mes Rendez-vous"/>
</jsp:include>

<style>
    :root {
        --primary: #0ea5e9;
        --primary-dark: #0284c7;
        --primary-soft: #e0f2fe;
        --primary-lighter: #f0f9ff;
        --secondary: #10b981;
        --secondary-dark: #059669;
        --sidebar-width: 280px;
        --content-margin: 30px;
    }

    .main-content {
        background-color: #f8fafc;
        min-height: 100vh;
        margin-left: calc(var(--sidebar-width) + var(--content-margin)) !important;
        margin-right: var(--content-margin) !important;
        margin-top: var(--content-margin) !important;
        width: calc(100% - var(--sidebar-width) - (2 * var(--content-margin))) !important;
    }

    /* Style pour les boutons primaires en bleu moderne */
    .btn-primary, .btn-outline-primary {
        --bs-btn-color: #fff;
        --bs-btn-bg: var(--primary);
        --bs-btn-border-color: var(--primary);
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: var(--primary-dark);
        --bs-btn-hover-border-color: var(--primary-dark);
        --bs-btn-focus-shadow-rgb: 14, 165, 233;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: var(--primary-dark);
        --bs-btn-active-border-color: var(--primary-dark);
    }

    .btn-outline-primary {
        --bs-btn-color: var(--primary);
        --bs-btn-bg: transparent;
        --bs-btn-border-color: var(--primary);
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: var(--primary);
        --bs-btn-hover-border-color: var(--primary);
    }

    /* Style pour les badges primaires */
    .badge.bg-primary {
        background-color: var(--primary) !important;
        border-color: var(--primary);
    }

    /* Style pour les tabs actives */
    .nav-pills .nav-link.active {
        background-color: var(--primary);
        border-color: var(--primary);
    }

    /* Style pour les en-têtes */
    .text-primary {
        color: var(--primary) !important;
    }

    /* Style pour les cartes et bordures */
    .border-primary {
        border-color: var(--primary) !important;
    }

    /* Style pour les avatars */
    .avatar-sm {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, var(--primary), var(--secondary));
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
    }

    /* Style pour les badges de salle */
    .badge.bg-primary {
        background: linear-gradient(135deg, var(--primary), var(--primary-dark)) !important;
    }

    /* Style pour les boutons de statut */
    .btn-success {
        --bs-btn-bg: var(--secondary);
        --bs-btn-border-color: var(--secondary);
        --bs-btn-hover-bg: var(--secondary-dark);
        --bs-btn-hover-border-color: var(--secondary-dark);
    }

    .btn-info {
        --bs-btn-bg: var(--primary);
        --bs-btn-border-color: var(--primary);
        --bs-btn-hover-bg: var(--primary-dark);
        --bs-btn-hover-border-color: var(--primary-dark);
    }

    /* Animation au survol des lignes */
    .table-hover tbody tr:hover {
        background-color: var(--primary-lighter);
        transition: all 0.3s ease;
    }

    /* Espacement amélioré pour les cartes */
    .card {
        border-radius: 12px;
        margin-bottom: var(--content-margin);
        border: 1px solid #e2e8f0;
    }

    .card-header {
        border-radius: 12px 12px 0 0 !important;
        padding: 1.25rem 1.5rem;
        background: linear-gradient(135deg, var(--primary-lighter), white);
        border-bottom: 2px solid var(--primary-soft);
    }

    .card-body {
        padding: 1.5rem;
    }

    /* Espacement pour les tabs */
    .nav-pills {
        gap: 10px;
    }

    .nav-pills .nav-link {
        border-radius: 8px;
        padding: 0.75rem 1.25rem;
        transition: all 0.3s ease;
        border: 1px solid #e2e8f0;
    }

    .nav-pills .nav-link:hover {
        border-color: var(--primary);
        background-color: var(--primary-lighter);
    }

    /* Header spacing */
    .border-bottom {
        padding-bottom: 1.5rem;
        margin-bottom: 2rem;
        border-bottom: 2px solid var(--primary-soft) !important;
    }

    /* Table spacing amélioré */
    .table th, .table td {
        padding: 1rem 0.75rem;
        vertical-align: middle;
    }

    .table thead th {
        border-bottom: 2px solid var(--primary);
        font-weight: 600;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        background-color: var(--primary-lighter);
        color: var(--primary-dark);
    }

    /* Style pour les badges de statut */
    .badge.bg-warning {
        background: linear-gradient(135deg, #f59e0b, #d97706) !important;
    }

    .badge.bg-success {
        background: linear-gradient(135deg, var(--secondary), var(--secondary-dark)) !important;
    }

    .badge.bg-danger {
        background: linear-gradient(135deg, #ef4444, #dc2626) !important;
    }

    .badge.bg-info {
        background: linear-gradient(135deg, #8b5cf6, #7c3aed) !important;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .main-content {
            margin-left: 15px !important;
            margin-right: 15px !important;
            margin-top: 80px !important;
            width: calc(100% - 30px) !important;
        }

        :root {
            --content-margin: 15px;
        }
    }
</style>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <jsp:include page="sidebar-doctor.jsp">
            <jsp:param name="active" value="appointments"/>
        </jsp:include>

        <!-- Main Content avec espacement -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
            <!-- Header -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-4 border-bottom">
                <div>
                    <h1 class="h2 fw-bold text-primary">
                        <i class="fas fa-calendar-alt me-2"></i>Gestion des Rendez-vous
                    </h1>
                    <p class="text-muted mb-0">Valider et gérer les réservations de vos patients</p>
                </div>
                <div class="btn-group">
                    <button class="btn btn-outline-primary btn-sm" onclick="window.location.reload()">
                        <i class="fas fa-sync-alt me-1"></i>Actualiser
                    </button>
                </div>
            </div>

            <!-- Messages d'alerte -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    <strong>Succès!</strong> ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="successMessage" scope="session"/>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <strong>Erreur!</strong> ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>

            <!-- Navigation Tabs -->
            <div class="card mb-4 shadow-sm">
                <div class="card-body py-3">
                    <ul class="nav nav-pills nav-fill" id="appointmentTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${empty currentStatus and empty todayFilter ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/doctor/appointments">
                                <i class="fas fa-list me-1"></i>
                                Tous les RDV
                                <span class="badge bg-secondary ms-1">${appointments.size()}</span>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${currentStatus == 'RESERVED' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/doctor/appointments?status=RESERVED">
                                <i class="fas fa-clock me-1"></i>
                                En attente
                                <span class="badge bg-warning ms-1">${pendingCount}</span>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${currentStatus == 'VALIDATED' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/doctor/appointments?status=VALIDATED">
                                <i class="fas fa-check-circle me-1"></i>
                                Confirmés
                                <span class="badge bg-success ms-1">${confirmedCount}</span>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link ${todayFilter == 'true' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/doctor/appointments?today=true">
                                <i class="fas fa-calendar-day me-1"></i>
                                Aujourd'hui
                                <span class="badge bg-info ms-1">${todayCount}</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Tableau des rendez-vous -->
            <div class="card shadow">
                <div class="card-header">
                    <h5 class="card-title mb-0 text-primary">
                        <i class="fas fa-table me-2"></i>
                        Liste des Rendez-vous
                        <c:if test="${not empty currentStatus}">
                            <small class="text-muted">- Filtre: ${currentStatus}</small>
                        </c:if>
                        <c:if test="${todayFilter == 'true'}">
                            <small class="text-muted">- Filtre: Aujourd'hui</small>
                        </c:if>
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                            <tr>
                                <th width="18%">Patient</th>
                                <th width="12%">Date</th>
                                <th width="10%">Heure</th>
                                <th width="20%">Motif</th>
                                <th width="12%">Salle</th>
                                <th width="12%">Statut</th>
                                <th width="16%">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="appointment" items="${appointments}">
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm me-3">
                                                <i class="fas fa-user"></i>
                                            </div>
                                            <div>
                                                <strong class="d-block">
                                                    <c:choose>
                                                        <c:when test="${appointment.patient != null}">
                                                            ${appointment.patient.fullName}
                                                        </c:when>
                                                        <c:otherwise>N/A</c:otherwise>
                                                    </c:choose>
                                                </strong>
                                                <small class="text-muted">
                                                    Patient
                                                </small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <strong>
                                            <c:choose>
                                                <c:when test="${appointment.appointmentDate != null}">
                                                    ${appointment.appointmentDate}
                                                </c:when>
                                                <c:otherwise>N/A</c:otherwise>
                                            </c:choose>
                                        </strong>
                                    </td>
                                    <td>
                                                <span class="badge bg-light text-dark border">
                                                    <c:choose>
                                                        <c:when test="${appointment.appointmentTime != null}">
                                                            ${appointment.appointmentTime}
                                                        </c:when>
                                                        <c:otherwise>N/A</c:otherwise>
                                                    </c:choose>
                                                </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${appointment.reason != null && !empty appointment.reason}">
                                                        <span class="d-inline-block text-truncate" style="max-width: 200px;"
                                                              title="${appointment.reason}">
                                                                ${appointment.reason}
                                                        </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted fst-italic">Aucun motif spécifié</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${appointment.room != null}">
                                                        <span class="badge bg-primary">
                                                            <i class="fas fa-door-open me-1"></i>
                                                            ${appointment.room.name}
                                                        </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">N/A</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${appointment.status == 'RESERVED'}">
                                                <span class="badge bg-warning">
                                                    <i class="fas fa-clock me-1"></i>En attente
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'VALIDATED'}">
                                                <span class="badge bg-success">
                                                    <i class="fas fa-check me-1"></i>Confirmé
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'CANCELLED'}">
                                                <span class="badge bg-danger">
                                                    <i class="fas fa-times me-1"></i>Annulé
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'CANCELLEDBYDOCTOR'}">
                                                <span class="badge bg-dark">
                                                    <i class="fas fa-user-md me-1"></i>Annulé par docteur
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'COMPLETED'}">
                                                <span class="badge bg-info">
                                                    <i class="fas fa-flag me-1"></i>Terminé
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">
                                                        ${appointment.status}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="btn-group-vertical btn-group-sm" role="group">
                                            <c:if test="${appointment.status == 'RESERVED'}">
                                                <form method="post" action="${pageContext.request.contextPath}/doctor/appointments"
                                                      class="d-inline mb-1">
                                                    <input type="hidden" name="appointmentId" value="${appointment.id}">
                                                    <input type="hidden" name="action" value="validate">
                                                    <button type="submit" class="btn btn-success btn-sm w-100">
                                                        <i class="fas fa-check me-1"></i>Valider
                                                    </button>
                                                </form>
                                                <form method="post" action="${pageContext.request.contextPath}/doctor/appointments"
                                                      class="d-inline">
                                                    <input type="hidden" name="appointmentId" value="${appointment.id}">
                                                    <input type="hidden" name="action" value="cancel">
                                                    <button type="submit" class="btn btn-outline-danger btn-sm w-100"
                                                            onclick="return confirm('Êtes-vous sûr de vouloir refuser ce rendez-vous ?')">
                                                        <i class="fas fa-times me-1"></i>Refuser
                                                    </button>
                                                </form>
                                            </c:if>

                                            <c:if test="${appointment.status == 'VALIDATED'}">
                                                <c:choose>
                                                    <c:when test="${appointment.isToday()}">
                                                        <a href="${pageContext.request.contextPath}/doctor/consultations?appointmentId=${appointment.id}"
                                                           class="btn btn-primary btn-sm w-100 mb-1">
                                                            <i class="fas fa-play me-1"></i>Commencer
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${appointment.isPast()}">
                                                        <form method="post" action="${pageContext.request.contextPath}/doctor/appointments"
                                                              class="d-inline">
                                                            <input type="hidden" name="appointmentId" value="${appointment.id}">
                                                            <input type="hidden" name="action" value="complete">
                                                            <button type="submit" class="btn btn-info btn-sm w-100">
                                                                <i class="fas fa-flag me-1"></i>Terminer
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                                <span class="badge bg-light text-dark border">
                                                                    <i class="fas fa-calendar me-1"></i>À venir
                                                                </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>

                                            <c:if test="${appointment.status == 'COMPLETED'}">
                                                        <span class="badge bg-success">
                                                            <i class="fas fa-check-double me-1"></i>Terminé
                                                        </span>
                                            </c:if>

                                            <c:if test="${appointment.status == 'CANCELLED'}">
                                                        <span class="badge bg-danger">
                                                            <i class="fas fa-ban me-1"></i>Annulé
                                                        </span>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty appointments}">
                                <tr>
                                    <td colspan="7" class="text-center py-5">
                                        <div class="text-muted">
                                            <i class="fas fa-calendar-times fa-4x mb-3" style="color: var(--primary);"></i>
                                            <h4 class="text-primary">Aucun rendez-vous trouvé</h4>
                                            <p class="mb-0">Aucun rendez-vous ne correspond à vos critères de recherche.</p>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <c:if test="${not empty appointments}">
                    <div class="card-footer bg-white">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <small class="text-muted">
                                    Affichage de <strong>${appointments.size()}</strong> rendez-vous
                                </small>
                            </div>
                            <div class="col-md-6 text-end">
                                <small class="text-muted">
                                    Dernière mise à jour: <span id="currentTime"></span>
                                </small>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Afficher l'heure actuelle
    function updateTime() {
        const now = new Date();
        document.getElementById('currentTime').textContent =
            now.toLocaleTimeString('fr-FR') + ' - ' +
            now.toLocaleDateString('fr-FR');
    }

    updateTime();
    setInterval(updateTime, 60000);

    // Confirmation pour les actions de refus
    document.addEventListener('DOMContentLoaded', function() {
        const cancelButtons = document.querySelectorAll('form button[class*="btn-outline-danger"]');
        cancelButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                if (!confirm('Êtes-vous sûr de vouloir refuser ce rendez-vous ? Cette action est irréversible.')) {
                    e.preventDefault();
                }
            });
        });

        // Auto-dismiss alerts after 5 seconds
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }, 5000);
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>