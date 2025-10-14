package ma.clinique.project.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import ma.clinique.project.models.Admin;
import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.models.User;
import ma.clinique.project.utils.JPAUtil;
import ma.clinique.project.utils.PasswordUtil;

import java.util.List;

@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            List<Role> roles = em.createQuery("SELECT r FROM Role r", Role.class).getResultList();
            if (roles.isEmpty()) {
                Role adminRole = new Role();
                adminRole.setRoleName(RoleType.ADMIN);
                em.persist(adminRole);

                Role doctorRole = new Role();
                doctorRole.setRoleName(RoleType.DOCTOR);
                em.persist(doctorRole);

                Role patientRole = new Role();
                patientRole.setRoleName(RoleType.PATIENT);
                em.persist(patientRole);

                System.out.println("Rôles créés par défaut !");
            }
            Long adminCount = em.createQuery(
                            "SELECT COUNT(u) FROM User u WHERE u.role.roleName = :role",
                            Long.class
                    ).setParameter("role", RoleType.ADMIN)
                    .getSingleResult();

            if (adminCount == 0) {
                Role adminRole = em.createQuery(
                                "SELECT r FROM Role r WHERE r.roleName = :role",
                                Role.class
                        ).setParameter("role", RoleType.ADMIN)
                        .getSingleResult();

                Admin admin = new Admin();
                admin.setFirstName("Admin");
                admin.setLastName("Principal");
                admin.setEmail("admin@clinique.com");
                admin.setPassword(PasswordUtil.hashPassword("admin123"));
                admin.setRole(adminRole);
                em.persist(admin);
                System.out.println("Admin par défaut créé : admin@clinique.com / admin123");
            } else {
                System.out.println("Un admin existe déjà, aucun besoin de recréer.");
            }

            tx.commit();

        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // rien à faire ici
    }
}
