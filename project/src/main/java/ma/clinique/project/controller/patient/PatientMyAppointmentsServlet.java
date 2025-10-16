package ma.clinique.project.controller.patient;

import jakarta.persistence.EntityManager;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.User;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.impl.AppointmentRepositoryImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/patient/my-appointments")
public class PatientMyAppointmentsServlet extends HttpServlet {

    private EntityManager em;
    private AppointmentRepositoryImpl appointmentService;

    @Override
    public void init() {
        em = JPAUtil.getEntityManager();
        appointmentService = new AppointmentRepositoryImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        Integer patientId = currentUser.getId();
        List<Appointment> appointments = appointmentService.findAllAppointmentsByPatientId(patientId);

        LocalDate today = LocalDate.now();
        LocalDateTime now = LocalDateTime.now();

        List<Appointment> upcomingAppointments = appointments.stream()
                .filter(appointment ->
                        (appointment.getAppointmentDate().isAfter(today)
                                || (appointment.getAppointmentDate().equals(today)
                                && appointment.getAppointmentTime().isAfter(now.toLocalTime())))
                                && (appointment.getStatus() == AppointmentStatus.RESERVED
                                || appointment.getStatus() == AppointmentStatus.VALIDATED)
                )
                .collect(Collectors.toList());

        List<Appointment> pastAppointments = appointments.stream()
                .filter(appointment ->
                        appointment.getAppointmentDate().isBefore(today)
                                || (appointment.getAppointmentDate().equals(today)
                                && appointment.getAppointmentTime().isBefore(now.toLocalTime()))
                                || appointment.getStatus() == AppointmentStatus.COMPLETED
                )
                .collect(Collectors.toList());

        List<Appointment> cancelledAppointments = appointments.stream()
                .filter(appointment -> appointment.getStatus() == AppointmentStatus.CANCELLED)
                .collect(Collectors.toList());

        request.setAttribute("appointments", appointments);
        request.setAttribute("upcomingAppointments", upcomingAppointments);
        request.setAttribute("pastAppointments", pastAppointments);
        request.setAttribute("cancelledAppointments", cancelledAppointments);

        request.getRequestDispatcher("/WEB-INF/views/patient/my-appointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");
        String appointmentId = request.getParameter("appointmentId");

        if ("cancel".equals(action) && appointmentId != null) {
            try {
                int id = Integer.parseInt(appointmentId);


                appointmentService.cancelAppointment(id);

                response.sendRedirect(request.getContextPath() + "/patient/my-appointments?success=Rendez-vous annulé avec succès");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/patient/my-appointments?error=Erreur lors de l'annulation");
            }
            return;
        }
        response.sendRedirect(request.getContextPath() + "/patient/my-appointments");
    }
}
