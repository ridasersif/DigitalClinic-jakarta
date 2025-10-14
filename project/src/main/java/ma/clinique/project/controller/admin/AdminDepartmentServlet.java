package ma.clinique.project.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ma.clinique.project.models.Department;
import ma.clinique.project.repository.impl.DepartmentRepositoryImpl;
import ma.clinique.project.service.impl.DepartmentServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/departments")
public class AdminDepartmentServlet extends HttpServlet {

    private DepartmentServiceImpl departmentService;

    @Override
    public void init() {
        departmentService = new DepartmentServiceImpl(
                new DepartmentRepositoryImpl(JPAUtil.getEntityManager())
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                Integer id = Integer.parseInt(request.getParameter("id"));
                Department dep = departmentService.findById(id);
                HttpSession session = request.getSession();
                session.setAttribute("editDepartment", dep);
                session.setAttribute("showModal", true);
                session.setAttribute("modalAction", "update");
                response.sendRedirect(request.getContextPath() + "/admin/departments");
                break;
            case "delete":
                deleteDepartment(request, response);
                break;

            default:
                listDepartments(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createDepartment(request, response);
        } else if ("update".equals(action)) {
            updateDepartment(request, response);
        }
    }

    private void listDepartments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("editDepartment") != null) {
            request.setAttribute("editDepartment", session.getAttribute("editDepartment"));
            request.setAttribute("showModal", session.getAttribute("showModal"));
            request.setAttribute("modalAction", session.getAttribute("modalAction"));
            session.removeAttribute("editDepartment");
            session.removeAttribute("showModal");
            session.removeAttribute("modalAction");
        }

        List<Department> departments = departmentService.findAll();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/WEB-INF/views/admin/departments.jsp").forward(request, response);
    }

    private void createDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Department department = new Department();
            department.setName(name);
            department.setDescription(description);
            departmentService.save(department);

            response.sendRedirect(request.getContextPath() + "/admin/departments?success=created");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/departments?error=true");
        }
    }

    private void updateDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Department department = departmentService.findById(id);
            department.setName(name);
            department.setDescription(description);
            departmentService.update(department);

            response.sendRedirect(request.getContextPath() + "/admin/departments?success=updated");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/departments?error=true");
        }
    }

    private void deleteDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Integer id = Integer.parseInt(request.getParameter("id"));
            departmentService.delete(id);
            response.sendRedirect(request.getContextPath() + "/admin/departments?success=deleted");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin/departments?error=true");
        }
    }
}