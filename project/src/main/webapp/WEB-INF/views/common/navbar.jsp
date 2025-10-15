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

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary d-flex align-items-center" href="<%= request.getContextPath() %>/index.jsp">
            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 40px; height: 40px;">
                <i class="fas fa-heartbeat"></i>
            </div>
            Clinique Privée
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link fw-medium text-dark" href="<%= request.getContextPath() %>/index.jsp">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-medium text-dark" href="<%= request.getContextPath() %>/patient/doctors-list">
                        <i class="fas fa-user-md me-1"></i>Nos Docteurs
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-medium text-dark" href="<%= request.getContextPath() %>/patient/book-appointment">
                        <i class="fas fa-calendar-plus me-1"></i>Prendre RDV
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-medium text-dark" href="#">
                        <i class="fas fa-info-circle me-1"></i>À Propos
                    </a>
                </li>
            </ul>

            <div class="navbar-nav align-items-center">
                <% if (currentUser == null) { %>
                <!-- Avant connexion -->
                <a href="<%= request.getContextPath() %>/auth/login" class="btn btn-outline-primary me-2">
                    <i class="fas fa-sign-in-alt me-1"></i>Connexion
                </a>
                <a href="<%= request.getContextPath() %>/auth/register" class="btn btn-primary">
                    <i class="fas fa-user-plus me-1"></i>S'inscrire
                </a>
                <% } else { %>
                <!-- Après connexion -->
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

                <a href="<%= dashboardLink %>" class="btn btn-outline-primary me-3">
                    <i class="fas fa-tachometer-alt me-1"></i>Tableau de Bord
                </a>

                <!-- Menu Profil -->
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center text-dark" href="#" role="button" data-bs-toggle="dropdown">
                        <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 40px; height: 40px;">
                            <i class="fas fa-user"></i>
                        </div>
                        <span class="fw-medium"><%= currentUser.getFirstName() %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                        <li class="dropdown-header text-center fw-bold text-dark py-2">
                            <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
                            <div class="small text-muted"><%= role %></div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="<%= request.getContextPath() %>/profile">
                                <i class="fas fa-user-circle me-2 text-primary"></i>Mon Profil
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <i class="fas fa-cog me-2 text-secondary"></i>Paramètres
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item d-flex align-items-center text-danger" href="<%= request.getContextPath() %>/auth/logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                            </a>
                        </li>
                    </ul>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</nav>