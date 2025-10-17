package ma.clinique.project.controller.patient;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ma.clinique.project.models.*;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.impl.*;
import ma.clinique.project.service.impl.*;
import ma.clinique.project.service.interfaces.IDoctorService;
import ma.clinique.project.service.interfaces.IRoomService;
import ma.clinique.project.utils.JPAUtil;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet("/patient/book-appointment")
public class BookAppointmentServlet extends HttpServlet {
    private EntityManager em;
    private AppointmentServiceImpl appointmentService;
    private IDoctorService doctorService;
    private IRoomService roomService;

    @Override
    public void init() throws ServletException {
        em = JPAUtil.getEntityManager();
        AppointmentRepositoryImpl appointmentRepo = new AppointmentRepositoryImpl(em);
        DoctorRepositoryImpl doctorRepo = new DoctorRepositoryImpl(em);
        RoomRepositoryImpl roomRepo = new RoomRepositoryImpl(em);

        appointmentService = new AppointmentServiceImpl(appointmentRepo);
        doctorService = new DoctorServiceImpl(doctorRepo);
        roomService = new RoomServiceImpl(roomRepo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        Patient patient = (Patient) session.getAttribute("currentUser");
        request.setAttribute("patient", patient);

        // Liste des docteurs
        List<Doctor> doctors = doctorService.findAll();

        if (doctors == null) doctors = new ArrayList<>();
        request.setAttribute("doctors", doctors);

        // Filtrage selon docteur et date
        String doctorIdStr = request.getParameter("doctorId");
        String appointmentDateDay = request.getParameter("appointmentDate");

        if (doctorIdStr != null && !doctorIdStr.isEmpty()) {
            Integer doctorId = Integer.parseInt(doctorIdStr);
            request.setAttribute("selectedDoctorId", doctorId);

            List<LocalDateTime> allSlots = appointmentService.getAvailableSlots(doctorId, LocalDateTime.now());
            List<LocalDateTime> availableSlots = appointmentService.filterAvailableSlots(allSlots, doctorId, appointmentDateDay);
            request.setAttribute("slots", availableSlots);
            request.setAttribute("selectedDate", appointmentDateDay);
        }

        request.getRequestDispatcher("/WEB-INF/views/patient/book-appointment.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        Patient patient = (Patient) session.getAttribute("currentUser");

        Integer doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String dateTimeStr = request.getParameter("dateTime");
        String reason = request.getParameter("reason");

        LocalDateTime appointmentDateTime = LocalDateTime.parse(dateTimeStr);

        Doctor doctor = doctorService.findById(doctorId);
        if (doctor == null) {
            request.setAttribute("error", "Docteur introuvable.");
            doGet(request, response);
            return;
        }

        Appointment appointment = new Appointment();
        appointment.setPatient(patient);
        appointment.setDoctor(doctor);

        // Assigner la première salle disponible
        List<Room> rooms = roomService.findAll();
        Room availableRoom = null;
        for (Room room : rooms) {
            if (appointmentService.isRoomAvailable(room.getId(), appointmentDateTime)) {
                availableRoom = room;
                break;
            }
        }
        if (availableRoom != null) appointment.setRoom(availableRoom);

        appointment.setAppointmentDateTime(appointmentDateTime);
        appointment.setReason(reason);
        appointment.setStatus(AppointmentStatus.RESERVED);
        appointment.setCreatedAt(LocalDateTime.now());

        boolean success = appointmentService.createAppointment(appointment);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/patient/my-appointments?success=Rendez-vous réservé avec succès !");
        } else {

            request.setAttribute("error", "Créneau non disponible.");
            request.setAttribute("selectedDoctorId", doctorId);
            request.setAttribute("selectedDate", appointmentDateTime.toLocalDate().toString());
            doGet(request, response);
        }
    }
}