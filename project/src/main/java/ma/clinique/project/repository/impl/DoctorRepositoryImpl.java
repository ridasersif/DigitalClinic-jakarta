package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.enums.DoctorStatus;
import ma.clinique.project.repository.interfaces.IDoctorRepository;

import java.util.List;

public class DoctorRepositoryImpl implements IDoctorRepository {

    private final EntityManager em;

    public DoctorRepositoryImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Doctor doctor) {
        em.getTransaction().begin();
        em.persist(doctor);
        em.getTransaction().commit();
    }

    @Override
    public void update(Doctor doctor) {
        em.getTransaction().begin();
        em.merge(doctor);
        em.getTransaction().commit();
    }

    @Override
    public void deleteById(Integer id) {
        Doctor doctor = em.find(Doctor.class, id);
        if (doctor != null) {
            em.getTransaction().begin();
            em.remove(doctor);
            em.getTransaction().commit();
        }
    }

    @Override
    public Doctor findById(Integer id) {
        return em.find(Doctor.class, id);
    }

    @Override
    public List<Doctor> findAll() {
        return em.createQuery("SELECT d FROM Doctor d", Doctor.class).getResultList();
    }

    @Override
    public void updateStatus(Integer id, String newStatus) {
        Doctor doctor = em.find(Doctor.class, id);
        if (doctor != null) {
            em.getTransaction().begin();
            doctor.setStatus(DoctorStatus.valueOf(newStatus.toUpperCase()));
            em.merge(doctor);
            em.getTransaction().commit();
        }
    }


}
