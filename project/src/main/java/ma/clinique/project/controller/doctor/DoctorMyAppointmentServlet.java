package ma.clinique.project.controller.doctor;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.User;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.impl.AppointmentRepositoryImpl;
import ma.clinique.project.service.impl.AppointmentServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/doctor/appointments")
public class DoctorMyAppointmentServlet extends HttpServlet {

    private AppointmentServiceImpl appointmentService;
    private AppointmentRepositoryImpl appointmentRepo;

    @Override
    public void init() {
        EntityManager em = ma.clinique.project.utils.JPAUtil.getEntityManager();
        appointmentRepo = new AppointmentRepositoryImpl(em);
        appointmentService = new AppointmentServiceImpl(appointmentRepo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null || !"DOCTOR".equals(currentUser.getRole().getRoleName().name())) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        Integer doctorId = currentUser.getId();
        String statusFilter = request.getParameter("status");
        String todayFilter = request.getParameter("today");
        List<Appointment> appointments;

        if (todayFilter != null && todayFilter.equals("true")) {
            // Filtrer les rendez-vous d'aujourd'hui
            appointments = appointmentService.findAllAppointmentsByDoctorId(doctorId)
                    .stream()
                    .filter(a -> a.isToday())
                    .toList();

        } else if (statusFilter != null && !statusFilter.isEmpty()) {
            appointments = appointmentService.findAllAppointmentsByDoctorIdAndByStatus(doctorId, statusFilter);
        } else {
            appointments = appointmentService.findAllAppointmentsByDoctorId(doctorId);
        }
        List<Appointment> allAppointments = appointmentService.findAllAppointmentsByDoctorId(doctorId);

        long pendingCount = allAppointments.stream()
                .filter(a -> a.getStatus() == AppointmentStatus.RESERVED)
                .count();

        long confirmedCount = allAppointments.stream()
                .filter(a -> a.getStatus() == AppointmentStatus.VALIDATED)
                .count();

        long todayCount = allAppointments.stream()
                .filter(a -> a.isToday() &&
                        (a.getStatus() == AppointmentStatus.VALIDATED ||
                                a.getStatus() == AppointmentStatus.RESERVED))
                .count();
        request.setAttribute("appointments", appointments);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("confirmedCount", confirmedCount);
        request.setAttribute("todayCount", todayCount);
        request.setAttribute("currentStatus", statusFilter);
        request.setAttribute("todayFilter", todayFilter);

        request.getRequestDispatcher("/WEB-INF/views/doctor/appointments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null || !"DOCTOR".equals(currentUser.getRole().getRoleName().name())) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        String action = request.getParameter("action");
        String appointmentIdStr = request.getParameter("appointmentId");

        try {
            Integer appointmentId = Integer.parseInt(appointmentIdStr);

            switch (action) {
                case "validate":
                    appointmentService.changeAppointmentStatus(appointmentId, "VALIDATED");
                    request.getSession().setAttribute("successMessage", "Rendez-vous validé avec succès");
                    break;

                case "cancel":
                    appointmentService.changeAppointmentStatus(appointmentId, "CANCELLEDBYDOCTOR");
                    request.getSession().setAttribute("successMessage", "Rendez-vous annulé avec succès");
                    break;

                case "complete":
                    appointmentService.changeAppointmentStatus(appointmentId, "COMPLETED");
                    request.getSession().setAttribute("successMessage", "Rendez-vous marqué comme terminé");
                    break;

                default:
                    request.getSession().setAttribute("errorMessage", "Action non reconnue");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "ID de rendez-vous invalide");
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Erreur lors du traitement: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/doctor/appointments");
    }
}