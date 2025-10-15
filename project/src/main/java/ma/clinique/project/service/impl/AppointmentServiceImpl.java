package ma.clinique.project.service.impl;

import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;
import ma.clinique.project.service.interfaces.IAppointmentService;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class AppointmentServiceImpl implements IAppointmentService {

    private final IAppointmentRepository appointmentRepository;

    public AppointmentServiceImpl(IAppointmentRepository appointmentRepository) {
        this.appointmentRepository = appointmentRepository;
    }

    @Override
    public boolean createAppointment(Appointment appointment){
        if(!isDoctorAvailable(appointment.getDoctor().getId(), appointment.getAppointmentDateTime())){
            System.out.println("Doctor not available at this time.");
            return false;
        }
        // CHANGEMENT: Support pour room optionnelle
        if(appointment.getRoom() != null && !isRoomAvailable(appointment.getRoom().getId(), appointment.getAppointmentDateTime())){
            System.out.println("Room not available at this time.");
            return false;
        }
        return appointmentRepository.create(appointment);
    }

    @Override
    public boolean updateAppointment(Appointment appointment) {
        return appointmentRepository.update(appointment);
    }

    @Override
    public boolean deleteAppointment(Integer id) {
        Appointment appointment = appointmentRepository.findById(id);
        if (appointment == null) {
            System.out.println("Appointment not found.");
            return false;
        }
        return appointmentRepository.delete(id);
    }

    @Override
    public Appointment findById(Integer appointmentId) {
        return appointmentRepository.findById(appointmentId);
    }

    @Override
    public List<Appointment> findAll() {
        return appointmentRepository.findAll();
    }

    @Override
    public boolean isDoctorAvailable(Integer doctorId, LocalDateTime dateTime) {
        List<Appointment> all = appointmentRepository.findAll();
        for (Appointment a : all) {
            if (a.getDoctor().getId().equals(doctorId)
                    && a.getAppointmentDateTime().equals(dateTime)
                    && a.getStatus() != AppointmentStatus.CANCELLED) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean isRoomAvailable(Integer roomId, LocalDateTime dateTime) {
        List<Appointment> all = appointmentRepository.findAll();
        for (Appointment a : all) {
            // CHANGEMENT: Vérifier si room != null
            if (a.getRoom() != null
                    && a.getRoom().getId().equals(roomId)
                    && a.getAppointmentDateTime().equals(dateTime)
                    && a.getStatus() != AppointmentStatus.CANCELLED) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean isPatientAvailable(Integer patientId, LocalDateTime dateTime) {
        List<Appointment> all = appointmentRepository.findAll();
        for (Appointment a : all) {
            if (a.getPatient().getId().equals(patientId)
                    && a.getAppointmentDateTime().equals(dateTime)
                    && a.getStatus() != AppointmentStatus.CANCELLED) {
                return false;
            }
        }
        return true;
    }

    @Override
    public List<LocalDateTime> getAvailableSlots(Integer doctorId, LocalDateTime startDate){
        List<LocalDateTime> slots = new ArrayList<>();
        LocalTime workStart = LocalTime.of(8, 0);
        LocalTime workEnd = LocalTime.of(22, 0);

        // CHANGEMENT: Générer les créneaux pour 30 jours (au lieu d'un seul jour)
        LocalDate currentDate = startDate.toLocalDate();
        LocalDate endDate = currentDate.plusDays(30);

        while(!currentDate.isAfter(endDate)) {
            for(LocalTime time = workStart; time.isBefore(workEnd); time = time.plusMinutes(30)){
                LocalDateTime dateTime = LocalDateTime.of(currentDate, time);

                // CHANGEMENT: Afficher seulement les créneaux futurs
                if(dateTime.isAfter(LocalDateTime.now())) {
                    slots.add(dateTime);
                }
            }
            currentDate = currentDate.plusDays(1);
        }

        return slots;
    }

}