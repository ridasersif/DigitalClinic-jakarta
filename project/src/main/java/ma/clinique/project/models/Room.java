package ma.clinique.project.models;

import jakarta.persistence.*;
import ma.clinique.project.models.enums.RoomStatus;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true, length = 100)
    private String name;

    @Column(nullable = false)
    private Integer capacity;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private RoomStatus status = RoomStatus.LIBRE;

    // ✅ Each room belongs to one department
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Appointment> appointments = new ArrayList<>();

    // Constructors
    public Room() {}

    public Room(String name, Integer capacity, Department department) {
        this.name = name;
        this.capacity = capacity;
        this.status = RoomStatus.LIBRE;
        this.department = department;
    }

    // Getters & Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public RoomStatus getStatus() {
        return status;
    }

    public void setStatus(RoomStatus status) {
        this.status = status;
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
        appointment.setRoom(this);
        this.status = RoomStatus.OCCUPEE;
    }

    public void removeAppointment(Appointment appointment) {
        appointments.remove(appointment);
        appointment.setRoom(null);
        if (appointments.isEmpty()) {
            this.status = RoomStatus.LIBRE;
        }
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", capacity=" + capacity +
                ", status=" + status +
                ", department=" + (department != null ? department.getId() : "null") +
                ", appointmentsCount=" + appointments.size() +
                '}';
    }
}
