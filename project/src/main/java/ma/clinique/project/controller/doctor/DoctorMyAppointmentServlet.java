package ma.clinique.project.controller.doctor;


import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.User;
import ma.clinique.project.repository.impl.AppointmentRepositoryImpl;
import ma.clinique.project.service.impl.AppointmentServiceImpl;

import java.util.List;

@WebServlet("/doctor/appointments")
public class DoctorAppointmentServlet extends HttpServlet {

    private AppointmentRepositoryImpl appointmentRepo;
    private AppointmentServiceImpl appointmentService;

    @Override
    public void init() {
        EntityManager em = ma.clinique.project.utils.JPAUtil.getEntityManager();
        appointmentRepo = new AppointmentRepositoryImpl(em);
        appointmentService = new AppointmentServiceImpl(appointmentRepo);
    }

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }
        if (!currentUser.getRole().getRoleName().name().equals("DOCTOR")) {
            request.setAttribute("error", "vous n'avez pas la permission d'accéder à cette page.");
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        Integer doctorId = currentUser.getId();

        List<Appointment> appointments = appointmentService.findAllAppointmentsByDoctorId(doctorId);
        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher("/WEB-INF/views/doctor/appointments.jsp").forward(request, response);
    }

}
