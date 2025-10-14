package ma.clinique.project.controller.admin;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ma.clinique.project.models.Room;
import ma.clinique.project.models.User;
import ma.clinique.project.models.enums.RoomStatus;
import ma.clinique.project.repository.impl.DepartmentRepositoryImpl;
import ma.clinique.project.repository.impl.RoomRepositoryImpl;
import ma.clinique.project.service.impl.RoomServiceImpl;
import ma.clinique.project.utils.JPAUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/rooms")
public class AdminRoomServlet extends HttpServlet {

    private RoomServiceImpl roomService;
    private DepartmentRepositoryImpl departmentRepository;

    @Override
    public void init() {
        EntityManager em = JPAUtil.getEntityManager();
        departmentRepository = new DepartmentRepositoryImpl(em);
        RoomRepositoryImpl roomRepository = new RoomRepositoryImpl(em);
        roomService = new RoomServiceImpl(roomRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List departments = departmentRepository.findAll();
            request.setAttribute("departments", departments);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("departments", null);
        }

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                try {
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    Room room = roomService.findById(id);
                    HttpSession session = request.getSession();
                    session.setAttribute("editRoom", room);
                    session.setAttribute("showModal", true);
                    session.setAttribute("modalAction", "update");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + "/admin/rooms");
                break;
            case "delete":
                deleteRoom(request, response);
                break;
            default:
                listRooms(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("create".equals(action)) {
            createRoom(request, response);
        } else if ("update".equals(action)) {
            updateRoom(request, response);
        }
    }

    private void listRooms(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("editRoom") != null) {
            request.setAttribute("editRoom", session.getAttribute("editRoom"));
            request.setAttribute("showModal", session.getAttribute("showModal"));
            request.setAttribute("modalAction", session.getAttribute("modalAction"));
            session.removeAttribute("editRoom");
            session.removeAttribute("showModal");
            session.removeAttribute("modalAction");
        }

        try {
            List<Room> rooms = roomService.findAll();
            request.setAttribute("rooms", rooms);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("rooms", null);
        }

        request.getRequestDispatcher("/WEB-INF/views/admin/rooms.jsp").forward(request, response);
    }

    private void createRoom(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");

            String name = request.getParameter("name");
            Integer capacity = Integer.parseInt(request.getParameter("capacity"));
            Integer departmentId = Integer.parseInt(request.getParameter("departmentId"));

            Room room = new Room();
            room.setName(name);
            room.setCapacity(capacity);
            room.setDepartment(departmentRepository.findById(departmentId));
            room.setStatus(RoomStatus.LIBRE);

            roomService.save(currentUser, room);

            response.sendRedirect(request.getContextPath() + "/admin/rooms?success=created");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/rooms?error=true");
        }
    }

    private void updateRoom(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");

            Integer id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            Integer capacity = Integer.parseInt(request.getParameter("capacity"));
            String statusStr = request.getParameter("status");
            Integer departmentId = Integer.parseInt(request.getParameter("departmentId"));

            Room room = roomService.findById(id);
            room.setName(name);
            room.setCapacity(capacity);
            room.setDepartment(departmentRepository.findById(departmentId));
            room.setStatus(RoomStatus.valueOf(statusStr));

            roomService.update(currentUser, room);

            response.sendRedirect(request.getContextPath() + "/admin/rooms?success=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/rooms?error=true");
        }
    }

    private void deleteRoom(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");

            Integer id = Integer.parseInt(request.getParameter("id"));
            roomService.deleteRoom(currentUser, id);

            response.sendRedirect(request.getContextPath() + "/admin/rooms?success=deleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/rooms?error=true");
        }
    }
}
