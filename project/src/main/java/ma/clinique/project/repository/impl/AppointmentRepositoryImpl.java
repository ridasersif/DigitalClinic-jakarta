package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;

import java.time.LocalDate;
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

    @Override
    public List<Appointment> findByDoctorAndDate(Integer doctorId, LocalDate date) {
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.doctor.id = :doctorId " +
                                "AND a.appointmentDate = :date " +
                                "AND a.status <> ma.clinique.project.models.enums.AppointmentStatus.CANCELLED",
                        Appointment.class)
                .setParameter("doctorId", doctorId)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<Appointment> findByRoomAndDate(Integer roomId, LocalDate date) {
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.room.id = :roomId " +
                                "AND a.appointmentDate = :date " +
                                "AND a.status <> ma.clinique.project.models.enums.AppointmentStatus.CANCELLED",
                        Appointment.class)
                .setParameter("roomId", roomId)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<Appointment> findByPatientAndDate(Integer patientId, LocalDate date) {
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.patient.id = :patientId " +
                                "AND a.appointmentDate = :date " +
                                "AND a.status <> ma.clinique.project.models.enums.AppointmentStatus.CANCELLED",
                        Appointment.class)
                .setParameter("patientId", patientId)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<Appointment> findAllAppointmentsByDoctorId(Integer doctorId){
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.doctor.id = :doctorId ",
                        Appointment.class)
                .setParameter("doctorId", doctorId)
                .getResultList();
    }

    @Override
    public List<Appointment> findAllAppointmentsByPatientId(Integer patientId){
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.patient.id = :patientId ",
                        Appointment.class)
                .setParameter("patientId", patientId)
                .getResultList();
    }



    @Override
    public void cancelAppointment(Integer id) {
        try {
            em.getTransaction().begin();
            Appointment appointment = em.find(Appointment.class, id);
            if (appointment != null) {
                appointment.setStatus(ma.clinique.project.models.enums.AppointmentStatus.CANCELLED);
                em.merge(appointment);
                em.getTransaction().commit();
            } else {
                em.getTransaction().rollback();
            }
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

}
