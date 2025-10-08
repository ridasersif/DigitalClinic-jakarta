package ma.clinique.project.service.impl;

import ma.clinique.project.models.Patient;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.PatientRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.service.interfaces.IPatientService;
import ma.clinique.project.utils.ValidationUtil;

public class PatientServiceImpl implements IPatientService {

    private PatientRepositoryImpl patientRepo;
    private RoleRepositoryImpl roleRepo;

    public PatientServiceImpl(PatientRepositoryImpl patientRepo, RoleRepositoryImpl roleRepo) {
        this.patientRepo = patientRepo;
        this.roleRepo = roleRepo;
    }

    @Override
    public void save(Patient patient) {
        if (!ValidationUtil.isNotEmpty(patient.getFirstName()) ||
                !ValidationUtil.isValidName(patient.getFirstName())) {
            throw new IllegalArgumentException("Prénom invalide");
        }

        if (!ValidationUtil.isValidEmail(patient.getEmail())) {
            throw new IllegalArgumentException("Email invalide");
        }

        if (!ValidationUtil.isValidPassword(patient.getPassword())) {
            throw new IllegalArgumentException("Mot de passe invalide");
        }
        if (!ValidationUtil.isPositiveNumber(patient.getWeight())) {
            throw new IllegalArgumentException("Poids doit être positif");
        }
        if (!ValidationUtil.isPositiveNumber(patient.getHeight())) {
            throw new IllegalArgumentException("Taille doit être positif");
        }
        Role patientRole = roleRepo.findByRoleName(RoleType.PATIENT);
        patient.setRole(patientRole);
        patientRepo.save(patient);
    }
}
