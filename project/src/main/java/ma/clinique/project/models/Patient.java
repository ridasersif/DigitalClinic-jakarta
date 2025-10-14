package ma.clinique.project.models;

import jakarta.persistence.*;
import jakarta.persistence.Table;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
@PrimaryKeyJoinColumn(name = "user_id")

public class Patient extends User {

    @Column(nullable = true)
    private Float weight;

    @Column(nullable = true)
    private Float height;


    @OneToMany(mappedBy = "patient",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<Appointment> appointments = new ArrayList<>();






    // Constructeurs
    public Patient() {
        super();
    }

    public Patient(String firstName, String lastName, String email, String password, Role role, Float weight, Float height) {
        super(firstName, lastName, email, password, role);
        this.weight = weight;
        this.height = height;
    }

    // Getters et Setters
    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }

    public void addAppointment(Appointment appointment) {
        appointments.add(appointment);
        appointment.setPatient(this);
    }

    public void removeAppointment(Appointment appointment) {
        appointments.remove(appointment);
        appointment.setPatient(null);
    }

    // Calcul IMC (Indice de Masse Corporelle)
    public Float calculateBMI() {
        if (weight != null && height != null && height > 0) {
            return weight / (height * height);
        }
        return null;
    }

    @Override
    public String toString() {
        return "Patient{id=" + getId() + ", name='" + getFullName() +
                "', weight=" + weight + ", height=" + height + "}";
    }

}
