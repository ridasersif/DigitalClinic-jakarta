package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;

import java.util.List;

public class AppointmentRepositoryImpl implements IAppointmentRepository {

    private final EntityManager em;
    public AppointmentRepositoryImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public boolean create(Appointment appointment) {
        try {
            em.getTransaction().begin();
            em.persist(appointment);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Appointment appointment) {
        try {
            em.getTransaction().begin();
            em.merge(appointment);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Integer id) {
        try {
            em.getTransaction().begin();
            Appointment appointment = em.find(Appointment.class, id);
            if (appointment != null) {
                em.remove(appointment);
                em.getTransaction().commit();
                return true;
            } else {
                em.getTransaction().rollback();
                return false;
            }
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public Appointment findById(Integer id) {
        return em.find(Appointment.class, id);
    }
    @Override
    public List<Appointment> findAll() {
        return em.createQuery("SELECT a FROM Appointment a", Appointment.class).getResultList();
    }
}
