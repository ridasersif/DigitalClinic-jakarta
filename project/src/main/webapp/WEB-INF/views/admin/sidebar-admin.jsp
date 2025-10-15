<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar Admin Moderne FIXÉE -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-white sidebar collapse border-end vh-100 position-fixed">
    <div class="position-sticky pt-3 h-100 d-flex flex-column">
        <!-- En-tête Sidebar -->
        <div class="sidebar-header text-center py-4 px-3 border-bottom">
            <div class="bg-gradient-primary rounded-3 p-3 mx-auto mb-3" style="width: 60px; height: 60px;">
                <i class="fas fa-heartbeat fa-xl text-white"></i>
            </div>
            <h6 class="fw-bold text-dark mb-1">Clinique Privée</h6>
            <span class="badge bg-primary-soft text-primary small">Administration</span>
        </div>

        <!-- Navigation Principale -->
        <ul class="nav flex-column mt-4 flex-grow-1">
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'dashboard' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/dashboard">
                    <div class="sidebar-icon">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    <span class="sidebar-text">Tableau de bord</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'departments' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/departments">
                    <div class="sidebar-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <span class="sidebar-text">Départements</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'doctors' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/doctors">
                    <div class="sidebar-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <span class="sidebar-text">Docteurs</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'rooms' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/rooms">
                    <div class="sidebar-icon">
                        <i class="fas fa-door-open"></i>
                    </div>
                    <span class="sidebar-text">Salles</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'appointments' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/appointments">
                    <div class="sidebar-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <span class="sidebar-text">Rendez-vous</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'statistics' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/admin/statistics">
                    <div class="sidebar-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <span class="sidebar-text">Statistiques</span>
                </a>
            </li>
        </ul>

        <!-- Section Utilisateur -->
        <div class="sidebar-footer mt-auto pt-4 border-top">
            <div class="user-info px-3 mb-3">
                <div class="d-flex align-items-center">
                    <div class="user-avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <div class="user-details">
                        <div class="fw-semibold text-dark small">Administrateur</div>
                        <div class="text-muted extra-small">Connecté</div>
                    </div>
                </div>
            </div>

            <div class="nav flex-column">
                <a class="nav-link sidebar-link" href="${pageContext.request.contextPath}/index.jsp">
                    <div class="sidebar-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <span class="sidebar-text">Accueil public</span>
                </a>
                <a class="nav-link sidebar-link text-danger" href="${pageContext.request.contextPath}/auth/logout">
                    <div class="sidebar-icon">
                        <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <span class="sidebar-text">Déconnexion</span>
                </a>
            </div>
        </div>
    </div>
</nav>

<style>
    :root {
        --primary: #2563eb;
        --primary-dark: #1e40af;
        --primary-soft: #dbeafe;
        --sidebar-width: 280px;
    }

    .sidebar {
        width: var(--sidebar-width);
        background: #ffffff;
        box-shadow: 2px 0 10px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        z-index: 1000;
        overflow-y: auto;
    }

    .sidebar-link {
        display: flex;
        align-items: center;
        padding: 0.75rem 1rem;
        color: #64748b;
        text-decoration: none;
        border-radius: 8px;
        margin: 0.25rem 0.75rem;
        transition: all 0.3s ease;
        border: none;
        position: relative;
    }

    .sidebar-link:hover {
        background-color: var(--primary-soft);
        color: var(--primary);
        transform: translateX(5px);
    }

    .sidebar-link.active {
        background: linear-gradient(135deg, var(--primary), var(--primary-dark));
        color: white;
        box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
    }

    .sidebar-icon {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f8fafc;
        border-radius: 8px;
        margin-right: 12px;
        transition: all 0.3s ease;
    }

    .sidebar-link:hover .sidebar-icon {
        background: white;
        transform: scale(1.1);
    }

    .sidebar-link.active .sidebar-icon {
        background: rgba(255, 255, 255, 0.2);
    }

    .sidebar-text {
        font-weight: 500;
        font-size: 0.9rem;
        flex: 1;
    }

    .bg-gradient-primary {
        background: linear-gradient(135deg, var(--primary), var(--primary-dark));
    }

    .bg-primary-soft {
        background-color: var(--primary-soft);
    }

    .user-avatar {
        background: linear-gradient(135deg, var(--primary), var(--primary-dark));
    }

    .extra-small {
        font-size: 0.75rem;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .sidebar {
            transform: translateX(-100%);
        }

        .sidebar.show {
            transform: translateX(0);
        }
    }
    /* ✅ Personnalisation du Scrollbar du Sidebar */
    #sidebar::-webkit-scrollbar {
        width: 10px;
    }

    #sidebar::-webkit-scrollbar-track {
        background: #f1f5f9;
        border-radius: 10px;
    }

    #sidebar::-webkit-scrollbar-thumb {
        background: linear-gradient(180deg, #3b82f6, #1e3a8a);
        border-radius: 10px;
        box-shadow: inset 0 0 3px rgba(255,255,255,0.3);
        transition: all 0.3s ease;
    }

    #sidebar::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(180deg, #2563eb, #1e40af);
    }

</style>