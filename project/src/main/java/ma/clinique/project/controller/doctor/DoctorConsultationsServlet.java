package ma.clinique.project.controller.doctor;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet("/doctor/consultations")
public class DoctorConsultationsServlet extends HttpServlet {

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {
        System.out.println("DoctorConsultationsServlet accessed");
        request.getRequestDispatcher("/WEB-INF/views/doctor/consultation.jsp").forward(request, response);
    }
}
