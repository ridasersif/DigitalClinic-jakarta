package ma.clinique.project.controller.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.clinique.project.models.User;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.repository.impl.UserRepositoryImpl;
import ma.clinique.project.service.impl.UserServiceImpl;
import ma.clinique.project.service.impl.RoleServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;

@WebServlet("/register")

public class RegisterServlet extends HttpServlet {

    private final UserServiceImpl userService;
    private final RoleServiceImpl roleService;
    public RegisterServlet() {
        EntityManager em = JPAUtil.getEntityManager();
        UserRepositoryImpl userRepo = new UserRepositoryImpl(em);
        RoleRepositoryImpl roleRepo = new RoleRepositoryImpl(em);
        userService = new UserServiceImpl(userRepo);
        roleService = new RoleServiceImpl(roleRepo);
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

        if(firstName == null || lastName == null || email == null || password == null ||
                firstName.isBlank() || lastName.isBlank() || email.isBlank() || password.isBlank()) {
            request.setAttribute("error", "Tous les champs sont obligatoires.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }

        if(userService.findByEmail(email) != null){
            request.setAttribute("error", "Email déjà utilisé.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }

        Role patientRole = roleService.findByRoleName(RoleType.PATIENT);
        if(patientRole == null){
            request.setAttribute("error", "Role PATIENT non trouvé, contactez l'admin.");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(patientRole);
        userService.register(user);
        response.sendRedirect(request.getContextPath() + "/login");

    }
}
