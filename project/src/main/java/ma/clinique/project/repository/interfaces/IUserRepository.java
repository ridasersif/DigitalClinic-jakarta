package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.User;

import java.util.List;

public interface IUserRepository {

    User findByEmail(String email);
    void delete(User user);
    List<User> findAll();
    User findById(int id);
}
