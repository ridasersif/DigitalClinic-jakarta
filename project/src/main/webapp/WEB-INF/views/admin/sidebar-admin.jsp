<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar Admin -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
    <div class="position-sticky pt-3">
        <div class="sidebar-header text-center py-4">
            <h5 class="text-white mb-1">Clinique Privée</h5>
            <small class="text-light">Administration</small>
        </div>

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="fas fa-tachometer-alt me-2"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'departments' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/departments"
                >
                    <i class="fas fa-building me-2"></i>
                    Départements
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'doctors' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/doctors">
                    <i class="fas fa-user-md me-2"></i>
                    Docteurs
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'rooms' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/rooms">
                    <i class="fas fa-door-open me-2"></i>
                    Salles
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'appointments' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/appointments">
                    <i class="fas fa-calendar-alt me-2"></i>
                    Rendez-vous
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'statistics' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/statistics">
                    <i class="fas fa-chart-bar me-2"></i>
                    Statistiques
                </a>
            </li>
        </ul>

        <div class="sidebar-footer mt-4 pt-3 border-top border-secondary">
            <div class="nav flex-column">
                <a class="nav-link text-white" href="../index.jsp">
                    <i class="fas fa-home me-2"></i>
                    Accueil public
                </a>
                <a class="nav-link text-white" href="../auth/login.jsp">
                    <i class="fas fa-sign-out-alt me-2"></i>
                    Déconnexion
                </a>
            </div>
        </div>
    </div>
</nav>

<style>
    .sidebar {
        min-height: 100vh;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .sidebar .nav-link {
        color: #adb5bd;
        padding: 0.75rem 1rem;
        border-left: 3px solid transparent;
        transition: all 0.3s;
    }
    .sidebar .nav-link:hover {
        color: #fff;
        background-color: #495057;
        border-left-color: var(--primary);
    }
    .sidebar .nav-link.active {
        color: #fff;
        background-color: var(--primary);
        border-left-color: var(--primary);
    }
</style>