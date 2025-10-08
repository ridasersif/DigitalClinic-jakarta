package ma.clinique.project;

import ma.clinique.project.utils.JPAUtil;
import jakarta.persistence.EntityManager;

public class TestConnection {
    public static void main(String[] args) {
        EntityManager em = JPAUtil.getEntityManager();
        System.out.println("Connected to Database successfully!");
        em.close();
        JPAUtil.close();
    }
}
