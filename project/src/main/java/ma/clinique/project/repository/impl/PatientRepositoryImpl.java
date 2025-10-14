
package ma.clinique.project.repository.impl;

import ma.clinique.project.models.Patient;
import ma.clinique.project.repository.interfaces.IPatientRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class PatientRepositoryImpl implements IPatientRepository {
    private EntityManager em;
    public PatientRepositoryImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Patient patient) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }





}















/*
    @Override
    public void update(Patient patient) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(patient);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }


    @Override
    public void delete(Patient patient) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.remove(em.contains(patient) ? patient : em.merge(patient));
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Patient findById(Long id) {
        return em.find(Patient.class, id);
    }

    @Override
    public List<Patient> findAll() {
        return em.createQuery("SELECT p FROM Patient p", Patient.class).getResultList();
    }

 */
