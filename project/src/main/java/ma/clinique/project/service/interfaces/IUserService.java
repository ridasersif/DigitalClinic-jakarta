package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.User;

import java.util.List;

public interface IUserService {
    User login(String email, String password);
    boolean deleteUser(User targetUser, User currentUser);
    List<User> findAll(User currentUser);
    User findById(Integer id);
}
