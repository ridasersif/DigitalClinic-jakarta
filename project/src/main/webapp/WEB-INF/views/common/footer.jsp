<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div> <!-- Fermeture du container principal -->

<footer class="bg-dark text-light pt-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <div class="footer-brand d-flex align-items-center mb-3">
                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h5 class="fw-bold mb-0">Clinique Privée</h5>
                </div>
                <p class="text-light opacity-75 mb-4">
                    Votre partenaire santé de confiance. Nous nous engageons à fournir des soins médicaux
                    d'excellence dans un environnement moderne et sécurisé.
                </p>
                <div class="social-links">
                    <a href="#" class="text-light opacity-75 me-3 hover-lift">
                        <i class="fab fa-facebook-f fa-lg"></i>
                    </a>
                    <a href="#" class="text-light opacity-75 me-3 hover-lift">
                        <i class="fab fa-twitter fa-lg"></i>
                    </a>
                    <a href="#" class="text-light opacity-75 me-3 hover-lift">
                        <i class="fab fa-linkedin-in fa-lg"></i>
                    </a>
                    <a href="#" class="text-light opacity-75 hover-lift">
                        <i class="fab fa-instagram fa-lg"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-2 col-md-4">
                <h6 class="fw-bold mb-3 text-primary">Navigation</h6>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="index.jsp" class="text-light opacity-75 text-decoration-none hover-lift">Accueil</a></li>
                    <li class="mb-2"><a href="patient/doctors-list.jsp" class="text-light opacity-75 text-decoration-none hover-lift">Nos Docteurs</a></li>
                    <li class="mb-2"><a href="patient/book-appointment" class="text-light opacity-75 text-decoration-none hover-lift">Prendre RDV</a></li>
                    <li class="mb-2"><a href="#" class="text-light opacity-75 text-decoration-none hover-lift">À Propos</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-4">
                <h6 class="fw-bold mb-3 text-primary">Départements</h6>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="#" class="text-light opacity-75 text-decoration-none hover-lift">Cardiologie</a></li>
                    <li class="mb-2"><a href="#" class="text-light opacity-75 text-decoration-none hover-lift">Dermatologie</a></li>
                    <li class="mb-2"><a href="#" class="text-light opacity-75 text-decoration-none hover-lift">Pédiatrie</a></li>
                    <li class="mb-2"><a href="#" class="text-light opacity-75 text-decoration-none hover-lift">Neurologie</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-4">
                <h6 class="fw-bold mb-3 text-primary">Contact</h6>
                <ul class="list-unstyled">
                    <li class="mb-3 d-flex align-items-start">
                        <i class="fas fa-map-marker-alt text-primary me-2 mt-1"></i>
                        <span class="text-light opacity-75">123 Avenue de la Santé<br>75015 Paris, France</span>
                    </li>
                    <li class="mb-3 d-flex align-items-center">
                        <i class="fas fa-phone text-primary me-2"></i>
                        <span class="text-light opacity-75">01 23 45 67 89</span>
                    </li>
                    <li class="mb-3 d-flex align-items-center">
                        <i class="fas fa-envelope text-primary me-2"></i>
                        <span class="text-light opacity-75">contact@clinique-privee.fr</span>
                    </li>
                    <li class="mb-3 d-flex align-items-center">
                        <i class="fas fa-clock text-primary me-2"></i>
                        <span class="text-light opacity-75">Lun-Ven: 8h-19h<br>Sam: 9h-17h</span>
                    </li>
                </ul>
            </div>
        </div>

        <hr class="bg-light opacity-25 my-4">

        <div class="row align-items-center py-3">
            <div class="col-md-6">
                <p class="mb-0 text-light opacity-75">
                    &copy; 2025 Clinique Privée. Tous droits réservés.
                </p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" class="text-light opacity-75 text-decoration-none me-3 hover-lift">Mentions légales</a>
                <a href="#" class="text-light opacity-75 text-decoration-none hover-lift">Politique de confidentialité</a>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .hover-lift {
        transition: all 0.3s ease;
    }

    .hover-lift:hover {
        transform: translateY(-2px);
        opacity: 1 !important;
        color: var(--primary) !important;
    }
</style>

</body>
</html>