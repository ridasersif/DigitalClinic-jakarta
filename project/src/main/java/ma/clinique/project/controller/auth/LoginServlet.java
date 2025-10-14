package ma.clinique.project.controller.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.clinique.project.models.User;
import ma.clinique.project.repository.impl.UserRepositoryImp;
import ma.clinique.project.service.impl.UserServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {

    private UserServiceImpl userService;
    private UserRepositoryImp userRepo;
    private EntityManager em;


    @Override
    public void init() throws ServletException{
        em = JPAUtil.getEntityManager();
        userRepo = new UserRepositoryImp(em);
        userService = new UserServiceImpl(userRepo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.login(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            session.setAttribute("role", user.getRole().getRoleName());

            response.sendRedirect(request.getContextPath() + "/");
        }else {
            request.setAttribute("errorMessage", "Email ou mot de passe incorrect !");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp")
                    .forward(request, response);
        }
    }
}
