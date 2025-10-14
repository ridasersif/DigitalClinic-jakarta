package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import ma.clinique.project.models.Room;
import ma.clinique.project.repository.interfaces.IRoomRepository;

public class RoomRepositoryImpl implements IRoomRepository {

    private EntityManager em;
    public RoomRepositoryImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Room room) {
       em.getTransaction().begin();
       em.persist(room);
       em.getTransaction().commit();
    }

    @Override
    public void update(Room room) {
        em.getTransaction().begin();
        em.merge(room);
        em.getTransaction().commit();
    }

    @Override
    public void deleteById(Integer id) {
        em.getTransaction().begin();
        try {
            Room room = em.find(Room.class, id);
            if (room != null) {
                em.remove(room);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public Room findById(Integer id) {
        return em.find(Room.class, id);
    }
    @Override
    public java.util.List<Room> findAll() {
        return em.createQuery("SELECT r FROM Room r", Room.class).getResultList();
    }

}
