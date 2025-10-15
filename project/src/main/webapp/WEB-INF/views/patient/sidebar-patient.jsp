<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar Patient Moderne FIXÉE -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-white sidebar collapse border-end vh-100 position-fixed">
    <div class="position-sticky pt-3 h-100 d-flex flex-column">
        <!-- En-tête Sidebar -->
        <div class="sidebar-header text-center py-4 px-3 border-bottom">
            <div class="bg-gradient-success rounded-3 p-3 mx-auto mb-3" style="width: 60px; height: 60px;">
                <i class="fas fa-user-injured fa-xl text-white"></i>
            </div>
            <h6 class="fw-bold text-dark mb-1">Clinique Privée</h6>
            <span class="badge bg-success-soft text-success small">Espace Patient</span>
        </div>

        <!-- Navigation Principale -->
        <ul class="nav flex-column mt-4 flex-grow-1">
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'dashboard' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/patient/dashboard">
                    <div class="sidebar-icon">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    <span class="sidebar-text">Tableau de bord</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'doctors-list' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/patient/doctors-list">
                    <div class="sidebar-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <span class="sidebar-text">Nos docteurs</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'book-appointment' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/patient/book-appointment?action=book">
                    <div class="sidebar-icon">
                        <i class="fas fa-calendar-plus"></i>
                    </div>
                    <span class="sidebar-text">Prendre RDV</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'my-appointments' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/patient/my-appointments">
                    <div class="sidebar-icon">
                        <i class="fas fa-list-alt"></i>
                    </div>
                    <span class="sidebar-text">Mes rendez-vous</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link sidebar-link ${param.active == 'history' ? 'active' : ''}"
                   href="${pageContext.request.contextPath}/patient/history">
                    <div class="sidebar-icon">
                        <i class="fas fa-history"></i>
                    </div>
                    <span class="sidebar-text">Historique médical</span>
                </a>
            </li>
        </ul>

        <!-- Section Utilisateur -->
        <div class="sidebar-footer mt-auto pt-4 border-top">
            <div class="user-info px-3 mb-3">
                <div class="d-flex align-items-center">
                    <div class="user-avatar bg-success text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="user-details">
                        <div class="fw-semibold text-dark small">Patient</div>
                        <div class="text-muted extra-small">Connecté</div>
                    </div>
                </div>
            </div>

            <div class="nav flex-column">
                <a class="nav-link sidebar-link" href="../index.jsp">
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
        --success: #10b981;
        --success-dark: #047857;
        --success-soft: #d1fae5;
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
        background-color: var(--success-soft);
        color: var(--success);
        transform: translateX(5px);
    }

    .sidebar-link.active {
        background: linear-gradient(135deg, var(--success), var(--success-dark));
        color: white;
        box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
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

    .bg-gradient-success {
        background: linear-gradient(135deg, var(--success), var(--success-dark));
    }

    .bg-success-soft {
        background-color: var(--success-soft);
    }

    .user-avatar {
        background: linear-gradient(135deg, var(--success), var(--success-dark));
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
        background: linear-gradient(180deg, #10b981, #047857);
        border-radius: 10px;
        box-shadow: inset 0 0 3px rgba(255,255,255,0.3);
        transition: all 0.3s ease;
    }

    #sidebar::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(180deg, #059669, #065f46);
    }
</style>