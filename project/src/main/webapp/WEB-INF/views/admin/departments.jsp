<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Gestion des Départements - Admin"/>
</jsp:include>

<!-- Container principal avec margin pour la sidebar fixe -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar fixe -->
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="departments"/>
        </jsp:include>

        <!-- Contenu principal avec offset pour la sidebar + MARGIN AJOUTÉE -->
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
                    <h1 class="h3 fw-bold text-dark mb-1">Gestion des Départements</h1>
                    <p class="text-muted mb-0">Administrez les départements médicaux de votre clinique</p>
                </div>
                <button class="btn btn-primary btn-lg px-4" onclick="openCreateModal()">
                    <i class="fas fa-plus-circle me-2"></i>Nouveau département
                </button>
            </div>

            <!-- Cartes de Statistiques -->
            <div class="row mb-4">
                <div class="col-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-primary-soft text-primary rounded-3 p-3">
                                        <i class="fas fa-building fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Total Départements</h5>
                                    <h3 class="fw-bold text-dark mb-0">${departments.size()}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 mb-4">
                    <div class="card border-0 shadow-sm-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <div class="bg-success-soft text-success rounded-3 p-3">
                                        <i class="fas fa-user-md fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Médecins Actifs</h5>
                                    <h3 class="fw-bold text-dark mb-0">24</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tableau des Départements -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title mb-0 fw-semibold text-dark">
                        <i class="fas fa-list me-2 text-primary"></i>
                        Liste des Départements
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4 fw-semibold text-dark">Nom du Département</th>
                                <th class="fw-semibold text-dark">Description</th>
                                <th class="fw-semibold text-dark text-center">Médecins</th>
                                <th class="fw-semibold text-dark text-center">Statut</th>
                                <th class="fw-semibold text-dark text-end pe-4">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="dep" items="${departments}">
                                <tr class="hover-shadow">
                                    <td class="ps-4">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary-soft text-primary rounded-2 p-2 me-3">
                                                <i class="fas fa-building"></i>
                                            </div>
                                            <div>
                                                <h6 class="fw-semibold text-dark mb-0">${dep.name}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="text-muted">${dep.description}</span>
                                    </td>
                                    <td class="text-center">
                                            <span class="badge bg-primary rounded-pill px-3 py-2">
                                                ${dep.doctors != null ? dep.doctors.size() : 0} médecins
                                            </span>
                                    </td>
                                    <td class="text-center">
                                            <span class="badge bg-success rounded-pill px-3 py-2">
                                                <i class="fas fa-circle me-1" style="font-size: 0.5rem;"></i>
                                                Actif
                                            </span>
                                    </td>
                                    <td class="text-end pe-4">
                                        <div class="btn-group" role="group">
                                            <button onclick="openEditModal(${dep.id}, '${dep.name}', '${dep.description}')"
                                                    class="btn btn-outline-primary btn-sm rounded-3 me-2">
                                                <i class="fas fa-edit me-1"></i>Modifier
                                            </button>
                                            <button onclick="confirmDelete(${dep.id}, '${dep.name}')"
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

