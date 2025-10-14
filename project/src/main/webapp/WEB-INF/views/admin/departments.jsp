<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Gestion des Départements"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="departments"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <!-- ✅ Toast Container pour les notifications -->
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
                <h1 class="h2 fw-bold text-primary">Gestion des Départements</h1>
                <button class="btn btn-primary" onclick="openCreateModal()">
                    <i class="fas fa-plus me-2"></i>Nouveau département
                </button>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                            <tr>
                                <th>Nom</th>
                                <th>Description</th>
                                <th>Docteurs</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="dep" items="${departments}">
                                <tr>
                                    <td><strong>${dep.name}</strong></td>
                                    <td>${dep.description}</td>
                                    <td>${dep.doctors.size()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/departments?action=edit&id=${dep.id}"
                                           class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button onclick="confirmDelete(${dep.id}, '${dep.name}')"
                                                class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
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

<!-- 🟦 Modal Create/Edit Department -->
<div class="modal fade" id="departmentModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">
                    <c:choose>
                        <c:when test="${not empty editDepartment}">Modifier le département</c:when>
                        <c:otherwise>Nouveau département</c:otherwise>
                    </c:choose>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <form method="post" action="${pageContext.request.contextPath}/admin/departments">
                <input type="hidden" name="action" value="${modalAction != null ? modalAction : 'create'}">
                <c:if test="${not empty editDepartment}">
                    <input type="hidden" name="id" value="${editDepartment.id}">
                </c:if>

                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Nom du département</label>
                        <input type="text" name="name" class="form-control"
                               value="${editDepartment != null ? editDepartment.name : ''}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="3">${editDepartment != null ? editDepartment.description : ''}</textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-primary">
                        <c:choose>
                            <c:when test="${not empty editDepartment}">Modifier</c:when>
                            <c:otherwise>Créer</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 🔴 Modal Confirmation Suppression -->
<div class="modal fade" id="deleteModal" tabindex="-1">
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
                <p class="mb-2">Êtes-vous sûr de vouloir supprimer ce département ?</p>
                <div class="alert alert-warning mb-0">
                    <strong id="deptNameToDelete"></strong>
                </div>
                <p class="text-muted small mt-2 mb-0">
                    <i class="fas fa-info-circle me-1"></i>
                    Cette action est irréversible.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <a id="confirmDeleteBtn" href="#" class="btn btn-danger">
                    <i class="fas fa-trash me-2"></i>Supprimer
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // ✅ Fonction pour ouvrir le modal de création
    function openCreateModal() {
        const modal = new bootstrap.Modal(document.getElementById('departmentModal'));

        document.querySelector("#departmentModal input[name='name']").value = '';
        document.querySelector("#departmentModal textarea[name='description']").value = '';
        document.querySelector("#departmentModal input[name='action']").value = 'create';

        const hiddenId = document.querySelector("#departmentModal input[name='id']");
        if(hiddenId) hiddenId.remove();

        modal.show();
    }

    // ✅ Fonction pour confirmer la suppression
    function confirmDelete(deptId, deptName) {
        document.getElementById('deptNameToDelete').textContent = deptName;
        document.getElementById('confirmDeleteBtn').href =
            '${pageContext.request.contextPath}/admin/departments?action=delete&id=' + deptId;

        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }

    // ✅ Fonction pour afficher les toasts
    function showToast(type, message) {
        const toastId = type === 'success' ? 'successToast' : 'errorToast';
        const messageId = type === 'success' ? 'successMessage' : 'errorMessage';

        document.getElementById(messageId).textContent = message;
        const toast = new bootstrap.Toast(document.getElementById(toastId));
        toast.show();
    }

    // ✅ Ouvrir le modal d'édition automatiquement
    window.addEventListener('DOMContentLoaded', function() {
        <c:if test="${showModal == true}">
        const editModal = new bootstrap.Modal(document.getElementById('departmentModal'));
        editModal.show();
        </c:if>

        // ✅ Vérifier les messages de succès/erreur dans l'URL
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

        // ✅ Nettoyer l'URL après affichage du message
        if (success || error) {
            const cleanUrl = window.location.pathname;
            window.history.replaceState({}, document.title, cleanUrl);
        }
    });
</script>

<jsp:include page="../common/footer.jsp"/>