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

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <!-- ✅ Toast Container -->
            <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
                <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert">
                    <div class="d-flex">
                        <div class="toast-body">
                            <i class="fas fa-check-circle me-2"></i>
                            <span id="successMessage"></span>
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                    </div>
                </div>

                <div id="errorToast" class="toast align-items-center text-white bg-danger border-0" role="alert">
                    <div class="d-flex">
                        <div class="toast-body">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            <span id="errorMessage"></span>
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-success">Gestion des Docteurs</h1>
                <button class="btn btn-success" onclick="openCreateDoctorModal()">
                    <i class="fas fa-user-md me-2"></i>Nouveau docteur
                </button>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                            <tr>
                                <th>Docteur</th>
                                <th>Département</th>
                                <th>Spécialité</th>
                                <th>Consultations</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="doc" items="${doctors}">
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <strong>Dr. ${doc.fullName}</strong><br>
                                                <small class="text-muted">${doc.email}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${doc.department != null ? doc.department.name : 'N/A'}</td>
                                    <td>${doc.specialty}</td>
                                    <td>${doc.appointments != null ? doc.appointments.size() : 0}</td>
                                    <td>
                                        <form method="post" action="${pageContext.request.contextPath}/admin/doctors" class="d-inline">
                                            <input type="hidden" name="action" value="updateStatus">
                                            <input type="hidden" name="doctorId" value="${doc.id}">
                                            <select name="status" class="form-select form-select-sm" onchange="this.form.submit()" style="width: 120px;">
                                                <option value="ACTIVE" ${doc.status.name() == 'ACTIVE' ? 'selected' : ''}>✓ Actif</option>
                                                <option value="INACTIVE" ${doc.status.name() == 'INACTIVE' ? 'selected' : ''}>✗ Inactif</option>
                                                <option value="ON_LEAVE" ${doc.status.name() == 'ON_LEAVE' ? 'selected' : ''}>🏖 Congé</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td>
                                        <button onclick="openEditDoctorModal(${doc.id}, '${doc.firstName}', '${doc.lastName}', '${doc.email}', '${doc.phone}', '${doc.specialty}', '${doc.licenseNumber}', '${doc.status.name()}', ${doc.department != null ? doc.department.id : 'null'})"
                                                class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button onclick="confirmDeleteDoctor(${doc.id}, 'Dr. ${doc.fullName}')"
                                                class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-user-slash"></i>
                                        </button>
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

<!-- 🟦 Modal Create/Edit Doctor -->
<div class="modal fade" id="doctorModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title" id="doctorModalTitle">Nouveau Docteur</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <form method="post" action="${pageContext.request.contextPath}/admin/doctors">
                <input type="hidden" name="action" id="doctorAction" value="add">
                <input type="hidden" name="doctorId" id="doctorId">

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Prénom <span class="text-danger">*</span></label>
                            <input type="text" name="firstName" id="firstName" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Nom <span class="text-danger">*</span></label>
                            <input type="text" name="lastName" id="lastName" class="form-control" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <input type="email" name="email" id="email" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Téléphone <span class="text-danger">*</span></label>
                            <input type="tel" name="phone" id="phone" class="form-control" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Spécialité</label>
                            <input type="text" name="specialty" id="specialty" class="form-control">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Numéro de licence</label>
                            <input type="text" name="licenseNumber" id="licenseNumber" class="form-control">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Département <span class="text-danger">*</span></label>
                            <select name="departmentId" id="departmentId" class="form-select" required>
                                <option value="">Sélectionner...</option>
                                <c:forEach var="dept" items="${departments}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Statut</label>
                            <select name="status" id="status" class="form-select">
                                <option value="ACTIVE">Actif</option>
                                <option value="INACTIVE">Inactif</option>
                                <option value="ON_LEAVE">Congé</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3" id="passwordField">
                        <label class="form-label">Mot de passe <span class="text-danger">*</span></label>
                        <input type="password" name="password" id="password" class="form-control">
                        <small class="text-muted">Laisser vide pour ne pas changer (en édition)</small>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-success" id="doctorSubmitBtn">
                        <i class="fas fa-save me-2"></i>Enregistrer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 🔴 Modal Delete Doctor -->
<div class="modal fade" id="deleteDoctorModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Confirmer la suppression
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p class="mb-2">Êtes-vous sûr de vouloir supprimer ce docteur ?</p>
                <div class="alert alert-warning mb-0">
                    <strong id="doctorNameToDelete"></strong>
                </div>
                <p class="text-muted small mt-2 mb-0">
                    <i class="fas fa-info-circle me-1"></i>
                    Cette action supprimera aussi tous ses rendez-vous.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <form method="post" action="${pageContext.request.contextPath}/admin/doctors" class="d-inline">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="doctorId" id="deleteDoctorId">
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash me-2"></i>Supprimer
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

<jsp:include page="../common/footer.jsp"/>