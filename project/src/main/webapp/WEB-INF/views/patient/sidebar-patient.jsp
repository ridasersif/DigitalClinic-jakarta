<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar Patient -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
    <div class="position-sticky pt-3">
        <div class="sidebar-header text-center py-4">
            <h5 class="text-white mb-1">Clinique Privée</h5>
            <small class="text-light">Espace Patient</small>
        </div>

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'dashboard' ? 'active' : ''}" href="dashboard.jsp">
                    <i class="fas fa-tachometer-alt me-2"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'doctors-list' ? 'active' : ''}" href="doctors-list.jsp">
                    <i class="fas fa-user-md me-2"></i>
                    Nos docteurs
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'book-appointment' ? 'active' : ''}" href="book-appointment.jsp">
                    <i class="fas fa-calendar-plus me-2"></i>
                    Prendre RDV
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'my-appointments' ? 'active' : ''}" href="my-appointments.jsp">
                    <i class="fas fa-list-alt me-2"></i>
                    Mes rendez-vous
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white ${param.active == 'history' ? 'active' : ''}" href="history.jsp">
                    <i class="fas fa-history me-2"></i>
                    Historique médical
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