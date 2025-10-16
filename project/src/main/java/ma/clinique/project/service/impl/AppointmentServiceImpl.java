package ma.clinique.project.service.impl;

import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.enums.AppointmentStatus;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;
import ma.clinique.project.service.interfaces.IAppointmentService;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;



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

        if(appointment.getRoom() != null && !isRoomAvailable(appointment.getRoom().getId(), appointment.getAppointmentDateTime())){
            System.out.println("Room not available at this time.");
            return false;
        }
        if(!isPatientAvailable(appointment.getPatient().getId(), appointment.getAppointmentDateTime())){
            System.out.println("Patient not available at this time.");
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
        LocalDate date = dateTime.toLocalDate();
        LocalTime time = dateTime.toLocalTime();

        List<Appointment> doctorAppointments = appointmentRepository.findByDoctorAndDate(doctorId, date);
        System.out.println("Checking availability for Room ID: " + doctorId + " at " + dateTime);
        for (Appointment a : doctorAppointments) {
            if (a.getAppointmentTime().equals(time) && a.getStatus() != AppointmentStatus.CANCELLED) {
                return false;
            }
        }
        return true;
    }


    @Override
    public boolean isRoomAvailable(Integer roomId, LocalDateTime dateTime) {
        LocalDate date = dateTime.toLocalDate();
        LocalTime time = dateTime.toLocalTime();

        List<Appointment> roomAppointments = appointmentRepository.findByRoomAndDate(roomId, date);
        for (Appointment a : roomAppointments) {
            if (a.getAppointmentTime().equals(time) && a.getStatus() != AppointmentStatus.CANCELLED) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean isPatientAvailable(Integer patientId, LocalDateTime dateTime) {
        LocalDate date = dateTime.toLocalDate();
        LocalTime time = dateTime.toLocalTime();

        List<Appointment> patientAppointments = appointmentRepository.findByPatientAndDate(patientId, date);
        for (Appointment a : patientAppointments) {
            if (a.getAppointmentTime().equals(time) && a.getStatus() != AppointmentStatus.CANCELLED) {
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
        LocalDate currentDate = startDate.toLocalDate();
        LocalDate endDate = currentDate.plusYears(100);
        while(!currentDate.isAfter(endDate)) {
            for(LocalTime time = workStart; time.isBefore(workEnd); time = time.plusMinutes(30)){
                LocalDateTime dateTime = LocalDateTime.of(currentDate, time);


                if(dateTime.isAfter(LocalDateTime.now())) {
                    slots.add(dateTime);
                }
            }
            currentDate = currentDate.plusDays(1);
        }

        return slots;
    }
    @Override
    public List<LocalDateTime> filterAvailableSlots(List<LocalDateTime> allSlots, Integer doctorId, String appointmentDateDay) {
        List<LocalDateTime> availableSlots = new ArrayList<>();

        if (appointmentDateDay == null || appointmentDateDay.isEmpty()) {
            return availableSlots;
        }

        LocalDate selectedDate = LocalDate.parse(appointmentDateDay);


        List<Appointment> doctorAppointments = appointmentRepository.findByDoctorAndDate(doctorId, selectedDate);


        Set<LocalTime> bookedTimes = doctorAppointments.stream()
                .map(Appointment::getAppointmentTime)
                .collect(Collectors.toSet());


        for (LocalDateTime slot : allSlots) {
            if (slot.toLocalDate().equals(selectedDate) && !bookedTimes.contains(slot.toLocalTime())) {
                availableSlots.add(slot);
            }
        }

        return availableSlots;
    }

    @Override
    public List<Appointment> findAllAppointmentsByDoctorId(Integer doctorId) {
        return appointmentRepository.findAllAppointmentsByDoctorId(doctorId);
    }

    @Override
    public List<Appointment> findAllAppointmentsByPatientId(Integer patientId) {
        return appointmentRepository.findAllAppointmentsByPatientId(patientId);
    }


    @Override
    public void cancelAppointment(Integer id) {
        appointmentRepository.cancelAppointment(id);
    }

}