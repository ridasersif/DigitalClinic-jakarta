package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Appointment;
import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.Patient;
import ma.clinique.project.models.Room;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface IAppointmentService {

    boolean createAppointment(Patient patient, Doctor doctor, Room room,
                              LocalDate date, LocalTime time) throws Exception;

    boolean updateAppointment(Appointment appointment) throws Exception;

    boolean cancelAppointment(Integer appointmentId) throws Exception;

    boolean validateAppointment(Integer appointmentId, Doctor doctor) throws Exception;

    boolean completeAppointment(Integer appointmentId, String report, Doctor doctor) throws Exception;

    List<Appointment> getAppointmentsByDoctor(Integer doctorId);

    List<Appointment> getAppointmentsByPatient(Integer patientId);

    List<Appointment> getAllAppointments();

    Appointment findAppointmentById(Integer appointmentId);
}
