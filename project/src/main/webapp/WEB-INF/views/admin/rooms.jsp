<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Gestion des Salles"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="sidebar-admin.jsp">
            <jsp:param name="active" value="rooms"/>
        </jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 text-primary fw-bold">Gestion des Salles</h1>
                <button class="btn btn-primary" onclick="openCreateModal()">
                    <i class="fas fa-plus me-2"></i> Nouvelle Salle
                </button>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                            <tr>
                                <th>Nom</th>
                                <th>Capacité</th>
                                <th>Département</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty rooms}">
                                <c:forEach var="room" items="${rooms}">
                                    <tr>
                                        <td>${room.name}</td>
                                        <td>${room.capacity}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty room.department}">
                                                    ${room.department.name}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Non assigné</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${room.status == 'LIBRE'}">
                                                    <span class="badge bg-success">Libre</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger">Occupée</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/rooms?action=edit&id=${room.id}"
                                               class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button onclick="confirmDelete(${room.id}, '${room.name}')"
                                                    class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal Create/Update Room -->
<div class="modal fade" id="roomModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">
                    <c:choose>
                        <c:when test="${not empty editRoom}">Modifier la Salle</c:when>
                        <c:otherwise>Nouvelle Salle</c:otherwise>
                    </c:choose>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <form method="post" action="${pageContext.request.contextPath}/admin/rooms">
                <input type="hidden" name="action" value="${modalAction != null ? modalAction : 'create'}">
                <c:if test="${not empty editRoom}">
                    <input type="hidden" name="id" value="${editRoom.id}">
                </c:if>

                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Nom</label>
                        <input type="text" name="name" class="form-control"
                               value="${editRoom != null ? editRoom.name : ''}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Capacité</label>
                        <input type="number" name="capacity" class="form-control"
                               value="${editRoom != null ? editRoom.capacity : ''}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Département</label>
                        <select name="departmentId" class="form-select" required>
                            <option value="">-- Sélectionner un département --</option>
                            <c:if test="${not empty departments}">
                                <c:forEach var="dept" items="${departments}">
                                    <option value="${dept.id}"
                                        ${editRoom != null && editRoom.department != null && editRoom.department.id == dept.id ? 'selected' : ''}>
                                            ${dept.name}
                                    </option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>

                    <c:if test="${not empty editRoom}">
                        <div class="mb-3">
                            <label class="form-label">Statut</label>
                            <select name="status" class="form-select">
                                <option value="LIBRE" ${editRoom.status == 'LIBRE' ? 'selected' : ''}>Libre</option>
                                <option value="OCCUPEE" ${editRoom.status == 'OCCUPEE' ? 'selected' : ''}>Occupée</option>
                            </select>
                        </div>
                    </c:if>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-primary">
                        <c:choose>
                            <c:when test="${not empty editRoom}">Modifier</c:when>
                            <c:otherwise>Créer</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Delete Room -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Confirmer la suppression</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Voulez-vous vraiment supprimer cette salle ?</p>
                <strong id="roomNameToDelete"></strong>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <a id="confirmDeleteBtn" href="#" class="btn btn-danger">Supprimer</a>
            </div>
        </div>
    </div>
</div>

<script>
    function openCreateModal() {
        const modal = new bootstrap.Modal(document.getElementById('roomModal'));
        document.querySelector("#roomModal input[name='name']").value = '';
        document.querySelector("#roomModal input[name='capacity']").value = '';
        document.querySelector("#roomModal input[name='action']").value = 'create';
        document.querySelector("#roomModal select[name='departmentId']").selectedIndex = 0;
        modal.show();
    }

    function confirmDelete(roomId, roomName) {
        document.getElementById('roomNameToDelete').textContent = roomName;
        document.getElementById('confirmDeleteBtn').href =
            '${pageContext.request.contextPath}/admin/rooms?action=delete&id=' + roomId;

        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }

    window.addEventListener('DOMContentLoaded', function() {
        <c:if test="${showModal == true}">
        const editModal = new bootstrap.Modal(document.getElementById('roomModal'));
        editModal.show();
        </c:if>
    });
</script>

<jsp:include page="../common/footer.jsp"/>
