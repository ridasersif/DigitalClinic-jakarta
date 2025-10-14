package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import ma.clinique.project.models.Department;
import ma.clinique.project.repository.interfaces.IDepartmentRepository;
import java.util.List;

public class DepartmentRepositoryImpl implements IDepartmentRepository {

    private final EntityManager em;

    public DepartmentRepositoryImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Department department) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            if (department.getId() == null) {
                em.persist(department);
            } else {
                em.merge(department);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void update(Department department) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(department);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }
    @Override
    public void delete(Integer id) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Department dep = em.find(Department.class, id);
            if (dep != null) {
                em.remove(dep);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }


    @Override
    public Department findById(Integer id) {
        return em.find(Department.class, id);
    }


    @Override
    public List<Department> findAll() {
        return em.createQuery("FROM Department", Department.class).getResultList();
    }

}
