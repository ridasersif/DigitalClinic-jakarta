<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Page non trouvée"/>
</jsp:include>
<jsp:include page="../common/navbar.jsp"/>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <div class="error-container">
                <h1 class="display-1 text-primary">404</h1>
                <h2 class="mb-4">Page non trouvée</h2>
                <p class="lead mb-4">
                    Désolé, la page que vous recherchez n'existe pas ou a été déplacée.
                </p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                    <a href="index.jsp" class="btn btn-primary btn-lg">
                        Retour à l'accueil
                    </a>
                    <button onclick="history.back()" class="btn btn-outline-primary btn-lg">
                        Page précédente
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