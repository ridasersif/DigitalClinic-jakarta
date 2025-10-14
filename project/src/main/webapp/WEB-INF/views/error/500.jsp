<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Erreur serveur"/>
</jsp:include>
<jsp:include page="../common/navbar.jsp"/>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <div class="error-container">
                <h1 class="display-1 text-danger">500</h1>
                <h2 class="mb-4">Erreur interne du serveur</h2>
                <p class="lead mb-4">
                    Une erreur technique s'est produite. Notre équipe a été notifiée et travaille à résoudre le problème.
                </p>
                <div class="alert alert-warning mb-4">
                    <strong>Conseil:</strong> Vous pouvez réessayer dans quelques instants ou nous contacter si le problème persiste.
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg">
                        Retour à l'accueil
                    </a>
                    <button onclick="location.reload()" class="btn btn-outline-primary btn-lg">
                        Réessayer
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .error-container {
        padding: 3rem 0;
    }
    .display-1 {
        font-size: 8rem;
        font-weight: bold;
    }
</style>

<jsp:include page="../common/footer.jsp"/>