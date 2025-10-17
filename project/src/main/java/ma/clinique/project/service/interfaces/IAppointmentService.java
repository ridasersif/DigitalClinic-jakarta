package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Appointment;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface IAppointmentService {
    boolean createAppointment(Appointment appointment);
    boolean updateAppointment(Appointment appointment);
    boolean deleteAppointment(Integer id);
    Appointment findById(Integer appointmentId);
    List<Appointment> findAll();
    boolean isDoctorAvailable(Integer doctorId, LocalDateTime dateTime);
    boolean isRoomAvailable(Integer roomId, LocalDateTime dateTime);
    boolean isPatientAvailable(Integer patientId, LocalDateTime dateTime);
    List<LocalDateTime> getAvailableSlots(Integer doctorId, LocalDateTime startDate);
    List<LocalDateTime> filterAvailableSlots(List<LocalDateTime> allSlots , Integer doctorId,String appointmentDateDay);
    List<Appointment> findAllAppointmentsByPatientId(Integer patientId);
    List<Appointment> findAllAppointmentsByDoctorIdAndByStatus(Integer doctorId, String status);
    List<Appointment> findAllAppointmentsByDoctorId(Integer doctorId);
    void changeAppointmentStatus(Integer id, String status);
    List<Appointment> findTodayAppointmentsByDoctorId(Integer doctorId);

}