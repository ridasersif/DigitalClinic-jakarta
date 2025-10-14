package ma.clinique.project.service.impl;

import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.Patient;
import ma.clinique.project.models.Room;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;
import ma.clinique.project.service.interfaces.IAppointmentService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

public class AppointmentServiceImpl implements IAppointmentService {

    private final IAppointmentRepository appointmentRepository;

    public AppointmentServiceImpl(IAppointmentRepository appointmentRepository) {
        this.appointmentRepository = appointmentRepository;
    }

    @Override
    public boolean createAppointment(Patient patient, Doctor doctor, Room room, LocalDate date, LocalTime time) throws Exception {
        LocalDateTime dateTime = LocalDateTime.of(date, time);

        // Vérifier disponibilité patient, doctor, room
        if (appointmentRepository.findAll().stream().anyMatch(a ->
                a.getPatient().getId().equals(patient.getId()) &&
                        a.getAppointmentDateTime().equals(dateTime))) {
            throw new Exception("Patient already has an appointment at this time.");
        }

        if (appointmentRepository.findAll().stream().anyMatch(a ->
                a.getDoctor().getId().equals(doctor.getId()) &&
                        a.getAppointmentDateTime().equals(dateTime))) {
            throw new Exception("Doctor is not available at this time.");
        }

        if (appointmentRepository.findAll().stream().anyMatch(a ->
                a.getRoom().getId().equals(room.getId()) &&
                        a.getAppointmentDateTime().equals(dateTime))) {
            throw new Exception("Room is already booked at this time.");
        }

        Appointment appointment = new Appointment(date, time, AppointmentStatus.RESERVED,
                patient, doctor, room);

        return appointmentRepository.create(appointment);
    }

    @Override
    public boolean updateAppointment(Appointment appointment) throws Exception {
        Appointment existing = appointmentRepository.findById(appointment.getId());
        if (existing == null)
            throw new Exception("Appointment not found.");

        if (existing.getStatus() == AppointmentStatus.COMPLETED ||
                existing.getStatus() == AppointmentStatus.CANCELLED)
            throw new Exception("Cannot modify completed or cancelled appointment.");

        return appointmentRepository.update(appointment);
    }

    @Override
    public boolean cancelAppointment(Integer appointmentId) throws Exception {
        Appointment appointment = appointmentRepository.findById(appointmentId);
        if (appointment == null) throw new Exception("Appointment not found.");

        appointment.setStatus(AppointmentStatus.CANCELLED);
        return appointmentRepository.update(appointment);
    }

    @Override
    public boolean validateAppointment(Integer appointmentId, Doctor doctor) throws Exception {
        Appointment appointment = appointmentRepository.findById(appointmentId);
        if (appointment == null) throw new Exception("Appointment not found.");

        if (!appointment.getDoctor().getId().equals(doctor.getId()))
            throw new Exception("Doctor not authorized.");

        appointment.setStatus(AppointmentStatus.VALIDATED);
        return appointmentRepository.update(appointment);
    }

    @Override
    public boolean completeAppointment(Integer appointmentId, String report, Doctor doctor) throws Exception {
        Appointment appointment = appointmentRepository.findById(appointmentId);
        if (appointment == null) throw new Exception("Appointment not found.");

        if (!appointment.getDoctor().getId().equals(doctor.getId()))
            throw new Exception("Doctor not authorized.");

        if (appointment.getStatus() != AppointmentStatus.VALIDATED)
            throw new Exception("Appointment must be validated first.");

        appointment.setReport(report);
        appointment.setStatus(AppointmentStatus.COMPLETED);
        return appointmentRepository.update(appointment);
    }

    @Override
    public List<Appointment> getAppointmentsByDoctor(Integer doctorId) {
        return appointmentRepository.findAll()
                .stream()
                .filter(a -> a.getDoctor().getId().equals(doctorId))
                .collect(Collectors.toList());
    }

    @Override
    public List<Appointment> getAppointmentsByPatient(Integer patientId) {
        return appointmentRepository.findAll()
                .stream()
                .filter(a -> a.getPatient().getId().equals(patientId))
                .collect(Collectors.toList());
    }

    @Override
    public List<Appointment> getAllAppointments() {
        return appointmentRepository.findAll();
    }

    @Override
    public Appointment findAppointmentById(Integer appointmentId) {
        return appointmentRepository.findById(appointmentId);
    }
}
