package ma.clinique.project.controller.admin;


import jakarta.servlet.annotation.WebServlet;

@WebServlet("/admin/appointments")
public class AdminAppointmentServlet extends jakarta.servlet.http.HttpServlet {

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {
        request.getRequestDispatcher("/WEB-INF/views/admin/appointments.jsp").forward(request, response);
    }

}
