package ma.clinique.project.controller.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.clinique.project.models.Patient;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.PatientRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.service.impl.PatientServiceImpl;
import ma.clinique.project.utils.JPAUtil;
import java.io.IOException;


@WebServlet("/register")
public class RegisterPatientServlet extends HttpServlet {
    private PatientServiceImpl patientService;
    private RoleRepositoryImpl roleRepo;
    @Override
    public void init() {
        EntityManager em = JPAUtil.getEntityManager();
        PatientRepositoryImpl patientRepo = new PatientRepositoryImpl(em);
        roleRepo = new RoleRepositoryImpl(em);

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
        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String password  = request.getParameter("password");
        Float weight     = Float.parseFloat(request.getParameter("weight"));
        Float height     = Float.parseFloat(request.getParameter("height"));

        Role patientRole = roleRepo.findByRoleName(RoleType.PATIENT);

        Patient patient = new Patient(firstName, lastName, email, password, patientRole, weight, height);

        patientService.save(patient);
        response.sendRedirect("success.jsp");
    }

}
