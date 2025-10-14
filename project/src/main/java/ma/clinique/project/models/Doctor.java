package ma.clinique.project.models;

import jakarta.persistence.*;
import ma.clinique.project.models.enums.DoctorStatus;

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

    @OneToMany(mappedBy = "doctor",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<Appointment> appointments = new ArrayList<>();

    @Column(length = 20)
    private String phone;

    @Column(name = "license_number", length = 50, unique = true)
    private String licenseNumber;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private DoctorStatus status;

    // Constructors
    public Doctor() {
        super();
    }

    public Doctor(String firstName, String lastName, String email, String password,
                  Role role, String specialty, Department department,
                  String phone, String licenseNumber, DoctorStatus status) {
        super(firstName, lastName, email, password, role);
        this.specialty = specialty;
        this.department = department;
        this.phone = phone;
        this.licenseNumber = licenseNumber;
        this.status = status;
    }
    // Getters & Setters
    public String getSpecialty() { return specialty; }
    public void setSpecialty(String specialty) { this.specialty = specialty; }

    public Department getDepartment() { return department; }
    public void setDepartment(Department department) { this.department = department; }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public DoctorStatus getStatus() { return status; }
    public void setStatus(DoctorStatus status) { this.status = status; }

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
                (department != null ? department.getName() : "N/A") +
                ", phone='" + phone + "', licenseNumber='" + licenseNumber +
                "', status='" + status + "'}";
    }
}
