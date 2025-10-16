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

        <!-- Contenu principal -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="margin-left: 300px; min-height: 100vh; width: calc(100% - 300px); background: #f8fafc;">

            <style>
                :root {
                    --primary-green: #10b981;
                    --primary-dark: #047857;
                    --primary-light: #d1fae5;
                    --secondary: #6b7280;
                }

                .booking-container {
                    max-width: 1000px;
                    margin: 0 auto;
                    padding: 2rem;
                }

                /* En-tête à gauche */
                .page-header-left {
                    text-align: left;
                    margin-bottom: 2rem;
                    padding-bottom: 1.5rem;
                    border-bottom: 2px solid #e5e7eb;
                }

                .page-title {
                    font-size: 2rem;
                    font-weight: 700;
                    color: var(--primary-green);
                    margin-bottom: 0.5rem;
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                }

                .page-subtitle {
                    font-size: 1.1rem;
                    color: #6b7280;
                    font-weight: 400;
                    margin: 0;
                }

                /* Alertes simples */
                .alert-simple {
                    padding: 1rem 1.5rem;
                    border-radius: 8px;
                    margin-bottom: 1.5rem;
                    border-left: 4px solid;
                    background: white;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
                }

                .alert-success {
                    border-color: var(--primary-green);
                    color: #065f46;
                }

                .alert-error {
                    border-color: #ef4444;
                    color: #991b1b;
                }

                /* Carte principale */
                .main-card {
                    background: white;
                    border-radius: 12px;
                    padding: 2rem;
                    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                    border: 1px solid #e5e7eb;
                    margin-bottom: 2rem;
                }

                .card-title {
                    font-size: 1.5rem;
                    font-weight: 600;
                    color: #1f2937;
                    margin-bottom: 1.5rem;
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                }

                /* Formulaire en ligne */
                .inline-form {
                    display: grid;
                    grid-template-columns: 1fr 1fr auto;
                    gap: 1rem;
                    align-items: end;
                }

                .form-group {
                    margin-bottom: 0;
                }

                .form-label {
                    display: block;
                    font-weight: 500;
                    color: #374151;
                    margin-bottom: 0.5rem;
                    font-size: 0.95rem;
                }

                .form-control {
                    width: 100%;
                    padding: 0.75rem 1rem;
                    border: 1px solid #d1d5db;
                    border-radius: 8px;
                    font-size: 1rem;
                    transition: all 0.2s;
                    background: white;
                }

                .form-control:focus {
                    outline: none;
                    border-color: var(--primary-green);
                    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
                }

                .btn {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    padding: 0.75rem 1.5rem;
                    border: none;
                    border-radius: 8px;
                    font-weight: 500;
                    font-size: 0.95rem;
                    cursor: pointer;
                    transition: all 0.2s;
                    text-decoration: none;
                    gap: 0.5rem;
                }

                .btn-primary {
                    background: var(--primary-green);
                    color: white;
                }

                .btn-primary:hover {
                    background: var(--primary-dark);
                }

                /* Section des créneaux */
                .slots-section {
                    margin-top: 2rem;
                    padding-top: 2rem;
                    border-top: 1px solid #e5e7eb;
                }

                .selected-date {
                    background: var(--primary-green);
                    color: white;
                    padding: 0.75rem 1.5rem;
                    border-radius: 8px;
                    display: inline-flex;
                    align-items: center;
                    gap: 0.5rem;
                    margin-bottom: 1.5rem;
                    font-weight: 500;
                }

                .slots-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
                    gap: 0.75rem;
                    margin-bottom: 2rem;
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
                    background: #f9fafb;
                    border: 1px solid #e5e7eb;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: all 0.2s;
                    font-weight: 500;
                    color: #374151;
                    font-size: 0.9rem;
                }

                .slot-radio:checked + .slot-label {
                    background: var(--primary-green);
                    color: white;
                    border-color: var(--primary-green);
                }

                .slot-label:hover {
                    border-color: var(--primary-green);
                    background: var(--primary-light);
                }

                /* Formulaire de réservation */
                .booking-form {
                    margin-top: 2rem;
                    padding-top: 2rem;
                    border-top: 1px solid #e5e7eb;
                }

                .form-textarea {
                    width: 100%;
                    padding: 0.75rem 1rem;
                    border: 1px solid #d1d5db;
                    border-radius: 8px;
                    font-size: 1rem;
                    transition: all 0.2s;
                    background: white;
                    resize: vertical;
                    min-height: 100px;
                }

                .form-textarea:focus {
                    outline: none;
                    border-color: var(--primary-green);
                    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
                }

                .btn-lg {
                    padding: 0.875rem 2rem;
                    font-size: 1rem;
                }

                .btn-full {
                    width: 100%;
                }

                /* Responsive */
                @media (max-width: 768px) {
                    .booking-container {
                        padding: 1rem;
                    }

                    .inline-form {
                        grid-template-columns: 1fr;
                        gap: 1rem;
                    }

                    .slots-grid {
                        grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                    }

                    main {
                        width: 100%;
                        margin-left: 0;
                    }
                }
            </style>

            <div class="booking-container">
                <!-- En-tête à gauche -->
                <div class="page-header-left">
                    <h1 class="page-title">
                        <i class="fas fa-calendar-plus"></i>
                        Prendre un Rendez-vous
                    </h1>
                    <p class="page-subtitle">Réservez votre consultation en ligne rapidement et simplement</p>
                </div>

                <!-- Messages d'alerte -->
                <c:if test="${not empty success}">
                    <div class="alert-simple alert-success">
                        <i class="fas fa-check-circle me-2"></i>
                        <c:out value="${success}" />
                    </div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert-simple alert-error">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        <c:out value="${error}" />
                    </div>
                </c:if>

                <!-- Carte principale de recherche -->
                <div class="main-card">
                    <h2 class="card-title">
                        <i class="fas fa-search"></i>
                        Rechercher les disponibilités
                    </h2>

                    <form method="get" action="book-appointment">
                        <div class="inline-form">
                            <div class="form-group">
                                <label for="appointmentDate" class="form-label">Date souhaitée</label>
                                <input type="date" class="form-control" name="appointmentDate"
                                       id="appointmentDate" value="<c:out value='${selectedDate}' />" required>
                            </div>

                            <div class="form-group">
                                <label for="doctor" class="form-label">Médecin</label>
                                <select class="form-control" name="doctorId" id="doctor" required>
                                    <option value="">Sélectionnez un médecin</option>
                                    <c:forEach var="doctor" items="${doctors}">
                                        <option value="<c:out value='${doctor.id}' />"
                                                <c:if test="${doctor.id == selectedDoctorId}">selected</c:if>>
                                            Dr. <c:out value="${doctor.firstName}" /> <c:out value="${doctor.lastName}" /> - <c:out value="${doctor.specialty}" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary" style="height: 42px; margin-top: 1.6rem;">
                                    <i class="fas fa-search me-2"></i>
                                    Vérifier
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Section des créneaux disponibles -->
                    <c:if test="${not empty slots}">
                        <div class="slots-section">
                            <div class="selected-date">
                                <i class="fas fa-calendar-check"></i>
                                Créneaux disponibles pour le <c:out value="${slots[0].toLocalDate()}" />
                            </div>

                            <form method="post" action="book-appointment">
                                <input type="hidden" name="doctorId" value="<c:out value='${selectedDoctorId}' />">

                                <div class="slots-grid">
                                    <c:forEach var="slot" items="${slots}">
                                        <c:set var="startTime" value="${slot.toLocalTime()}"/>
                                        <div class="slot-option">
                                            <input type="radio" name="dateTime" value="<c:out value='${slot}' />"
                                                   id="slot-<c:out value='${slot}' />" class="slot-radio" required>
                                            <label for="slot-<c:out value='${slot}' />" class="slot-label">
                                                <c:out value="${startTime}" />
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="booking-form">
                                    <div class="form-group">
                                        <label for="reason" class="form-label">Motif de la consultation</label>
                                        <textarea class="form-textarea" name="reason" id="reason"
                                                  placeholder="Décrivez brièvement le motif de votre visite..."
                                                  required><c:out value="${param.reason}" /></textarea>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg btn-full">
                                            <i class="fas fa-calendar-check me-2"></i>
                                            Confirmer la réservation
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>
                </div>

                <!-- Informations pratiques -->
                <div class="main-card">
                    <h2 class="card-title">
                        <i class="fas fa-info-circle"></i>
                        Informations importantes
                    </h2>

                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1.5rem;">
                        <div style="text-align: center; padding: 1.5rem; background: #f8fafc; border-radius: 8px;">
                            <div style="width: 50px; height: 50px; background: var(--primary-green); border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; color: white;">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h4 style="font-weight: 600; color: #1f2937; margin-bottom: 0.5rem;">Durée</h4>
                            <p style="color: #6b7280; font-size: 0.9rem; margin: 0;">Consultation de 30 minutes</p>
                        </div>

                        <div style="text-align: center; padding: 1.5rem; background: #f8fafc; border-radius: 8px;">
                            <div style="width: 50px; height: 50px; background: var(--primary-green); border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; color: white;">
                                <i class="fas fa-calendar-times"></i>
                            </div>
                            <h4 style="font-weight: 600; color: #1f2937; margin-bottom: 0.5rem;">Annulation</h4>
                            <p style="color: #6b7280; font-size: 0.9rem; margin: 0;">Jusqu'à 24h avant</p>
                        </div>

                        <div style="text-align: center; padding: 1.5rem; background: #f8fafc; border-radius: 8px;">
                            <div style="width: 50px; height: 50px; background: var(--primary-green); border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; color: white;">
                                <i class="fas fa-bell"></i>
                            </div>
                            <h4 style="font-weight: 600; color: #1f2937; margin-bottom: 0.5rem;">Rappel</h4>
                            <p style="color: #6b7280; font-size: 0.9rem; margin: 0;">SMS et email 24h avant</p>
                        </div>

                        <div style="text-align: center; padding: 1.5rem; background: #f8fafc; border-radius: 8px;">
                            <div style="width: 50px; height: 50px; background: var(--primary-green); border-radius: 8px; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; color: white;">
                                <i class="fas fa-file-medical-alt"></i>
                            </div>
                            <h4 style="font-weight: 600; color: #1f2937; margin-bottom: 0.5rem;">Documents</h4>
                            <p style="color: #6b7280; font-size: 0.9rem; margin: 0;">Apportez vos documents</p>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // Configuration de la date minimale
                    const today = new Date().toISOString().split('T')[0];
                    const dateInput = document.getElementById('appointmentDate');
                    if (dateInput && !dateInput.value) {
                        dateInput.min = today;
                    }

                    // Animation pour les créneaux horaires
                    const slotRadios = document.querySelectorAll('.slot-radio');
                    slotRadios.forEach(function(radio) {
                        radio.addEventListener('change', function() {
                            document.querySelectorAll('.slot-label').forEach(function(label) {
                                label.style.transform = 'scale(1)';
                            });
                            if (this.checked) {
                                this.nextElementSibling.style.transform = 'scale(1.05)';
                            }
                        });
                    });

                    // Redirection après succès
                    <c:if test="${not empty success}">
                    setTimeout(function() {
                        window.location.href = '${pageContext.request.contextPath}/patient/my-appointments?success=Rendez-vous réservé avec succès';
                    }, 2000);
                    </c:if>
                });
            </script>

        </main>
    </div>
</div>
</body>
</html>