package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.Doctor;

import java.util.List;

public interface IDoctorRepository {
    void save(Doctor doctor);
    void update(Doctor doctor);
    void deleteById(Integer id);
    Doctor findById(Integer id);
    List<Doctor> findAll();
    void updateStatus(Integer id, String newStatus);

}
