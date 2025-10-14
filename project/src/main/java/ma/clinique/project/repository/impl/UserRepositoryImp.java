package ma.clinique.project.repository.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import ma.clinique.project.models.User;
import ma.clinique.project.repository.interfaces.IUserRepository;
import ma.clinique.project.utils.PasswordUtil;

import java.util.List;

public class UserRepositoryImp implements IUserRepository {

    private EntityManager em;
    public UserRepositoryImp(EntityManager em) {
        this.em = em;
    }
    @Override
    public  User  findByEmail(String email){
        try {
            String jpql  = "SELECT u FROM User u WHERE u.email = :email";
            User user = em.createQuery(jpql ,User.class)
                    .setParameter("email",email)
                    .getSingleResult();
                return user;
        }catch(NoResultException e){
            return null;
        }
    }



    @Override
    public void delete(User user) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            if (user != null) {
                em.remove(user);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findAll() {
        try {
            String jpql = "SELECT u FROM User u";
            return em.createQuery(jpql, User.class).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public User findById(int id) {
        return em.find(User.class, id);
    }

}
