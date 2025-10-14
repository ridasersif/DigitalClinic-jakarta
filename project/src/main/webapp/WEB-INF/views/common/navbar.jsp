<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ma.clinique.project.models.User" %>
<%
    HttpSession currentSession = request.getSession(false);
    User currentUser = null;
    String role = null;

    if (currentSession != null) {
        currentUser = (User) currentSession.getAttribute("currentUser");
        Object roleObj = currentSession.getAttribute("role");
        role = (roleObj != null) ? roleObj.toString() : null;
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="<%= request.getContextPath() %>/index.jsp">
            <i class="fas fa-heartbeat me-2"></i>Clinique Privée
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/index.jsp">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/patient/doctors-list">
                        <i class="fas fa-user-md me-1"></i>Docteurs
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/patient/book-appointment">
                        <i class="fas fa-calendar-plus me-1"></i>Prendre RDV
                    </a>
                </li>
            </ul>

            <div class="navbar-nav">
                <% if (currentUser == null) { %>
                <!-- 🔹 Avant login -->
                <a href="<%= request.getContextPath() %>/auth/login" class="btn btn-outline-light me-2">
                    <i class="fas fa-sign-in-alt me-1"></i>Connexion
                </a>
                <a href="<%= request.getContextPath() %>/auth/register" class="btn btn-light text-primary">
                    <i class="fas fa-user-plus me-1"></i>Inscription
                </a>
                <% } else { %>
                <!-- 🔹 Après login -->
                <%
                    String dashboardLink = "#";
                    if ("ADMIN".equalsIgnoreCase(role)) {
                        dashboardLink = request.getContextPath() + "/admin/dashboard";
                    } else if ("DOCTOR".equalsIgnoreCase(role)) {
                        dashboardLink = request.getContextPath() + "/doctor/dashboard";
                    } else if ("PATIENT".equalsIgnoreCase(role)) {
                        dashboardLink = request.getContextPath() + "/patient/dashboard";
                    }
                %>

                <a href="<%= dashboardLink %>" class="btn btn-light text-primary me-3">
                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                </a>

                <!-- 🟢 Profile Dropdown -->
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <div class="rounded-circle bg-light text-primary d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;">
                            <i class="fas fa-user"></i>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li class="dropdown-header text-center fw-bold">
                            <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/profile">
                            <i class="fas fa-user-circle me-2"></i>Mon Profil
                        </a></li>
                        <li><a class="dropdown-item text-danger" href="<%= request.getContextPath() %>/auth/logout">
                            <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                        </a></li>
                    </ul>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</nav>
