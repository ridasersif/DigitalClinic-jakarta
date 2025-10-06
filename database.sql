-- Create database
CREATE DATABASE DigitalClinic;
USE DigitalClinic;

-- Roles table
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

-- Departments table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Users table (abstract Person) - common data
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Patients table (specific to patients)
CREATE TABLE patients (
    user_id INT PRIMARY KEY,
    weight FLOAT NULL,
    height FLOAT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Doctors table (specific to doctors)
CREATE TABLE doctors (
    user_id INT PRIMARY KEY,
    specialty VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Admins table (specific to admins)
CREATE TABLE admins (
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Rooms table
CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    capacity INT NOT NULL
);

-- Appointments table
CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('RESERVED', 'VALIDATED', 'CANCELLED', 'COMPLETED') NOT NULL,
    report TEXT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(user_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(user_id),
    FOREIGN KEY (room_id) REFERENCES rooms(id),
    CONSTRAINT unique_room_time UNIQUE (room_id, appointment_date, appointment_time)
);

-- Insert roles
INSERT INTO roles (role_name) VALUES ('PATIENT'), ('DOCTOR'), ('ADMIN');

-- Insert sample departments
INSERT INTO departments (name) VALUES ('Cardiology'), ('Dermatology');
