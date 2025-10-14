package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Room;
import ma.clinique.project.models.User;

import java.util.List;

public interface IRoomService {
    void save(User currentUser, Room room);
    void update(User currentUser, Room room);
    void deleteRoom(User currentUser, Integer id);
    Room findById(Integer id);
    List<Room> findAll();
}
