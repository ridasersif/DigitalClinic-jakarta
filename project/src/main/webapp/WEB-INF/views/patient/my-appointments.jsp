<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Mes Rendez-vous"/>
</jsp:include>

<style>
    :root {
        --primary-green: #10b981;
        --primary-dark: #047857;
        --primary-light: #d1fae5;
        --warning: #f59e0b;
        --danger: #ef4444;
        --secondary: #6b7280;
    }

    .appointments-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 2rem;
    }

    /* En-tête à gauche */
    .page-header-left {
        text-align: left;
        margin-bottom: 2rem;
        padding-bottom: 1.5rem;
        border-bottom: 2px solid #e5e7eb;
    }

    .page-title {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary-green);
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .page-subtitle {
        font-size: 1.1rem;
        color: #6b7280;
        font-weight: 400;
        margin: 0;
    }

    /* Alertes modernes avec animation */
    .alert-modern {
        padding: 1.25rem 1.5rem;
        border-radius: 12px;
        margin-bottom: 1.5rem;
        border: none;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        display: flex;
        align-items: center;
        gap: 1rem;
        animation: slideInDown 0.5s ease-out;
        position: relative;
        overflow: hidden;
    }

    .alert-modern::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 4px;
        background: currentColor;
        opacity: 0.3;
    }

    .alert-success-modern {
        background: linear-gradient(135deg, #f0fdf4, #dcfce7);
        color: #065f46;
        border-left: 4px solid var(--primary-green);
    }

    .alert-error-modern {
        background: linear-gradient(135deg, #fef2f2, #fee2e2);
        color: #991b1b;
        border-left: 4px solid var(--danger);
    }

    .alert-icon {
        font-size: 1.5rem;
        flex-shrink: 0;
    }

    .alert-content {
        flex: 1;
    }

    .alert-title {
        font-weight: 600;
        margin-bottom: 0.25rem;
        font-size: 1rem;
    }

    .alert-message {
        font-size: 0.95rem;
        opacity: 0.9;
        margin: 0;
    }

    .alert-close {
        background: none;
        border: none;
        font-size: 1.25rem;
        cursor: pointer;
        opacity: 0.7;
        transition: opacity 0.2s;
        padding: 0.25rem;
        border-radius: 4px;
    }

    .alert-close:hover {
        opacity: 1;
        background: rgba(0,0,0,0.05);
    }

    @keyframes slideInDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes slideOutUp {
        from {
            opacity: 1;
            transform: translateY(0);
        }
        to {
            opacity: 0;
            transform: translateY(-20px);
        }
    }

    /* Navigation par onglets simple */
    .nav-tabs-simple {
        border-bottom: 2px solid #e5e7eb;
        margin-bottom: 1.5rem;
        display: flex;
        gap: 0;
    }

    .nav-tabs-simple .nav-link {
        border: none;
        padding: 1rem 2rem;
        font-weight: 500;
        color: #6b7280;
        background: transparent;
        border-bottom: 3px solid transparent;
        transition: all 0.3s;
    }

    .nav-tabs-simple .nav-link.active {
        color: var(--primary-green);
        border-bottom-color: var(--primary-green);
        background: transparent;
    }

    .nav-tabs-simple .nav-link:hover {
        color: var(--primary-green);
        background: #f8fafc;
    }

    /* Tableau moderne et simple */
    .table-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        overflow: hidden;
        border: 1px solid #e5e7eb;
    }

    .appointments-table {
        width: 100%;
        border-collapse: collapse;
        margin: 0;
    }

    .appointments-table thead {
        background: #f8fafc;
    }

    .appointments-table th {
        padding: 1rem 1.25rem;
        text-align: left;
        color: #374151;
        font-weight: 600;
        font-size: 0.9rem;
        border-bottom: 2px solid #e5e7eb;
    }

    .appointments-table td {
        padding: 1rem 1.25rem;
        color: #4b5563;
        font-size: 0.95rem;
        border-bottom: 1px solid #f3f4f6;
    }

    .appointments-table tbody tr {
        transition: all 0.2s;
    }

    .appointments-table tbody tr:hover {
        background: #f8fafc;
    }

    .appointments-table tbody tr:last-child td {
        border-bottom: none;
    }

    /* Badges de statut */
    .status-badge {
        padding: 0.4rem 0.8rem;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 600;
        text-transform: uppercase;
        display: inline-block;
    }

    .status-reserved {
        background: #fef3c7;
        color: #92400e;
    }

    .status-validated {
        background: #d1fae5;
        color: #065f46;
    }

    .status-completed {
        background: #e5e7eb;
        color: #374151;
    }

    .status-cancelled {
        background: #fee2e2;
        color: #991b1b;
    }

    /* Boutons d'action */
    .btn-action {
        padding: 0.4rem 0.8rem;
        border: 1px solid;
        border-radius: 6px;
        font-size: 0.8rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
        background: white;
        display: inline-flex;
        align-items: center;
        gap: 0.4rem;
    }

    .btn-cancel {
        border-color: var(--danger);
        color: var(--danger);
    }

    .btn-cancel:hover {
        background: var(--danger);
        color: white;
    }

    .btn-details {
        border-color: var(--primary-green);
        color: var(--primary-green);
    }

    .btn-details:hover {
        background: var(--primary-green);
        color: white;
    }

    .btn-report {
        border-color: var(--secondary);
        color: var(--secondary);
    }

    .btn-report:hover {
        background: var(--secondary);
        color: white;
    }

    /* État vide */
    .empty-state {
        text-align: center;
        padding: 3rem 2rem;
        color: #6b7280;
    }

    .empty-state i {
        font-size: 3rem;
        margin-bottom: 1rem;
        color: #d1d5db;
    }

    .empty-state h4 {
        font-size: 1.25rem;
        margin-bottom: 0.5rem;
        color: #374151;
    }

    .empty-state p {
        font-size: 0.95rem;
        margin-bottom: 1.5rem;
    }

    /* Modal moderne */
    .modal-modern {
        display: none;
        position: fixed;
        z-index: 1050;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        backdrop-filter: blur(4px);
        animation: fadeIn 0.3s ease-out;
    }

    .modal-content-modern {
        background: white;
        margin: 15% auto;
        padding: 0;
        border-radius: 16px;
        width: 90%;
        max-width: 420px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        animation: modalSlideIn 0.3s ease-out;
        overflow: hidden;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes modalSlideIn {
        from {
            opacity: 0;
            transform: translateY(-50px) scale(0.9);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }

    .modal-header-modern {
        padding: 1.5rem 2rem;
        border-bottom: 1px solid #e5e7eb;
        display: flex;
        align-items: center;
        gap: 1rem;
        background: #f8fafc;
    }

    .modal-icon {
        width: 48px;
        height: 48px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        flex-shrink: 0;
    }

    .modal-icon-warning {
        background: #fef3c7;
        color: #d97706;
    }

    .modal-icon-info {
        background: #dbeafe;
        color: #3b82f6;
    }

    .modal-title-modern {
        font-size: 1.25rem;
        font-weight: 600;
        color: #1f2937;
        margin: 0;
    }

    .modal-body-modern {
        padding: 2rem;
        color: #6b7280;
        line-height: 1.6;
    }

    .modal-footer-modern {
        padding: 1.5rem 2rem;
        border-top: 1px solid #e5e7eb;
        display: flex;
        gap: 1rem;
        justify-content: flex-end;
    }

    .modal-btn {
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: 8px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
        font-size: 0.95rem;
    }

    .modal-btn-cancel {
        background: #f3f4f6;
        color: #374151;
    }

    .modal-btn-cancel:hover {
        background: #e5e7eb;
        transform: translateY(-1px);
    }

    .modal-btn-confirm {
        background: var(--danger);
        color: white;
    }

    .modal-btn-confirm:hover {
        background: #dc2626;
        transform: translateY(-1px);
    }

    .modal-btn-close {
        background: var(--primary-green);
        color: white;
    }

    .modal-btn-close:hover {
        background: var(--primary-dark);
        transform: translateY(-1px);
    }

    /* Responsive */
    @media (max-width: 768px) {
        .appointments-container {
            padding: 1rem;
        }

        .page-title {
            font-size: 1.75rem;
        }

        .nav-tabs-simple .nav-link {
            padding: 0.75rem 1rem;
            font-size: 0.9rem;
        }

        .table-container {
            overflow-x: auto;
        }

        .appointments-table {
            min-width: 800px;
        }

        .btn-action {
            padding: 0.3rem 0.6rem;
            font-size: 0.75rem;
        }

        .modal-content-modern {
            margin: 10% auto;
            width: 95%;
        }

        .modal-header-modern,
        .modal-body-modern,
        .modal-footer-modern {
            padding: 1.25rem;
        }
    }
</style>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="my-appointments"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px); background: #f8fafc;">
            <div class="appointments-container">
                <!-- En-tête à gauche -->
                <div class="page-header-left">
                    <h1 class="page-title">
                        <i class="fas fa-calendar-check"></i>
                        Mes Rendez-vous
                    </h1>
                    <p class="page-subtitle">Gérez et consultez tous vos rendez-vous</p>
                </div>

                <!-- Alertes modernes -->
                <c:if test="${not empty param.success}">
                    <div class="alert-modern alert-success-modern" id="successAlert">
                        <div class="alert-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="alert-content">
                            <div class="alert-title">Succès</div>
                            <div class="alert-message"><c:out value="${param.success}" /></div>
                        </div>
                        <button class="alert-close" onclick="closeAlert('successAlert')">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </c:if>

                <c:if test="${not empty param.error}">
                    <div class="alert-modern alert-error-modern" id="errorAlert">
                        <div class="alert-icon">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        <div class="alert-content">
                            <div class="alert-title">Erreur</div>
                            <div class="alert-message"><c:out value="${param.error}" /></div>
                        </div>
                        <button class="alert-close" onclick="closeAlert('errorAlert')">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </c:if>

                <!-- Navigation par onglets simple -->
                <ul class="nav nav-tabs-simple" id="appointmentTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="upcoming-tab" data-bs-toggle="tab" data-bs-target="#upcoming" type="button">
                            <i class="fas fa-clock me-2"></i>
                            À venir (<c:out value="${upcomingAppointments.size()}" />)
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="past-tab" data-bs-toggle="tab" data-bs-target="#past" type="button">
                            <i class="fas fa-history me-2"></i>
                            Passés (<c:out value="${pastAppointments.size()}" />)
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab" data-bs-target="#cancelled" type="button">
                            <i class="fas fa-ban me-2"></i>
                            Annulés (<c:out value="${cancelledAppointments.size()}" />)
                        </button>
                    </li>
                </ul>

                <!-- Contenu des onglets -->
                <div class="tab-content" id="appointmentTabsContent">

                    <!-- Onglet : À venir -->
                    <div class="tab-pane fade show active" id="upcoming" role="tabpanel">
                        <c:choose>
                            <c:when test="${empty upcomingAppointments}">
                                <div class="empty-state">
                                    <i class="fas fa-calendar-plus"></i>
                                    <h4>Aucun rendez-vous à venir</h4>
                                    <p>Vous n'avez pas de rendez-vous programmé pour le moment.</p>
                                    <a href="${pageContext.request.contextPath}/patient/book-appointment" class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>Prendre un rendez-vous
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-container">
                                    <table class="appointments-table">
                                        <thead>
                                        <tr>
                                            <th>Date & Heure</th>
                                            <th>Docteur</th>
                                            <th>Spécialité</th>
                                            <th>Motif</th>
                                            <th>Statut</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="appointment" items="${upcomingAppointments}">
                                            <tr>
                                                <td>
                                                    <div class="fw-semibold"><c:out value="${appointment.appointmentDate}" /></div>
                                                    <div class="text-muted small"><c:out value="${appointment.appointmentTime}" /></div>
                                                </td>
                                                <td>
                                                    <div class="fw-medium">Dr. <c:out value="${appointment.doctor.firstName}" /> <c:out value="${appointment.doctor.lastName}" /></div>
                                                </td>
                                                <td><c:out value="${appointment.doctor.specialty}" /></td>
                                                <td>
                                                    <div class="text-truncate" style="max-width: 200px;" title="${appointment.reason}">
                                                        <c:out value="${appointment.reason}" />
                                                    </div>
                                                </td>
                                                <td>
                                                        <span class="status-badge status-${appointment.status.name().toLowerCase()}">
                                                            <c:choose>
                                                                <c:when test="${appointment.status.name() == 'RESERVED'}">Réservée</c:when>
                                                                <c:when test="${appointment.status.name() == 'VALIDATED'}">Validée</c:when>
                                                                <c:otherwise><c:out value="${appointment.status.name()}" /></c:otherwise>
                                                            </c:choose>
                                                        </span>
                                                </td>
                                                <td>
                                                    <div style="display: flex; gap: 0.5rem; flex-wrap: wrap;">
                                                        <c:if test="${appointment.status.name() == 'RESERVED' or appointment.status.name() == 'VALIDATED'}">
                                                            <button class="btn-action btn-cancel"
                                                                    onclick="showCancelModal(${appointment.id}, '${appointment.appointmentDate}', '${appointment.appointmentTime}')">
                                                                <i class="fas fa-times"></i>
                                                                Annuler
                                                            </button>
                                                        </c:if>
                                                        <button class="btn-action btn-details"
                                                                onclick="showDetailsModal(${appointment.id})">
                                                            <i class="fas fa-eye"></i>
                                                            Détails
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Onglet : Passés -->
                    <div class="tab-pane fade" id="past" role="tabpanel">
                        <c:choose>
                            <c:when test="${empty pastAppointments}">
                                <div class="empty-state">
                                    <i class="fas fa-history"></i>
                                    <h4>Aucun rendez-vous passé</h4>
                                    <p>Vous n'avez pas encore de rendez-vous terminés.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-container">
                                    <table class="appointments-table">
                                        <thead>
                                        <tr>
                                            <th>Date & Heure</th>
                                            <th>Docteur</th>
                                            <th>Spécialité</th>
                                            <th>Motif</th>
                                            <th>Rapport</th>
                                            <th>Statut</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="appointment" items="${pastAppointments}">
                                            <tr>
                                                <td>
                                                    <div class="fw-semibold"><c:out value="${appointment.appointmentDate}" /></div>
                                                    <div class="text-muted small"><c:out value="${appointment.appointmentTime}" /></div>
                                                </td>
                                                <td>
                                                    <div class="fw-medium">Dr. <c:out value="${appointment.doctor.firstName}" /> <c:out value="${appointment.doctor.lastName}" /></div>
                                                </td>
                                                <td><c:out value="${appointment.doctor.specialty}" /></td>
                                                <td>
                                                    <div class="text-truncate" style="max-width: 200px;" title="${appointment.reason}">
                                                        <c:out value="${appointment.reason}" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty appointment.report}">
                                                            <button class="btn-action btn-report"
                                                                    onclick="showReportModal(${appointment.id})">
                                                                <i class="fas fa-file-medical"></i>
                                                                Voir
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted small">-</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                        <span class="status-badge status-completed">
                                                            Terminée
                                                        </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Onglet : Annulés -->
                    <div class="tab-pane fade" id="cancelled" role="tabpanel">
                        <c:choose>
                            <c:when test="${empty cancelledAppointments}">
                                <div class="empty-state">
                                    <i class="fas fa-ban"></i>
                                    <h4>Aucun rendez-vous annulé</h4>
                                    <p>Vous n'avez annulé aucun rendez-vous.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-container">
                                    <table class="appointments-table">
                                        <thead>
                                        <tr>
                                            <th>Date & Heure</th>
                                            <th>Docteur</th>
                                            <th>Spécialité</th>
                                            <th>Motif</th>
                                            <th>Statut</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="appointment" items="${cancelledAppointments}">
                                            <tr>
                                                <td>
                                                    <div class="fw-semibold"><c:out value="${appointment.appointmentDate}" /></div>
                                                    <div class="text-muted small"><c:out value="${appointment.appointmentTime}" /></div>
                                                </td>
                                                <td>
                                                    <div class="fw-medium">Dr. <c:out value="${appointment.doctor.firstName}" /> <c:out value="${appointment.doctor.lastName}" /></div>
                                                </td>
                                                <td><c:out value="${appointment.doctor.specialty}" /></td>
                                                <td>
                                                    <div class="text-truncate" style="max-width: 200px;" title="${appointment.reason}">
                                                        <c:out value="${appointment.reason}" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${appointment.status.name() == 'CANCELLEDBYDOCTOR'}">
                                                            <span class="badge bg-dark">
                                                                <i class="fas fa-user-md me-1"></i>Annulé par docteur
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${appointment.status.name() == 'CANCELLED'}">
                                                            <span class="status-badge status-cancelled">
                                                                Annulé par moi
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="status-badge status-cancelled">Annulé</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal d'annulation moderne -->
<div id="cancelModal" class="modal-modern">
    <div class="modal-content-modern">
        <div class="modal-header-modern">
            <div class="modal-icon modal-icon-warning">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <h3 class="modal-title-modern">Confirmer l'annulation</h3>
        </div>
        <div class="modal-body-modern">
            <p>Êtes-vous sûr de vouloir annuler ce rendez-vous ?</p>
            <p class="fw-medium" id="appointmentDetails"></p>
            <p class="text-danger small mt-2"><i class="fas fa-info-circle me-1"></i>Cette action est irréversible.</p>
        </div>
        <div class="modal-footer-modern">
            <button class="modal-btn modal-btn-cancel" onclick="closeModal('cancelModal')">
                <i class="fas fa-times me-2"></i>Annuler
            </button>
            <form id="cancelForm" method="post" action="${pageContext.request.contextPath}/patient/my-appointments" style="display: inline;">
                <input type="hidden" name="appointmentId" id="cancelAppointmentId">
                <input type="hidden" name="action" value="cancel">
                <button type="submit" class="modal-btn modal-btn-confirm">
                    <i class="fas fa-check me-2"></i>Confirmer
                </button>
            </form>
        </div>
    </div>
</div>

<!-- Modal de détails moderne -->
<div id="detailsModal" class="modal-modern">
    <div class="modal-content-modern">
        <div class="modal-header-modern">
            <div class="modal-icon modal-icon-info">
                <i class="fas fa-info-circle"></i>
            </div>
            <h3 class="modal-title-modern">Détails du rendez-vous</h3>
        </div>
        <div class="modal-body-modern" id="detailsContent">
            <!-- Contenu chargé dynamiquement -->
        </div>
        <div class="modal-footer-modern">
            <button class="modal-btn modal-btn-close" onclick="closeModal('detailsModal')">
                <i class="fas fa-times me-2"></i>Fermer
            </button>
        </div>
    </div>
</div>

<!-- Modal de rapport moderne -->
<div id="reportModal" class="modal-modern">
    <div class="modal-content-modern">
        <div class="modal-header-modern">
            <div class="modal-icon modal-icon-info">
                <i class="fas fa-file-medical"></i>
            </div>
            <h3 class="modal-title-modern">Rapport médical</h3>
        </div>
        <div class="modal-body-modern" id="reportContent">
            <!-- Contenu chargé dynamiquement -->
        </div>
        <div class="modal-footer-modern">
            <button class="modal-btn modal-btn-close" onclick="closeModal('reportModal')">
                <i class="fas fa-times me-2"></i>Fermer
            </button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Fonction pour fermer les alertes
    function closeAlert(alertId) {
        const alert = document.getElementById(alertId);
        if (alert) {
            alert.style.animation = 'slideOutUp 0.3s ease-out';
            setTimeout(() => {
                alert.remove();
            }, 300);
        }
    }

    // Auto-fermeture des alertes après 5 secondes
    setTimeout(() => {
        const alerts = document.querySelectorAll('.alert-modern');
        alerts.forEach(alert => {
            closeAlert(alert.id);
        });
    }, 5000);

    // Fonctions pour les modales
    function showCancelModal(appointmentId, date, time) {
        document.getElementById('appointmentDetails').textContent =
            'Rendez-vous du ' + date + ' à ' + time;
        document.getElementById('cancelAppointmentId').value = appointmentId;
        document.getElementById('cancelModal').style.display = 'block';
    }

    function showDetailsModal(appointmentId) {
        // Simuler des détails (vous pouvez remplacer par un appel AJAX)
        document.getElementById('detailsContent').innerHTML =
            '<div style="display: grid; gap: 1rem;">' +
            '<div><strong>ID du rendez-vous:</strong> ' + appointmentId + '</div>' +
            '<div><strong>Statut:</strong> Rendez-vous à venir</div>' +
            '<div><strong>Informations:</strong> Tous les détails du rendez-vous seront affichés ici.</div>' +
            '</div>';
        document.getElementById('detailsModal').style.display = 'block';
    }

    function showReportModal(appointmentId) {
        // Simuler un rapport (vous pouvez remplacer par un appel AJAX)
        const today = new Date().toLocaleDateString();
        document.getElementById('reportContent').innerHTML =
            '<div style="display: grid; gap: 1rem;">' +
            '<div><strong>Rapport médical:</strong></div>' +
            '<div style="background: #f8fafc; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #10b981;">' +
            '<p>Le patient présente des symptômes normaux pour un contrôle de routine. ' +
            'Aucune anomalie détectée lors de l\'examen.</p>' +
            '<p><strong>Recommandations:</strong> Reprise dans 6 mois pour contrôle.</p>' +
            '</div>' +
            '<div class="text-muted small">Rapport généré le ' + today + '</div>' +
            '</div>';
        document.getElementById('reportModal').style.display = 'block';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Fermer les modales en cliquant à l'extérieur
    window.onclick = function(event) {
        const modals = document.querySelectorAll('.modal-modern');
        modals.forEach(modal => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    }

    // Fermer les modales avec la touche Échap
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modals = document.querySelectorAll('.modal-modern');
            modals.forEach(modal => {
                modal.style.display = 'none';
            });
        }
    });
</script>
</body>
</html>