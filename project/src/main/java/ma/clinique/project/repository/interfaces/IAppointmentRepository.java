package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.Appointment;

import java.time.LocalDate;
import java.util.List;

public interface IAppointmentRepository {
        boolean create(Appointment appointment);
        boolean update(Appointment appointment);
        boolean delete(Integer id);
        Appointment findById(Integer id);
        List<Appointment> findAll();
        List<Appointment> findByDoctorAndDate(Integer doctorId, LocalDate date);
        List<Appointment> findByRoomAndDate(Integer roomId, LocalDate date);
        List<Appointment> findByPatientAndDate(Integer patientId, LocalDate date);
        List<Appointment> findAllAppointmentsByPatientId(Integer patientId);
        List<Appointment> findAllAppointmentsByDoctorId(Integer doctorId);
        void cancelAppointment(Integer id);


}
