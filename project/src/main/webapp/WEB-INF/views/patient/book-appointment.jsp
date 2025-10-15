slm daba hada howa sedbare yak
hawal tbadal dok alwn dyl page dyla book bach yjiw mtnas9in m3a sidbar ok
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
------------------------------------
badal liya alwan ou style dyl hadi bach yji mtnasa9 m3a sidbar ko
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Prendre un Rendez-vous"/>
</jsp:include>

<!-- Container principal avec sidebar -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Patient -->
        <jsp:include page="sidebar-patient.jsp">
            <jsp:param name="active" value="book-appointment"/>
        </jsp:include>

        <!-- Contenu principal avec offset pour la sidebar -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px);">

            <style>
                :root {
                    --primary-blue: #2563eb;
                    --primary-dark: #1e40af;
                    --primary-light: #dbeafe;
                    --secondary-teal: #0d9488;
                    --accent-purple: #7c3aed;
                    --success-green: #059669;
                    --warning-orange: #ea580c;
                    --error-red: #dc2626;
                    --gray-50: #f9fafb;
                    --gray-100: #f3f4f6;
                    --gray-200: #e5e7eb;
                    --gray-600: #4b5563;
                    --gray-800: #1f2937;
                    --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
                    --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                    --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
                    --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
                }

                .professional-container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 2rem 1rem;
                }

                .page-header {
                    text-align: center;
                    margin-bottom: 3rem;
                    padding-bottom: 2rem;
                    border-bottom: 1px solid var(--gray-200);
                }

                .page-title {
                    font-size: 2.5rem;
                    font-weight: 700;
                    color: var(--gray-800);
                    margin-bottom: 0.5rem;
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

                .page-subtitle {
                    font-size: 1.1rem;
                    color: var(--gray-600);
                    font-weight: 400;
                }

                .professional-card {
                    background: white;
                    border-radius: 12px;
                    padding: 2rem;
                    margin-bottom: 2rem;
                    box-shadow: var(--shadow-lg);
                    border: 1px solid var(--gray-200);
                    transition: all 0.3s ease;
                }

                .professional-card:hover {
                    box-shadow: var(--shadow-xl);
                    transform: translateY(-2px);
                }

                .card-header {
                    display: flex;
                    align-items: center;
                    margin-bottom: 1.5rem;
                    padding-bottom: 1rem;
                    border-bottom: 1px solid var(--gray-200);
                }

                .card-icon {
                    width: 48px;
                    height: 48px;
                    border-radius: 12px;
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-right: 1rem;
                    color: white;
                    font-size: 1.25rem;
                }

                .card-title {
                    font-size: 1.5rem;
                    font-weight: 600;
                    color: var(--gray-800);
                    margin: 0;
                }

                .form-group {
                    margin-bottom: 1.5rem;
                }

                .form-label {
                    display: block;
                    font-weight: 600;
                    color: var(--gray-800);
                    margin-bottom: 0.5rem;
                    font-size: 0.95rem;
                }

                .form-control {
                    width: 100%;
                    padding: 0.75rem 1rem;
                    border: 2px solid var(--gray-200);
                    border-radius: 8px;
                    font-size: 1rem;
                    transition: all 0.3s ease;
                    background: white;
                }

                .form-control:focus {
                    outline: none;
                    border-color: var(--primary-blue);
                    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
                }

                .btn {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    padding: 0.75rem 1.5rem;
                    border: none;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 0.95rem;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    text-decoration: none;
                    gap: 0.5rem;
                }

                .btn-primary {
                    background: linear-gradient(135deg, var(--primary-blue), var(--primary-dark));
                    color: white;
                    box-shadow: var(--shadow-md);
                }

                .btn-primary:hover {
                    transform: translateY(-1px);
                    box-shadow: var(--shadow-lg);
                }

                .btn-lg {
                    padding: 1rem 2rem;
                    font-size: 1.1rem;
                }

                .slots-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
                    gap: 0.75rem;
                    margin-top: 1rem;
                }

                .slot-option {
                    position: relative;
                }

                .slot-radio {
                    display: none;
                }

                .slot-label {
                    display: block;
                    padding: 1rem 0.5rem;
                    text-align: center;
                    background: var(--gray-50);
                    border: 2px solid var(--gray-200);
                    border-radius: 8px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    font-weight: 500;
                    color: var(--gray-800);
                    font-size: 0.9rem;
                }

                .slot-radio:checked + .slot-label {
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    color: white;
                    border-color: var(--primary-blue);
                    box-shadow: var(--shadow-md);
                    transform: scale(1.02);
                }

                .slot-label:hover {
                    border-color: var(--primary-blue);
                    background: var(--primary-light);
                }

                .slot-time {
                    display: block;
                    font-weight: 600;
                    margin-bottom: 0.25rem;
                }

                .slot-duration {
                    font-size: 0.8rem;
                    opacity: 0.8;
                }

                .alert {
                    padding: 1rem 1.5rem;
                    border-radius: 8px;
                    margin-bottom: 1.5rem;
                    border-left: 4px solid;
                }

                .alert-success {
                    background: #f0fdf4;
                    border-color: var(--success-green);
                    color: #065f46;
                }

                .alert-error {
                    background: #fef2f2;
                    border-color: var(--error-red);
                    color: #991b1b;
                }

                .progress-container {
                    display: flex;
                    justify-content: center;
                    margin-bottom: 3rem;
                    position: relative;
                }

                .progress-steps {
                    display: flex;
                    gap: 4rem;
                    position: relative;
                }

                .progress-step {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    position: relative;
                    z-index: 2;
                }

                .step-indicator {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    background: var(--gray-200);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-weight: 600;
                    color: var(--gray-600);
                    margin-bottom: 0.5rem;
                    transition: all 0.3s ease;
                    border: 3px solid white;
                    box-shadow: var(--shadow-sm);
                }

                .step-active .step-indicator {
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    color: white;
                    box-shadow: var(--shadow-md);
                }

                .step-complete .step-indicator {
                    background: var(--success-green);
                    color: white;
                }

                .step-label {
                    font-size: 0.9rem;
                    font-weight: 500;
                    color: var(--gray-600);
                    white-space: nowrap;
                }

                .step-active .step-label {
                    color: var(--primary-blue);
                    font-weight: 600;
                }

                .progress-line {
                    position: absolute;
                    top: 20px;
                    left: 50px;
                    right: 50px;
                    height: 2px;
                    background: var(--gray-200);
                    z-index: 1;
                }

                .progress-fill {
                    height: 100%;
                    background: linear-gradient(90deg, var(--primary-blue), var(--accent-purple));
                    border-radius: 1px;
                    transition: width 0.3s ease;
                }

                .info-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 1.5rem;
                    margin-top: 2rem;
                }

                .info-item {
                    text-align: center;
                    padding: 1.5rem;
                    background: var(--gray-50);
                    border-radius: 8px;
                    border: 1px solid var(--gray-200);
                }

                .info-icon {
                    width: 48px;
                    height: 48px;
                    border-radius: 8px;
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 1rem;
                    color: white;
                    font-size: 1.25rem;
                }

                .info-title {
                    font-weight: 600;
                    color: var(--gray-800);
                    margin-bottom: 0.5rem;
                }

                .info-description {
                    color: var(--gray-600);
                    font-size: 0.9rem;
                    line-height: 1.4;
                }

                .selected-date {
                    background: linear-gradient(135deg, var(--primary-blue), var(--accent-purple));
                    color: white;
                    padding: 0.75rem 1.5rem;
                    border-radius: 8px;
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    margin: 1rem 0;
                    font-weight: 600;
                    box-shadow: var(--shadow-md);
                }

                @media (max-width: 768px) {
                    .professional-container {
                        padding: 1rem 0.5rem;
                    }

                    .page-title {
                        font-size: 2rem;
                    }

                    .professional-card {
                        padding: 1.5rem;
                    }

                    .slots-grid {
                        grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                    }

                    .progress-steps {
                        gap: 2rem;
                    }

                    .info-grid {
                        grid-template-columns: 1fr;
                    }

                    /* Ajustement pour la sidebar sur mobile */
                    main {
                        width: 100%;
                        margin-left: 0;
                        padding-left: 15px;
                    }
                }
            </style>

            <div class="professional-container">
                <!-- En-tête de page -->
                <div class="page-header">
                    <h1 class="page-title">Prendre un Rendez-vous</h1>
                    <p class="page-subtitle">Réservez votre consultation en ligne rapidement et simplement</p>
                </div>

                <!-- Barre de progression -->
                <div class="progress-container">
                    <div class="progress-line">
                        <div class="progress-fill" style="width: ${not empty slots ? '100%' : '50%'};"></div>
                    </div>
                    <div class="progress-steps">
                        <div class="progress-step ${empty slots ? 'step-active' : 'step-complete'}">
                            <div class="step-indicator">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div class="step-label">Sélection Date & Docteur</div>
                        </div>
                        <div class="progress-step ${not empty slots ? 'step-active' : ''}">
                            <div class="step-indicator">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="step-label">Choix du Créneau</div>
                        </div>
                    </div>
                </div>

                <!-- Messages d'alerte -->
                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i>
                            ${success}
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        <i class="fas fa-exclamation-circle"></i>
                            ${error}
                    </div>
                </c:if>

                <!-- Carte de sélection de base -->
                <div class="professional-card">
                    <div class="card-header">
                        <div class="card-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h2 class="card-title">Recherche de Disponibilités</h2>
                    </div>

                    <form method="get" action="book-appointment">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="appointmentDate" class="form-label">
                                    <i class="fas fa-calendar-day me-2"></i>Date souhaitée
                                </label>
                                <input type="date" class="form-control" name="appointmentDate"
                                       id="appointmentDate" value="${selectedDate}" required>
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="doctor" class="form-label">
                                    <i class="fas fa-user-md me-2"></i>Médecin
                                </label>
                                <select class="form-control" name="doctorId" id="doctor" required>
                                    <option value="">Sélectionnez un médecin</option>
                                    <c:forEach var="doctor" items="${doctors}">
                                        <option value="${doctor.id}" <c:if test="${doctor.id == selectedDoctorId}">selected</c:if>>
                                            Dr. ${doctor.firstName} ${doctor.lastName} - ${doctor.specialty}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-search me-2"></i>
                                Vérifier les disponibilités
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Carte de sélection des créneaux -->
                <c:if test="${not empty slots}">
                    <div class="professional-card">
                        <div class="card-header">
                            <div class="card-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h2 class="card-title">Sélection du Créneau Horaire</h2>
                        </div>

                        <div class="selected-date">
                            <i class="fas fa-calendar-check"></i>
                            Créneaux disponibles pour le ${slots[0].toLocalDate()}
                        </div>

                        <form method="post" action="book-appointment">
                            <input type="hidden" name="doctorId" value="${selectedDoctorId}">

                            <div class="slots-grid">
                                <c:forEach var="slot" items="${slots}">
                                    <c:set var="startTime" value="${slot.toLocalTime()}"/>
                                    <c:set var="endTime" value="${slot.plusMinutes(30).toLocalTime()}"/>
                                    <div class="slot-option">
                                        <input type="radio" name="dateTime" value="${slot}"
                                               id="slot-${slot}" class="slot-radio" required>
                                        <label for="slot-${slot}" class="slot-label">
                                            <span class="slot-time">${startTime}</span>
                                            <span class="slot-duration">30 min</span>
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="form-group mt-4">
                                <label for="reason" class="form-label">
                                    <i class="fas fa-file-medical me-2"></i>Motif de la consultation
                                </label>
                                <textarea class="form-control" name="reason" id="reason"
                                          rows="4" placeholder="Veuillez décrire brièvement le motif de votre visite..."
                                          required></textarea>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-calendar-check me-2"></i>
                                    Confirmer la réservation
                                </button>
                            </div>
                        </form>
                    </div>
                </c:if>

                <!-- Section d'informations -->
                <div class="professional-card">
                    <div class="card-header">
                        <div class="card-icon">
                            <i class="fas fa-info-circle"></i>
                        </div>
                        <h2 class="card-title">Informations Importantes</h2>
                    </div>

                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h4 class="info-title">Durée des Consultations</h4>
                            <p class="info-description">Chaque consultation est prévue pour une durée de 30 minutes</p>
                        </div>

                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-calendar-times"></i>
                            </div>
                            <h4 class="info-title">Annulation</h4>
                            <p class="info-description">Annulation possible jusqu'à 24 heures avant le rendez-vous</p>
                        </div>

                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-bell"></i>
                            </div>
                            <h4 class="info-title">Rappel</h4>
                            <p class="info-description">Rappel automatique par SMS et email 24h avant le rendez-vous</p>
                        </div>

                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-file-medical-alt"></i>
                            </div>
                            <h4 class="info-title">Documents</h4>
                            <p class="info-description">Pensez à apporter vos documents médicaux et ordonnances</p>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // Animation des cartes
                    const cards = document.querySelectorAll('.professional-card');
                    cards.forEach((card, index) => {
                        card.style.opacity = '0';
                        card.style.transform = 'translateY(20px)';

                        setTimeout(() => {
                            card.style.transition = 'all 0.6s ease';
                            card.style.opacity = '1';
                            card.style.transform = 'translateY(0)';
                        }, index * 200);
                    });

                    // Amélioration de l'expérience utilisateur
                    const today = new Date().toISOString().split('T')[0];
                    const dateInput = document.getElementById('appointmentDate');
                    if (dateInput && !dateInput.value) {
                        dateInput.min = today;
                    }

                    // Feedback visuel pour la sélection des créneaux
                    const slotRadios = document.querySelectorAll('.slot-radio');
                    slotRadios.forEach(radio => {
                        radio.addEventListener('change', function() {
                            document.querySelectorAll('.slot-label').forEach(label => {
                                label.style.transform = 'scale(1)';
                            });
                            if (this.checked) {
                                this.nextElementSibling.style.transform = 'scale(1.05)';
                            }
                        });
                    });
                });
            </script>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>