<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Gestion des Docteurs"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="doctors"/>
        </jsp:include>

        <!-- Contenu principal avec le nouveau design -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px);">

            <!-- Notifications Toast -->
            <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
                <div id="successToast" class="toast" role="alert">
                    <div class="toast-header bg-success text-white">
                        <i class="fas fa-check-circle me-2"></i>
                        <strong class="me-auto">Succès</strong>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                    </div>
                    <div class="toast-body bg-light">
                        <span id="successMessage"></span>
                    </div>
                </div>
                <div id="errorToast" class="toast" role="alert">
                    <div class="toast-header bg-danger text-white">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <strong class="me-auto">Erreur</strong>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                    </div>
                    <div class="toast-body bg-light">
                        <span id="errorMessage"></span>
                    </div>
                </div>
            </div>

            <!-- En-tête de Page -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-4 border-bottom">
                <div>
                    <h1 class="h3 fw-bold text-dark mb-1">Gestion des Docteurs</h1>
                    <p class="text-muted mb-0">Administrez les médecins de votre clinique</p>
                </div>
                <button class="btn btn-primary btn-lg px-4" onclick="openCreateDoctorModal()">
                    <i class="fas fa-user-md me-2"></i>Nouveau docteur
                </button>
            </div>

            <!-- Cartes de Statistiques -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-primary-soft text-primary rounded-3 p-3">
                                        <i class="fas fa-user-md fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Total Docteurs</h5>
                                    <h3 class="fw-bold text-dark mb-0">${doctors.size()}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-success-soft text-success rounded-3 p-3">
                                        <i class="fas fa-check-circle fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Docteurs Actifs</h5>
                                    <h3 class="fw-bold text-dark mb-0">
                                        <c:set var="activeDoctors" value="0" />
                                        <c:forEach var="doc" items="${doctors}">
                                            <c:if test="${doc.status.name() == 'ACTIVE'}">
                                                <c:set var="activeDoctors" value="${activeDoctors + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        ${activeDoctors}
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tableau des Docteurs -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title mb-0 fw-semibold text-dark">
                        <i class="fas fa-list me-2 text-primary"></i> Liste des Docteurs
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4 fw-semibold text-dark">Docteur</th>
                                <th class="fw-semibold text-dark">Département</th>
                                <th class="fw-semibold text-dark">Spécialité</th>
                                <th class="fw-semibold text-dark text-center">Consultations</th>
                                <th class="fw-semibold text-dark text-center">Statut</th>
                                <th class="fw-semibold text-dark text-end pe-4">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="doc" items="${doctors}">
                                <tr class="hover-shadow">
                                    <td class="ps-4">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary-soft text-primary rounded-2 p-2 me-3">
                                                <i class="fas fa-user-md"></i>
                                            </div>
                                            <div>
                                                <h6 class="fw-semibold text-dark mb-0">Dr. ${doc.fullName}</h6>
                                                <small class="text-muted">${doc.email}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty doc.department}">
                                                <span class="fw-semibold text-dark">${doc.department.name}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted fst-italic">Non assigné</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty doc.specialty}">
                                                <span class="fw-semibold text-dark">${doc.specialty}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted fst-italic">Non spécifié</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-info rounded-pill px-3 py-2">
                                            <i class="fas fa-calendar-check me-1"></i>
                                            ${doc.appointments != null ? doc.appointments.size() : 0}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <form method="post" action="${pageContext.request.contextPath}/admin/doctors" class="d-inline">
                                            <input type="hidden" name="action" value="updateStatus">
                                            <input type="hidden" name="doctorId" value="${doc.id}">
                                            <select name="status" class="form-select form-select-sm rounded-3" onchange="this.form.submit()" style="width: 140px;">
                                                <option value="ACTIVE" ${doc.status.name() == 'ACTIVE' ? 'selected' : ''}>✓ Actif</option>
                                                <option value="INACTIVE" ${doc.status.name() == 'INACTIVE' ? 'selected' : ''}>✗ Inactif</option>
                                                <option value="ON_LEAVE" ${doc.status.name() == 'ON_LEAVE' ? 'selected' : ''}>🏖 Congé</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td class="text-end pe-4">
                                        <div class="btn-group" role="group">
                                            <button onclick="openEditDoctorModal(${doc.id}, '${doc.firstName}', '${doc.lastName}', '${doc.email}', '${doc.phone}', '${doc.specialty}', '${doc.licenseNumber}', '${doc.status.name()}', ${doc.department != null ? doc.department.id : 'null'})"
                                                    class="btn btn-outline-primary btn-sm rounded-3 me-2">
                                                <i class="fas fa-edit me-1"></i>Modifier
                                            </button>
                                            <button onclick="confirmDeleteDoctor(${doc.id}, 'Dr. ${doc.fullName}')"
                                                    class="btn btn-outline-danger btn-sm rounded-3">
                                                <i class="fas fa-trash me-1"></i>Supprimer
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal Création/Modification Docteur -->
<div class="modal fade" id="doctorModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-gradient-primary text-white border-0">
                <h5 class="modal-title fw-semibold" id="doctorModalTitle">
                    <i class="fas fa-user-md me-2"></i>Nouveau Docteur
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <form method="post" action="${pageContext.request.contextPath}/admin/doctors">
                <input type="hidden" name="action" id="doctorAction" value="add">
                <input type="hidden" name="doctorId" id="doctorId">

                <div class="modal-body p-4">
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-user me-1 text-primary"></i> Prénom <span class="text-danger">*</span>
                            </label>
                            <input type="text" name="firstName" id="firstName" class="form-control form-control-lg rounded-3" required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-user me-1 text-primary"></i> Nom <span class="text-danger">*</span>
                            </label>
                            <input type="text" name="lastName" id="lastName" class="form-control form-control-lg rounded-3" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-envelope me-1 text-primary"></i> Email <span class="text-danger">*</span>
                            </label>
                            <input type="email" name="email" id="email" class="form-control form-control-lg rounded-3" required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-phone me-1 text-primary"></i> Téléphone <span class="text-danger">*</span>
                            </label>
                            <input type="tel" name="phone" id="phone" class="form-control form-control-lg rounded-3" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-stethoscope me-1 text-primary"></i> Spécialité
                            </label>
                            <input type="text" name="specialty" id="specialty" class="form-control form-control-lg rounded-3">
                        </div>
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-id-card me-1 text-primary"></i> Numéro de licence
                            </label>
                            <input type="text" name="licenseNumber" id="licenseNumber" class="form-control form-control-lg rounded-3">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-building me-1 text-primary"></i> Département <span class="text-danger">*</span>
                            </label>
                            <select name="departmentId" id="departmentId" class="form-select form-select-lg rounded-3" required>
                                <option value="">Sélectionner...</option>
                                <c:forEach var="dept" items="${departments}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-semibold text-dark mb-2">
                                <i class="fas fa-circle me-1 text-primary"></i> Statut
                            </label>
                            <select name="status" id="status" class="form-select form-select-lg rounded-3">
                                <option value="ACTIVE">Actif</option>
                                <option value="INACTIVE">Inactif</option>
                                <option value="ON_LEAVE">Congé</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3" id="passwordField">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-lock me-1 text-primary"></i> Mot de passe <span class="text-danger">*</span>
                        </label>
                        <input type="password" name="password" id="password" class="form-control form-control-lg rounded-3">
                        <small class="text-muted">Laisser vide pour ne pas changer (en édition)</small>
                    </div>
                </div>

                <div class="modal-footer border-0 bg-light rounded-bottom-3">
                    <button type="button" class="btn btn-secondary rounded-3 px-4" data-bs-dismiss="modal">
                        <i class="fas fa-times me-1"></i>Annuler
                    </button>
                    <button type="submit" class="btn btn-primary rounded-3 px-4" id="doctorSubmitBtn">
                        <i class="fas fa-save me-2"></i>Enregistrer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Confirmation Suppression -->
