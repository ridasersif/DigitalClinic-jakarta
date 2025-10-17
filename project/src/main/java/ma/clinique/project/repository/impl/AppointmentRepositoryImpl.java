package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import ma.clinique.project.models.Appointment;
import ma.clinique.project.repository.interfaces.IAppointmentRepository;
import ma.clinique.project.models.enums.AppointmentStatus;

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
    public List<Appointment> findAllAppointmentsByPatientId(Integer patientId){
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.patient.id = :patientId ",
                        Appointment.class)
                .setParameter("patientId", patientId)
                .getResultList();
    }



    @Override
    public List<Appointment> findAllAppointmentsByDoctorIdAndByStatus(Integer doctorId, String status) {
        System.out.println("🔍 [DEBUG] findAllAppointmentsByDoctorIdAndByStatus called");
        System.out.println("➡ doctorId = " + doctorId);
        System.out.println("➡ status (raw) = " + status);

        try {
            AppointmentStatus enumStatus = AppointmentStatus.valueOf(status.trim().toUpperCase());
            System.out.println("✅ Enum status parsed successfully: " + enumStatus);

            List<Appointment> results = em.createQuery(
                            "SELECT a FROM Appointment a " +
                                    "WHERE a.doctor.id = :doctorId " +
                                    "AND a.status = :status",
                            Appointment.class)
                    .setParameter("doctorId", doctorId)
                    .setParameter("status", enumStatus)
                    .getResultList();

            System.out.println("📊 Found " + results.size() + " appointments for status " + enumStatus);
            return results;

        } catch (IllegalArgumentException e) {
            System.out.println("❌ [ERROR] Invalid status value: " + status);
            e.printStackTrace();
            return List.of();
        } catch (Exception e) {
            System.out.println("❌ [ERROR] Unexpected error in findAllAppointmentsByDoctorIdAndByStatus");
            e.printStackTrace();
            return List.of();
        }
    }

    @Override
    public void changeAppointmentStatus(Integer id, String status) {
        System.out.println("🔧 [DEBUG] changeAppointmentStatus called");
        System.out.println("➡ id = " + id + ", status = " + status);
        try {
            em.getTransaction().begin();
            Appointment appointment = em.find(Appointment.class, id);
            if (appointment != null) {
                AppointmentStatus enumStatus = AppointmentStatus.valueOf(status.trim().toUpperCase());
                appointment.setStatus(enumStatus);
                em.merge(appointment);
                em.getTransaction().commit();
                System.out.println("✅ Appointment status updated to " + enumStatus);
            } else {
                System.out.println("⚠️ Appointment not found for id = " + id);
                em.getTransaction().rollback();
            }
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.out.println("❌ [ERROR] Failed to change appointment status");
            e.printStackTrace();
        }
    }





    @Override
    public List<Appointment> findAllAppointmentsByDoctorId(Integer doctorId) {
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.doctor.id = :doctorId " +
                                "ORDER BY a.appointmentDate DESC, a.appointmentTime DESC",
                        Appointment.class)
                .setParameter("doctorId", doctorId)
                .getResultList();
    }

    @Override
    public List<Appointment> findTodayAppointmentsByDoctorId(Integer doctorId) {
        LocalDate today = LocalDate.now();
        return em.createQuery(
                        "SELECT a FROM Appointment a " +
                                "WHERE a.doctor.id = :doctorId " +
                                "AND a.appointmentDate = :today " +
                                "AND (a.status = 'VALIDATED' OR a.status = 'RESERVED') " +
                                "ORDER BY a.appointmentTime ASC",
                        Appointment.class)
                .setParameter("doctorId", doctorId)
                .setParameter("today", today)
                .getResultList();
    }

}
