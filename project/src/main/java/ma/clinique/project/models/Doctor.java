
package ma.clinique.project.models;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "doctors")
@PrimaryKeyJoinColumn(name = "user_id")

public class Doctor extends User {

    @Column(nullable = false, length = 100)
    private String specialty;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Appointment> appointments = new ArrayList<>();

    // Constructeurs
    public Doctor() {
        super();
    }

    public Doctor(String firstName, String lastName, String email, String password,
                  Role role, String specialty, Department department) {
        super(firstName, lastName, email, password, role);
        this.specialty = specialty;
        this.department = department;
    }

    // Getters et Setters
    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public void addAppointment(Appointment appointment) {
        appointments.add(appointment);
        appointment.setDoctor(this);
    }

    public void removeAppointment(Appointment appointment) {
        appointments.remove(appointment);
        appointment.setDoctor(null);
    }

    @Override
    public String toString() {
        return "Doctor{id=" + getId() + ", name='" + getFullName() +
                "', specialty='" + specialty + "', department=" +
                (department != null ? department.getName() : "N/A") + "}";
    }
}