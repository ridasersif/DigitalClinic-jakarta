package ma.clinique.project.service.impl;

import ma.clinique.project.models.Patient;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.PatientRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.service.interfaces.IPatientService;
import ma.clinique.project.utils.ValidationUtil;
import ma.clinique.project.utils.PasswordUtil;

public class PatientServiceImpl implements IPatientService {

    private final PatientRepositoryImpl patientRepo;
    private final RoleRepositoryImpl roleRepo;

    public PatientServiceImpl(PatientRepositoryImpl patientRepo, RoleRepositoryImpl roleRepo) {
        this.patientRepo = patientRepo;
        this.roleRepo = roleRepo;
    }

    @Override
    public void save(Patient patient) {
        //  Sanitization
        patient.setFirstName(ValidationUtil.sanitizeInput(patient.getFirstName()));
        patient.setLastName(ValidationUtil.sanitizeInput(patient.getLastName()));
        patient.setEmail(ValidationUtil.sanitizeInput(patient.getEmail()));

        //  Validation de base
        if (!ValidationUtil.isNotEmpty(patient.getFirstName())) {
            throw new IllegalArgumentException("Le prénom ne peut pas être vide !");
        }

        if (!ValidationUtil.isNotEmpty(patient.getLastName())) {
            throw new IllegalArgumentException("Le nom ne peut pas être vide !");
        }

        if (!ValidationUtil.isValidEmail(patient.getEmail())) {
            throw new IllegalArgumentException("Adresse e-mail invalide !");
        }

        if (!ValidationUtil.isStrongPassword(patient.getPassword())) {
            throw new IllegalArgumentException("Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre !");
        }

        if (!ValidationUtil.isValidWeight(patient.getWeight())) {
            throw new IllegalArgumentException("Le poids doit être supérieur à 0 !");
        }

        if (!ValidationUtil.isValidHeight(patient.getHeight())) {
            throw new IllegalArgumentException("La taille doit être supérieure à 0 !");
        }

        //  Hachage du mot de passe
        String hashedPassword = PasswordUtil.hashPassword(patient.getPassword());
        patient.setPassword(hashedPassword);

        //  Attribution du rôle
        Role patientRole = roleRepo.findByRoleName(RoleType.PATIENT);
        patient.setRole(patientRole);

        // Sauvegarde
        patientRepo.save(patient);
    }
}
