package ma.clinique.project.controller.patient;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet("/patient/history")
public class PatientMedicalHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {

        request.getRequestDispatcher("/WEB-INF/views/patient/history.jsp").forward(request, response);
    }
}
