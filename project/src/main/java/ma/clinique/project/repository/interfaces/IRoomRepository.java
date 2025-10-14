package ma.clinique.project.repository.interfaces;
import ma.clinique.project.models.Room;

import java.util.List;

public interface IRoomRepository {
    void save(Room room);
    void update(Room room);
    void deleteById(Integer id);
    Room findById(Integer id);
    List<Room> findAll();
    /*





     */
}
