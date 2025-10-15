package ma.clinique.project.models;

import jakarta.persistence.*;
import ma.clinique.project.models.enums.AppointmentStatus;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;

@Entity
@Table(name = "appointments",
        uniqueConstraints = @UniqueConstraint(
                name = "unique_room_time",
                columnNames = {"room_id", "appointment_date", "appointment_time"}
        ))
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "appointment_date", nullable = false)
    private LocalDate appointmentDate;

    @Column(name = "appointment_time", nullable = false)
    private LocalTime appointmentTime;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private AppointmentStatus status;

    @Column(columnDefinition = "TEXT")
    private String report;

    @Column(columnDefinition = "TEXT")
    private String reason;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    // Constructors
    public Appointment() {}

    public Appointment(LocalDate appointmentDate, LocalTime appointmentTime,
                       AppointmentStatus status, Patient patient, Doctor doctor, Room room,
                       String reason, LocalDateTime createdAt) {
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.status = status;
        this.patient = patient;
        this.doctor = doctor;
        this.room = room;
        this.reason = reason;
        this.createdAt = createdAt;
    }

    // Getters & Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public LocalTime getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(LocalTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public AppointmentStatus getStatus() {
        return status;
    }

    public void setStatus(AppointmentStatus status) {
        this.status = status;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public void setAppointmentDateTime(LocalDateTime dateTime) {
        this.appointmentDate = dateTime.toLocalDate();
        this.appointmentTime = dateTime.toLocalTime();
    }

    public LocalDateTime getAppointmentDateTime() {
        return LocalDateTime.of(appointmentDate, appointmentTime);
    }

    public boolean isPast() {
        return getAppointmentDateTime().isBefore(LocalDateTime.now());
    }

    public boolean isFuture() {
        return getAppointmentDateTime().isAfter(LocalDateTime.now());
    }

    public boolean isToday() {
        return appointmentDate.equals(LocalDate.now());
    }

    @Override
    public String toString() {
        return "Appointment{id=" + id +
                ", date=" + appointmentDate +
                ", time=" + appointmentTime +
                ", status=" + status +
                ", patient=" + (patient != null ? patient.getFullName() : "N/A") +
                ", doctor=" + (doctor != null ? doctor.getFullName() : "N/A") +
                ", room=" + (room != null ? room.getName() : "N/A") +
                ", reason=" + reason +
                ", createdAt=" + createdAt +
                "}";
    }
}
