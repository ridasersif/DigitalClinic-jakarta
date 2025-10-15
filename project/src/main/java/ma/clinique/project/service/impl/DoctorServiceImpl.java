package ma.clinique.project.service.impl;

import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.User;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.DoctorStatus;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.models.Department;
import ma.clinique.project.repository.impl.DoctorRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.repository.impl.DepartmentRepositoryImpl;
import ma.clinique.project.service.interfaces.IDoctorService;
import ma.clinique.project.utils.PasswordUtil;
import ma.clinique.project.utils.ValidationUtil;

import java.util.List;

public class DoctorServiceImpl implements IDoctorService {

    private final DoctorRepositoryImpl doctorRepo;
    private  RoleRepositoryImpl roleRepo;
    private  DepartmentRepositoryImpl departmentRepo;

    public DoctorServiceImpl(DoctorRepositoryImpl doctorRepo, RoleRepositoryImpl roleRepo, DepartmentRepositoryImpl departmentRepo) {
        this.doctorRepo = doctorRepo;
        this.roleRepo = roleRepo;
        this.departmentRepo = departmentRepo;
    }
    public DoctorServiceImpl(DoctorRepositoryImpl doctorRepo) {
        this.doctorRepo = doctorRepo;
    }

    private void checkAdmin(User currentUser) {
        if (currentUser == null || !currentUser.getRole().getRoleName().equals(RoleType.ADMIN)) {
            throw new SecurityException("Seul l'administrateur peut effectuer cette action.");
        }
    }

    @Override
    public Doctor save(User currentUser, Doctor doctor, Integer departmentId) {
        checkAdmin(currentUser);

        // --- Sanitize input ---
        doctor.setFirstName(ValidationUtil.sanitizeInput(doctor.getFirstName()));
        doctor.setLastName(ValidationUtil.sanitizeInput(doctor.getLastName()));
        doctor.setEmail(ValidationUtil.sanitizeInput(doctor.getEmail()));
        doctor.setSpecialty(ValidationUtil.sanitizeInput(doctor.getSpecialty()));
        doctor.setPhone(ValidationUtil.sanitizeInput(doctor.getPhone()));
        doctor.setLicenseNumber(ValidationUtil.sanitizeInput(doctor.getLicenseNumber()));

        // --- Validate fields ---
        if (!ValidationUtil.isNotEmpty(doctor.getFirstName()) || !ValidationUtil.isNotEmpty(doctor.getLastName())) {
            throw new IllegalArgumentException("Le prénom et le nom sont obligatoires !");
        }

        if (!ValidationUtil.isValidEmail(doctor.getEmail())) {
            throw new IllegalArgumentException("Adresse e-mail invalide !");
        }

        if (!ValidationUtil.isNotEmpty(doctor.getSpecialty())) {
            throw new IllegalArgumentException("La spécialité est obligatoire !");
        }

        if (!ValidationUtil.isNotEmpty(doctor.getPhone()) || !ValidationUtil.isValidPhone(doctor.getPhone())) {
            throw new IllegalArgumentException("Numéro de téléphone invalide ou vide !");
        }

        if (!ValidationUtil.isNotEmpty(doctor.getLicenseNumber())) {
            throw new IllegalArgumentException("Le numéro de licence est obligatoire !");
        }

        if (doctor.getPassword() == null || doctor.getPassword().trim().length() < 6) {
            throw new IllegalArgumentException("Le mot de passe doit contenir au moins 6 caractères !");
        }

        // --- Password + Role + Department + Status ---
        doctor.setPassword(PasswordUtil.hashPassword(doctor.getPassword()));

        Role doctorRole = roleRepo.findByRoleName(RoleType.DOCTOR);
        if (doctorRole == null) {
            throw new IllegalArgumentException("Le rôle DOCTOR est introuvable !");
        }
        doctor.setRole(doctorRole);

        Department department = departmentRepo.findById(departmentId);
        if (department == null) {
            throw new IllegalArgumentException("Département invalide !");
        }
        doctor.setDepartment(department);

        if (doctor.getStatus() == null) {
            doctor.setStatus(DoctorStatus.ACTIVE);
        }

        doctorRepo.save(doctor);
        return doctor;
    }

    @Override
    public Doctor update(User currentUser, Doctor doctor, Integer departmentId) {
        checkAdmin(currentUser);

        // --- Validation comme dans save ---
        doctor.setFirstName(ValidationUtil.sanitizeInput(doctor.getFirstName()));
        doctor.setLastName(ValidationUtil.sanitizeInput(doctor.getLastName()));
        doctor.setEmail(ValidationUtil.sanitizeInput(doctor.getEmail()));
        doctor.setSpecialty(ValidationUtil.sanitizeInput(doctor.getSpecialty()));
        doctor.setPhone(ValidationUtil.sanitizeInput(doctor.getPhone()));
        doctor.setLicenseNumber(ValidationUtil.sanitizeInput(doctor.getLicenseNumber()));

        if (!ValidationUtil.isNotEmpty(doctor.getFirstName()) || !ValidationUtil.isNotEmpty(doctor.getLastName())) {
            throw new IllegalArgumentException("Le prénom et le nom sont obligatoires !");
        }
        if (!ValidationUtil.isValidEmail(doctor.getEmail())) {
            throw new IllegalArgumentException("Adresse e-mail invalide !");
        }
        if (!ValidationUtil.isNotEmpty(doctor.getSpecialty())) {
            throw new IllegalArgumentException("La spécialité est obligatoire !");
        }
        if (!ValidationUtil.isNotEmpty(doctor.getPhone()) || !ValidationUtil.isValidPhone(doctor.getPhone())) {
            throw new IllegalArgumentException("Numéro de téléphone invalide ou vide !");
        }
        if (!ValidationUtil.isNotEmpty(doctor.getLicenseNumber())) {
            throw new IllegalArgumentException("Le numéro de licence est obligatoire !");
        }

        Department department = departmentRepo.findById(departmentId);
        if (department == null) {
            throw new IllegalArgumentException("Département invalide !");
        }
        doctor.setDepartment(department);

        doctorRepo.update(doctor);
        return doctor;
    }

    @Override
    public boolean delete(User currentUser, Integer id) {
        checkAdmin(currentUser);
        Doctor doctor = doctorRepo.findById(id);
        if (doctor == null) {
            throw new IllegalArgumentException("Docteur introuvable !");
        }
        doctorRepo.deleteById(id);
        return true;
    }

    @Override
    public Doctor findById(Integer id) {
        Doctor doctor = doctorRepo.findById(id);
        if (doctor == null) {
            throw new IllegalArgumentException("Aucun docteur trouvé avec cet ID !");
        }
        return doctor;
    }
    @Override
    public List<Doctor> findAll() {
        return doctorRepo.findAll();
    }

    @Override
    public Doctor updateStatus(User currentUser, Integer doctorId, String newStatus) {
        checkAdmin(currentUser);

        Doctor doctor = doctorRepo.findById(doctorId);
        if (doctor == null) {
            throw new IllegalArgumentException("Doctor introuvable !");
        }

        try {
            doctor.setStatus(DoctorStatus.valueOf(newStatus.toUpperCase()));
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Statut invalide ! Les statuts possibles sont : ACTIVE, INACTIVE, ON_LEAVE");
        }

        doctorRepo.updateStatus(doctorId, newStatus);
        return doctor;
    }

}