<div class="modal fade" id="deleteDoctorModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-danger text-white border-0">
                <h5 class="modal-title fw-semibold">
                    <i class="fas fa-exclamation-triangle me-2"></i>Confirmer la suppression
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4 text-center">
                <div class="mb-4">
                    <div class="bg-danger-soft text-danger rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                        <i class="fas fa-trash fa-2x"></i>
                    </div>
                    <h5 class="fw-semibold text-dark mb-2">Êtes-vous sûr ?</h5>
                    <p class="text-muted mb-3">
                        Vous êtes sur le point de supprimer le docteur :
                    </p>
                    <div class="alert alert-danger border-0">
                        <strong id="doctorNameToDelete" class="h6 mb-0"></strong>
                    </div>
                    <p class="text-muted small mt-3">
                        <i class="fas fa-info-circle me-1"></i>Cette action supprimera aussi tous ses rendez-vous.
                    </p>
                </div>
            </div>
            <div class="modal-footer border-0 bg-light rounded-bottom-3 justify-content-center">
                <button type="button" class="btn btn-secondary rounded-3 px-4" data-bs-dismiss="modal">
                    <i class="fas fa-times me-1"></i>Annuler
                </button>
                <form method="post" action="${pageContext.request.contextPath}/admin/doctors" class="d-inline">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="doctorId" id="deleteDoctorId">
                    <button type="submit" class="btn btn-danger rounded-3 px-4">
                        <i class="fas fa-trash me-1"></i>Supprimer
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // ✅ Ouvrir modal création
    function openCreateDoctorModal() {
        document.getElementById('doctorModalTitle').textContent = 'Nouveau Docteur';
        document.getElementById('doctorAction').value = 'add';
        document.getElementById('doctorSubmitBtn').innerHTML = '<i class="fas fa-save me-2"></i>Créer';

        // Reset form
        document.getElementById('doctorId').value = '';
        document.getElementById('firstName').value = '';
        document.getElementById('lastName').value = '';
        document.getElementById('email').value = '';
        document.getElementById('phone').value = '';
        document.getElementById('specialty').value = '';
        document.getElementById('licenseNumber').value = '';
        document.getElementById('departmentId').value = '';
        document.getElementById('status').value = 'ACTIVE';
        document.getElementById('password').value = '';
        document.getElementById('password').required = true;

        new bootstrap.Modal(document.getElementById('doctorModal')).show();
    }

    // ✅ Ouvrir modal édition
    function openEditDoctorModal(id, firstName, lastName, email, phone, specialty, licenseNumber, status, departmentId) {
        document.getElementById('doctorModalTitle').textContent = 'Modifier le Docteur';
        document.getElementById('doctorAction').value = 'edit';
        document.getElementById('doctorSubmitBtn').innerHTML = '<i class="fas fa-save me-2"></i>Modifier';

        document.getElementById('doctorId').value = id;
        document.getElementById('firstName').value = firstName;
        document.getElementById('lastName').value = lastName;
        document.getElementById('email').value = email;
        document.getElementById('phone').value = phone;
        document.getElementById('specialty').value = specialty;
        document.getElementById('licenseNumber').value = licenseNumber;
        document.getElementById('status').value = status;
        document.getElementById('departmentId').value = departmentId || '';
        document.getElementById('password').value = '';
        document.getElementById('password').required = false;

        new bootstrap.Modal(document.getElementById('doctorModal')).show();
    }

    // ✅ Confirmer suppression
    function confirmDeleteDoctor(id, name) {
        document.getElementById('doctorNameToDelete').textContent = name;
        document.getElementById('deleteDoctorId').value = id;
        new bootstrap.Modal(document.getElementById('deleteDoctorModal')).show();
    }

    // ✅ Toast notifications
    function showToast(type, message) {
        const toastId = type === 'success' ? 'successToast' : 'errorToast';
        const messageId = type === 'success' ? 'successMessage' : 'errorMessage';

        document.getElementById(messageId).textContent = message;
        const toast = new bootstrap.Toast(document.getElementById(toastId));
        toast.show();
    }

    // ✅ Check URL parameters for success/error messages
    window.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        const success = urlParams.get('success');
        const error = urlParams.get('error');

        if (success === 'created') {
            showToast('success', 'Docteur créé avec succès !');
        } else if (success === 'updated') {
            showToast('success', 'Docteur modifié avec succès !');
        } else if (success === 'deleted') {
            showToast('success', 'Docteur supprimé avec succès !');
        } else if (success === 'statusUpdated') {
            showToast('success', 'Statut mis à jour avec succès !');
        } else if (error) {
            showToast('error', 'Une erreur est survenue. Veuillez réessayer.');
        }

        // Clean URL
        if (success || error) {
            const cleanUrl = window.location.pathname;
            window.history.replaceState({}, document.title, cleanUrl);
        }
    });
</script>

<style>
    .shadow-sm-hover {
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }
    .shadow-sm-hover:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    }
    .hover-shadow tr {
        transition: all 0.3s ease;
    }
    .hover-shadow tr:hover {
        background-color: #f8fafc;
        transform: translateY(-1px);
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .bg-primary-soft {
        background-color: #dbeafe;
    }
    .bg-success-soft {
        background-color: #d1fae5;
    }
    .bg-danger-soft {
        background-color: #fee2e2;
    }
    .bg-info-soft {
        background-color: #d1f5f3;
    }

    /* Correction du layout */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    /* MARGIN AJOUTÉE ENTRE SIDEBAR ET CONTENU */
    main {
        width: calc(100% - 300px);
        margin-left: 300px;
        padding-left: 20px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        main {
            width: 100%;
            margin-left: 0;
            padding-left: 15px;
        }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>