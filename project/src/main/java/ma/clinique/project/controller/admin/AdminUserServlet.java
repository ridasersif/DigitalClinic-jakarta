package ma.clinique.project.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.clinique.project.models.User;
import ma.clinique.project.repository.impl.UserRepositoryImp;
import ma.clinique.project.repository.interfaces.IUserRepository;
import ma.clinique.project.service.impl.UserServiceImpl;
import ma.clinique.project.service.interfaces.IUserService;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {
    private IUserService userService;

    @Override
    public void init() throws SecurityException {
        IUserRepository userRepo = new UserRepositoryImp(JPAUtil.getEntityManager());
        userService = new UserServiceImpl(userRepo);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User currentUser = null;

        if(session != null){
            currentUser = (User) session.getAttribute("currentUser");
        }

        System.out.println("DEBUG: currentUser = " + currentUser);

        if(currentUser == null) {
            System.out.println("DEBUG: currentUser is null, redirecting to login...");
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<User> users = userService.findAll(currentUser);
        System.out.println("DEBUG: users list = " + users);

        if(users == null || users.isEmpty()) {
            System.out.println("DEBUG: No users found or access denied!");
        }

        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/views/admin/users.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        Integer targetUserId = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession(false);
        User currentUser = null;

        if(session != null){
            currentUser = (User) session.getAttribute("currentUser");
        }

        System.out.println("DEBUG: POST action = " + action + ", targetUserId = " + targetUserId + ", currentUser = " + currentUser);

        if(currentUser == null) {
            System.out.println("DEBUG: POST currentUser is null, redirecting to login...");
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User targetUser = userService.findById(targetUserId);
        System.out.println("DEBUG: targetUser = " + targetUser);

        if ("delete".equals(action)) {
            boolean deleted = userService.deleteUser(targetUser, currentUser);
            System.out.println("DEBUG: deleted = " + deleted);

            if (deleted) {
                resp.sendRedirect(req.getContextPath() + "/admin/users?success=deleted");
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/users?error=unauthorized");
            }
        }
    }
}


