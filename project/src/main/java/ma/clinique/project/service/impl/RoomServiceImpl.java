package ma.clinique.project.service.impl;

import ma.clinique.project.models.Room;
import ma.clinique.project.models.User;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.RoomRepositoryImpl;
import ma.clinique.project.service.interfaces.IRoomService;
import ma.clinique.project.utils.ValidationUtil;

public class RoomServiceImpl implements IRoomService {

    private RoomRepositoryImpl roomRepository;

    public RoomServiceImpl(RoomRepositoryImpl roomRepository) {
        this.roomRepository = roomRepository;
    }

    private void checkAdmin(User currentUser) {
        if (currentUser == null || !currentUser.getRole().getRoleName().equals(RoleType.ADMIN)) {
            throw new SecurityException("Seul l'admin peut effectuer cette action.");
        }
    }
    @Override
    public void save(User currentUser, Room room){
        checkAdmin(currentUser);
        room.setName(ValidationUtil.sanitizeInput(room.getName()));
        room.setCapacity(room.getCapacity());
        roomRepository.save(room);
    }

    @Override
    public void update(User currentUser, Room room) {
        checkAdmin(currentUser);
        room.setName(ValidationUtil.sanitizeInput(room.getName()));
        room.setCapacity(room.getCapacity());
        roomRepository.update(room);
    }
    @Override
    public void deleteRoom(User currentUser, Integer id) {
        checkAdmin(currentUser);
        roomRepository.deleteById(id);
    }
    @Override
    public Room findById(Integer id) {
        return roomRepository.findById(id);
    }
    @Override
    public java.util.List<Room> findAll() {
        return roomRepository.findAll();
    }
}
