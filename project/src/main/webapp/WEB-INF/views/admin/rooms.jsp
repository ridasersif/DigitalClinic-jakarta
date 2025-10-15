<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Gestion des Salles - Admin"/>
</jsp:include>

<!-- Container principal avec margin pour la sidebar fixe -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar fixe -->
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="rooms"/>
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
                    <h1 class="h3 fw-bold text-dark mb-1">Gestion des Salles</h1>
                    <p class="text-muted mb-0">Administrez les salles de consultation de votre clinique</p>
                </div>
                <button class="btn btn-primary btn-lg px-4" onclick="openCreateModal()">
                    <i class="fas fa-plus-circle me-2"></i>Nouvelle salle
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
                                        <i class="fas fa-door-open fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Total Salles</h5>
                                    <h3 class="fw-bold text-dark mb-0">${rooms.size()}</h3>
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
                                        <i class="fas fa-check-circle fa-lg"></i>
                                    </div>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h5 class="card-title text-muted mb-1">Salles Libres</h5>
                                    <h3 class="fw-bold text-dark mb-0">
                                        <c:set var="freeRooms" value="0" />
                                        <c:forEach var="room" items="${rooms}">
                                            <c:if test="${room.status == 'LIBRE'}">
                                                <c:set var="freeRooms" value="${freeRooms + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        ${freeRooms}
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tableau des Salles -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title mb-0 fw-semibold text-dark">
                        <i class="fas fa-list me-2 text-primary"></i> Liste des Salles
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4 fw-semibold text-dark">Nom de la Salle</th>
                                <th class="fw-semibold text-dark text-center">Capacité</th>
                                <th class="fw-semibold text-dark">Département</th>
                                <th class="fw-semibold text-dark text-center">Statut</th>
                                <th class="fw-semibold text-dark text-end pe-4">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="room" items="${rooms}">
                                <tr class="hover-shadow">
                                    <td class="ps-4">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary-soft text-primary rounded-2 p-2 me-3">
                                                <i class="fas fa-door-open"></i>
                                            </div>
                                            <div>
                                                <h6 class="fw-semibold text-dark mb-0">${room.name}</h6>
                                                <small class="text-muted">Salle ${room.id}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                            <span class="badge bg-info rounded-pill px-3 py-2">
                                                <i class="fas fa-users me-1"></i>
                                                ${room.capacity} places
                                            </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty room.department}">
                                                <span class="fw-semibold text-dark">${room.department.name}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted fst-italic">Non assigné</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${room.status == 'LIBRE'}">
                                                    <span class="badge bg-success rounded-pill px-3 py-2">
                                                        <i class="fas fa-circle me-1" style="font-size: 0.5rem;"></i> Libre
                                                    </span>
                                            </c:when>
                                            <c:otherwise>
                                                    <span class="badge bg-danger rounded-pill px-3 py-2">
                                                        <i class="fas fa-circle me-1" style="font-size: 0.5rem;"></i> Occupée
                                                    </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-end pe-4">
                                        <div class="btn-group" role="group">
                                            <button onclick="openEditModal(
                                                ${room.id},
                                                    '${room.name}',
                                                ${room.capacity},
                                                    '${room.department != null ? room.department.id : ""}',
                                                    '${room.status}'
                                                    )" class="btn btn-outline-primary btn-sm rounded-3 me-2">
                                                <i class="fas fa-edit me-1"></i>Modifier
                                            </button>
                                            <button onclick="confirmDelete(${room.id}, '${room.name}')" class="btn btn-outline-danger btn-sm rounded-3">
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

