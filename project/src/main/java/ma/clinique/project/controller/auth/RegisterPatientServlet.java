package ma.clinique.project.controller.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.clinique.project.models.Patient;
import ma.clinique.project.repository.impl.PatientRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.service.impl.PatientServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/auth/register")
public class RegisterPatientServlet extends HttpServlet {

    private PatientServiceImpl patientService;
    private EntityManager em;

    @Override
    public void init() {
        em = JPAUtil.getEntityManager();
        PatientRepositoryImpl patientRepo = new PatientRepositoryImpl(em);
        RoleRepositoryImpl roleRepo = new RoleRepositoryImpl(em);
        patientService = new PatientServiceImpl(patientRepo, roleRepo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String> errors = new HashMap<>();

        try {
            String firstName = request.getParameter("firstName");
            String lastName  = request.getParameter("lastName");
            String email     = request.getParameter("email");
            String password  = request.getParameter("password");
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");

            if (firstName == null || firstName.isEmpty()) errors.put("firstName", "Le prénom est requis.");
            if (lastName == null || lastName.isEmpty()) errors.put("lastName", "Le nom est requis.");
            if (email == null || email.isEmpty()) errors.put("email", "L'adresse e-mail est requise.");
            if (password == null || password.isEmpty()) errors.put("password", "Le mot de passe est requis.");
            if (weightStr == null || weightStr.isEmpty()) errors.put("weight", "Le poids est requis.");
            if (heightStr == null || heightStr.isEmpty()) errors.put("height", "La taille est requise.");

            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
                return;
            }

            float weight = Float.parseFloat(weightStr);
            float height = Float.parseFloat(heightStr);

            Patient patient = new Patient(firstName, lastName, email, password, null, weight, height);
            patientService.save(patient);

            HttpSession  session = request.getSession(true);
            session.setAttribute("currentUser", patient);
            session.setAttribute("role",patient.getRole().getRoleName());

            response.sendRedirect(request.getContextPath() + "/");
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
