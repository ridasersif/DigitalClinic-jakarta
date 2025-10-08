package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.interfaces.IRoleRepository;
import ma.clinique.project.service.interfaces.IRoleService;
import ma.clinique.project.utils.JPAUtil;

public class RoleRepositoryImpl implements IRoleRepository {

    private EntityManager em;

    public RoleRepositoryImpl(EntityManager em) {
        this.em = em;
    }
    @Override
    public Role findByRoleName(RoleType roleName) {
        TypedQuery<Role> query = em.createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName", Role.class);
        query.setParameter("roleName", roleName);
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    @Override
    public void save(Role role) {
        em.getTransaction().begin();
        em.persist(role);
        em.getTransaction().commit();
    }
}
