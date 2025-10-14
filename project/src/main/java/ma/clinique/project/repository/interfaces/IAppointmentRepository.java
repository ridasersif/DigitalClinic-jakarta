package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.Appointment;

import java.util.List;

public interface IAppointmentRepository {
        boolean create(Appointment appointment);
        boolean update(Appointment appointment);
        boolean delete(Integer id);
        Appointment findById(Integer id);
        List<Appointment> findAll();

}
