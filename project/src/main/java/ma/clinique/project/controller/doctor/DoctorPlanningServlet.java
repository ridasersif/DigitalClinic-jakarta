package ma.clinique.project.controller.doctor;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/doctor/planning")
public class DoctorPlanningServlet extends HttpServlet {

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {
        request.getRequestDispatcher("/WEB-INF/views/doctor/planning.jsp").forward(request, response);
    }
}
