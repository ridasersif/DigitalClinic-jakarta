package ma.clinique.project.controller.admin;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.clinique.project.models.Doctor;
import ma.clinique.project.models.User;
import ma.clinique.project.repository.impl.DepartmentRepositoryImpl;
import ma.clinique.project.repository.impl.DoctorRepositoryImpl;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.service.impl.DoctorServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDoctorServlet", urlPatterns = "/admin/doctors")
public class AdminDoctorServlet extends HttpServlet {
    private EntityManager em;
    private DoctorServiceImpl doctorService;
    private DoctorRepositoryImpl doctorRepositoryImpl;
    private RoleRepositoryImpl roleRepositoryImpl;
    private DepartmentRepositoryImpl departmentRepositoryImpl;
    @Override
    public void init() throws ServletException {
        em = JPAUtil.getEntityManager();
        doctorRepositoryImpl = new DoctorRepositoryImpl(em);
        roleRepositoryImpl = new RoleRepositoryImpl(em);
        departmentRepositoryImpl = new DepartmentRepositoryImpl(em);
        doctorService = new DoctorServiceImpl(doctorRepositoryImpl, roleRepositoryImpl, departmentRepositoryImpl);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Doctor> doctors = doctorService.findAll();
        request.setAttribute("doctors", doctors);
        request.setAttribute("departments", departmentRepositoryImpl.findAll());

        request.getRequestDispatcher("/WEB-INF/views/admin/doctors.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addDoctor(request, currentUser);
                    response.sendRedirect(request.getContextPath() + "/admin/doctors?success=created");
                    break;

                case "edit":
                    editDoctor(request, currentUser);
                    response.sendRedirect(request.getContextPath() + "/admin/doctors?success=updated");
                    break;

                case "delete":
                    deleteDoctor(request, currentUser);
                    response.sendRedirect(request.getContextPath() + "/admin/doctors?success=deleted");
                    break;

                case "updateStatus":
                    updateStatus(request, currentUser);
                    response.sendRedirect(request.getContextPath() + "/admin/doctors?success=statusUpdated");
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/admin/doctors?error=unknownAction");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/doctors?error=true");
        }
    }

    private void addDoctor(HttpServletRequest request, User currentUser) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialty = request.getParameter("specialty");
        String licenseNumber = request.getParameter("licenseNumber");
        String password = request.getParameter("password");
        String statusParam = request.getParameter("status");
        String departmentIdStr = request.getParameter("departmentId");

        Integer departmentId = Integer.parseInt(departmentIdStr);

        Doctor doctor = new Doctor();
        doctor.setFirstName(firstName);
        doctor.setLastName(lastName);
        doctor.setEmail(email);
        doctor.setPhone(phone);
        doctor.setSpecialty(specialty);
        doctor.setLicenseNumber(licenseNumber);
        doctor.setPassword(password);

        if (statusParam != null && !statusParam.isEmpty()) {
            doctor.setStatus(ma.clinique.project.models.enums.DoctorStatus.valueOf(statusParam.toUpperCase()));
        }

        doctorService.save(currentUser, doctor, departmentId);
    }

    private void editDoctor(HttpServletRequest request, User currentUser) {
        Integer id = Integer.parseInt(request.getParameter("doctorId"));
        Doctor doctor = doctorService.findById(currentUser, id);

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialty = request.getParameter("specialty");
        String licenseNumber = request.getParameter("licenseNumber");
        String password = request.getParameter("password");
        String statusParam = request.getParameter("status");
        String departmentIdStr = request.getParameter("departmentId");

        doctor.setFirstName(firstName);
        doctor.setLastName(lastName);
        doctor.setEmail(email);
        doctor.setPhone(phone);
        doctor.setSpecialty(specialty);
        doctor.setLicenseNumber(licenseNumber);

        if (password != null && !password.trim().isEmpty()) {
            doctor.setPassword(password);
        }

        if (statusParam != null && !statusParam.isEmpty()) {
            doctor.setStatus(ma.clinique.project.models.enums.DoctorStatus.valueOf(statusParam.toUpperCase()));
        }

        Integer departmentId = Integer.parseInt(departmentIdStr);
        doctorService.update(currentUser, doctor, departmentId);
    }

    private void deleteDoctor(HttpServletRequest request, User currentUser) {
        Integer id = Integer.parseInt(request.getParameter("doctorId"));
        doctorService.delete(currentUser, id);
    }

    private void updateStatus(HttpServletRequest request, User currentUser) {
        Integer id = Integer.parseInt(request.getParameter("doctorId"));
        String newStatus = request.getParameter("status");
        doctorService.updateStatus(currentUser, id, newStatus);
    }
}