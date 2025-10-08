package ma.clinique.project.models;

import jakarta.persistence.*;

@Entity
@Table(name = "admins")
@PrimaryKeyJoinColumn(name = "user_id")
public class Admin extends User {

    public Admin() {
        super();
    }

    public Admin(String firstName, String lastName, String email, String password, Role role) {
        super(firstName, lastName, email, password, role);
    }

    @Override
    public String toString() {
        return "Admin{id=" + getId() + ", name='" + getFullName() + "'}";
    }
}