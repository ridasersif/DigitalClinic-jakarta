<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="main-header">
    <nav class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-hospital"></i>
            <span>DigitalClinic</span>
        </div>

        <div class="navbar-menu">
            <c:choose>
                <%-- Patient Navigation --%>
                <c:when test="${sessionScope.userRole == 'PATIENT'}">
                    <a href="${pageContext.request.contextPath}/patient/dashboard">
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                    <a href="${pageContext.request.contextPath}/patient/doctors">
                        <i class="fas fa-user-doctor"></i> Médecins
                    </a>
                    <a href="${pageContext.request.contextPath}/patient/appointments">
                        <i class="fas fa-calendar-check"></i> Mes Rendez-vous
                    </a>
                    <a href="${pageContext.request.contextPath}/patient/history">
                        <i class="fas fa-history"></i> Historique
                    </a>
                </c:when>

                <%-- Doctor Navigation --%>
                <c:when test="${sessionScope.userRole == 'DOCTOR'}">
                    <a href="${pageContext.request.contextPath}/doctor/dashboard">
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/planning">
                        <i class="fas fa-calendar-alt"></i> Planning
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/appointments">
                        <i class="fas fa-calendar-check"></i> Rendez-vous
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/consultation">
                        <i class="fas fa-stethoscope"></i> Consultations
                    </a>
                </c:when>

                <%-- Admin Navigation --%>
                <c:when test="${sessionScope.userRole == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="fas fa-home"></i> Tableau de bord
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/departments">
                        <i class="fas fa-building"></i> Départements
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/doctors">
                        <i class="fas fa-user-doctor"></i> Médecins
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/rooms">
                        <i class="fas fa-door-open"></i> Salles
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/appointments">
                        <i class="fas fa-calendar"></i> Rendez-vous
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/statistics">
                        <i class="fas fa-chart-bar"></i> Statistiques
                    </a>
                </c:when>
            </c:choose>
        </div>

        <c:if test="${sessionScope.user != null}">
            <div class="user-menu">
                <div class="user-info">
                    <div class="user-avatar">
                            ${sessionScope.user.firstName.substring(0,1)}${sessionScope.user.lastName.substring(0,1)}
                    </div>
                    <div>
                        <div style="font-weight: 600;">${sessionScope.user.firstName} ${sessionScope.user.lastName}</div>
                        <div style="font-size: 0.875rem; color: #6b7280;">${sessionScope.userRole}</div>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/logout" method="post" style="display: inline;">
                    <button type="submit" class="btn-logout">
                        <i class="fas fa-sign-out-alt"></i> Déconnexion
                    </button>
                </form>
            </div>
        </c:if>
    </nav>
</header>