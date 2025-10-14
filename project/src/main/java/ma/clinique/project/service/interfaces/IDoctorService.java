package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.User;

import java.util.List;

public interface IDoctorService {
    Doctor save(User currentUser, Doctor doctor, Integer departmentId);

    Doctor update(User currentUser, Doctor doctor, Integer departmentId);

    boolean delete(User currentUser, Integer id);

    Doctor findById(User currentUser, Integer id);

    List<Doctor> findAll();

    Doctor updateStatus(User currentUser, Integer doctorId, String newStatus);
}