<!-- Modal Création/Modification Salle -->
<div class="modal fade" id="roomModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-gradient-primary text-white border-0">
                <h5 class="modal-title fw-semibold">
                    <i class="fas fa-door-open me-2"></i>
                    <span id="modalTitle">Nouvelle Salle</span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/admin/rooms" id="roomForm">
                <input type="hidden" name="action" value="create" id="formAction">
                <input type="hidden" name="id" id="roomId">
                <div class="modal-body p-4">
                    <div class="mb-4">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-tag me-1 text-primary"></i> Nom de la salle
                        </label>
                        <input type="text" name="name" class="form-control form-control-lg rounded-3"
                               placeholder="Ex: Salle de Consultation A" required id="roomName">
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-users me-1 text-primary"></i> Capacité
                        </label>
                        <input type="number" name="capacity" class="form-control form-control-lg rounded-3"
                               placeholder="Ex: 10" min="1" required id="roomCapacity">
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-building me-1 text-primary"></i> Département
                        </label>
                        <select name="departmentId" class="form-select form-select-lg rounded-3" id="roomDepartment">
                            <option value="">-- Sélectionner un département --</option>
                            <c:if test="${not empty departments}">
                                <c:forEach var="dept" items="${departments}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="mb-3" id="statusField" style="display: none;">
                        <label class="form-label fw-semibold text-dark mb-2">
                            <i class="fas fa-circle me-1 text-primary"></i> Statut
                        </label>
                        <select name="status" class="form-select form-select-lg rounded-3" id="roomStatus">
                            <option value="LIBRE">Libre</option>
                            <option value="OCCUPEE">Occupée</option>
                        </select>
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
                    <i class="fas fa-exclamation-triangle me-2"></i> Confirmation de suppression
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
                        Vous êtes sur le point de supprimer la salle :
                    </p>
                    <div class="alert alert-danger border-0">
                        <strong id="roomNameToDelete" class="h6 mb-0"></strong>
                    </div>
                    <p class="text-muted small mt-3">
                        <i class="fas fa-info-circle me-1"></i> Cette action est irréversible et supprimera toutes les données associées.
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
        document.getElementById('modalTitle').textContent = 'Nouvelle Salle';
        document.getElementById('formAction').value = 'create';
        document.getElementById('submitBtnText').textContent = 'Créer';
        document.getElementById('roomId').value = '';
        document.getElementById('roomName').value = '';
        document.getElementById('roomCapacity').value = '';
        document.getElementById('roomDepartment').selectedIndex = 0;
        document.getElementById('statusField').style.display = 'none';

        const modalElement = document.getElementById('roomModal');
        if (modalElement) {
            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        } else {
            console.error('Modal element not found!');
        }
    }

    function openEditModal(roomId, roomName, roomCapacity, departmentId, roomStatus) {
        console.log('Opening edit modal for room:', roomId, roomName, roomCapacity, departmentId, roomStatus);

        document.getElementById('modalTitle').textContent = 'Modifier la Salle';
        document.getElementById('formAction').value = 'update';
        document.getElementById('submitBtnText').textContent = 'Modifier';
        document.getElementById('roomId').value = roomId;
        document.getElementById('roomName').value = roomName;
        document.getElementById('roomCapacity').value = roomCapacity;
        document.getElementById('roomStatus').value = roomStatus;
        document.getElementById('statusField').style.display = 'block';

        // Sélectionner le département
        if (departmentId) {
            const departmentSelect = document.getElementById('roomDepartment');
            for (let i = 0; i < departmentSelect.options.length; i++) {
                if (departmentSelect.options[i].value === departmentId) {
                    departmentSelect.selectedIndex = i;
                    break;
                }
            }
        }

        const modalElement = document.getElementById('roomModal');
        if (modalElement) {
            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        } else {
            console.error('Modal element not found!');
        }
    }

    function confirmDelete(roomId, roomName) {
        console.log('Confirming delete for room:', roomId, roomName);
        document.getElementById('roomNameToDelete').textContent = roomName;
        document.getElementById('confirmDeleteBtn').href = '${pageContext.request.contextPath}/admin/rooms?action=delete&id=' + roomId;

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
            showToast('success', 'Salle créée avec succès !');
        } else if (success === 'updated') {
            showToast('success', 'Salle modifiée avec succès !');
        } else if (success === 'deleted') {
            showToast('success', 'Salle supprimée avec succès !');
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
    .bg-primary-soft {
        background-color: #dbeafe;
    }
    .bg-success-soft {
        background-color: #d1fae5;
    }
    .bg-warning-soft {
        background-color: #fef3c7;
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
    .container-fluid {
        padding-left: 0 !important;
        padding-right: 0 !important;
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