<!-- Modal Création/Modification Département -->
<div class="modal fade" id="departmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-gradient-primary text-white border-0">
                <h5 class="modal-title fw-semibold">
                    <i class="fas fa-building me-2"></i>
                    <span id="modalTitle">Nouveau Département</span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/admin/departments" id="departmentForm">
                <input type="hidden" name="action" value="create" id="formAction">
                <input type="hidden" name="id" id="departmentId">

                <div class="modal-body p-4">
                    <div class="mb-4">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-tag me-1 text-primary"></i>
                            Nom du département
                        </label>
                        <input type="text" name="name" class="form-control form-control-lg rounded-3"
                               placeholder="Ex: Cardiologie" required id="departmentName">
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-align-left me-1 text-primary"></i>
                            Description
                        </label>
                        <textarea name="description" class="form-control rounded-3"
                                  rows="4" placeholder="Description du département..."
                                  id="departmentDescription"></textarea>
                    </div>
                </div>
                <div class="modal-footer border-0 bg-light rounded-bottom-3">
                    <button type="button" class="btn btn-secondary rounded-3 px-4" data-bs-dismiss="modal">
                        <i class="fas fa-times me-1"></i>Annuler
                    </button>
                    <button type="submit" class="btn btn-primary rounded-3 px-4" id="submitBtn">
                        <i class="fas fa-check me-1"></i>
                        <span id="submitBtnText">Créer</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Confirmation Suppression -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-danger text-white border-0">
                <h5 class="modal-title fw-semibold">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Confirmation de suppression
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4 text-center">
                <div class="mb-4">
                    <div class="bg-danger-soft text-danger rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                         style="width: 80px; height: 80px;">
                        <i class="fas fa-trash fa-2x"></i>
                    </div>
                    <h5 class="fw-semibold text-dark mb-2">Êtes-vous sûr ?</h5>
                    <p class="text-muted mb-3">
                        Vous êtes sur le point de supprimer le département :
                    </p>
                    <div class="alert alert-danger border-0">
                        <strong id="deptNameToDelete" class="h6 mb-0"></strong>
                    </div>
                    <p class="text-muted small mt-3">
                        <i class="fas fa-info-circle me-1"></i>
                        Cette action est irréversible et supprimera toutes les données associées.
                    </p>
                </div>
            </div>
            <div class="modal-footer border-0 bg-light rounded-bottom-3 justify-content-center">
                <button type="button" class="btn btn-secondary rounded-3 px-4" data-bs-dismiss="modal">
                    <i class="fas fa-times me-1"></i>Annuler
                </button>
                <a id="confirmDeleteBtn" href="#" class="btn btn-danger rounded-3 px-4">
                    <i class="fas fa-trash me-1"></i>Supprimer définitivement
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // Fonctions pour la gestion des modals
    function openCreateModal() {
        console.log('Opening create modal...');
        document.getElementById('modalTitle').textContent = 'Nouveau Département';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitBtnText').textContent = 'Créer';
        document.getElementById('departmentId').value = '';
        document.getElementById('departmentName').value = '';
        document.getElementById('departmentDescription').value = '';

        const modalElement = document.getElementById('departmentModal');
        if (modalElement) {
            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        } else {
            console.error('Modal element not found!');
        }
    }

    function openEditModal(depId, depName, depDescription) {
        console.log('Opening edit modal for department:', depId, depName, depDescription);

        // Échapper les caractères spéciaux pour éviter les problèmes
        const escapedName = depName.replace(/'/g, "\\'");
        const escapedDescription = depDescription ? depDescription.replace(/'/g, "\\'") : '';

        document.getElementById('modalTitle').textContent = 'Modifier le Département';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitBtnText').textContent = 'Modifier';
        document.getElementById('departmentId').value = depId;
        document.getElementById('departmentName').value = escapedName;
        document.getElementById('departmentDescription').value = escapedDescription;

        const modalElement = document.getElementById('departmentModal');
        if (modalElement) {
            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        } else {
            console.error('Modal element not found!');
        }
    }

    function confirmDelete(depId, depName) {
        console.log('Confirming delete for department:', depId, depName);
        document.getElementById('deptNameToDelete').textContent = depName;
        document.getElementById('confirmDeleteBtn').href =
            '${pageContext.request.contextPath}/admin/departments?action=delete&id=' + depId;

        const modalElement = document.getElementById('deleteModal');
        if (modalElement) {
            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        } else {
            console.error('Delete modal element not found!');
        }
    }

    // Gestion des notifications
    function showToast(type, message) {
        const toastId = type === 'success' ? 'successToast' : 'errorToast';
        const messageId = type === 'success' ? 'successMessage' : 'errorMessage';

        document.getElementById(messageId).textContent = message;
        const toastElement = document.getElementById(toastId);
        if (toastElement) {
            const toast = new bootstrap.Toast(toastElement);
            toast.show();
        }
    }

    // Initialisation
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Page loaded, initializing...');

        // Gestion des paramètres URL pour les notifications
        const urlParams = new URLSearchParams(window.location.search);
        const success = urlParams.get('success');
        const error = urlParams.get('error');

        if (success === 'created') {
            showToast('success', 'Département créé avec succès !');
        } else if (success === 'updated') {
            showToast('success', 'Département modifié avec succès !');
        } else if (success === 'deleted') {
            showToast('success', 'Département supprimé avec succès !');
        } else if (error) {
            showToast('error', 'Une erreur est survenue. Veuillez réessayer.');
        }

        // Nettoyer l'URL
        if (success || error) {
            window.history.replaceState({}, document.title, window.location.pathname);
        }

        // Test: Vérifier que Bootstrap est chargé
        if (typeof bootstrap !== 'undefined') {
            console.log('Bootstrap loaded successfully');
        } else {
            console.error('Bootstrap not loaded!');
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

    .bg-primary-soft { background-color: #dbeafe; }
    .bg-success-soft { background-color: #d1fae5; }
    .bg-danger-soft { background-color: #fee2e2; }

    /* Correction du layout */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    .container-fluid {
        padding-left: 0 !important;
        padding-right: 0 !important;
    }

    /* MARGIN AJOUTÉE ENTRE SIDEBAR ET CONTENU */
    main {
        width: calc(100% - 300px); /* Augmenté de 280px à 300px */
        margin-left: 300px; /* Augmenté de 280px à 300px */
        padding-left: 20px; /* ESPACE AJOUTÉ ICI */
    }

    /* Responsive */
    @media (max-width: 768px) {
        main {
            width: 100%;
            margin-left: 0;
            padding-left: 15px; /* Ajustement pour mobile */
        }

        .sidebar {
            transform: translateX(-100%);
        }

        .sidebar.show {
            transform: translateX(0);
        }
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<!-- PAS DE FOOTER INCLUS DANS LE DASHBOARD -->