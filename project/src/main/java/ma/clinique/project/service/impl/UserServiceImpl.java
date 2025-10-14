package ma.clinique.project.service.impl;

import ma.clinique.project.models.User;
import ma.clinique.project.repository.interfaces.IUserRepository;
import ma.clinique.project.service.interfaces.IUserService;
import ma.clinique.project.utils.PasswordUtil;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserRepository userRepository;
    public UserServiceImpl(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }
    public User login(String email, String password){
        User user = userRepository.findByEmail(email);
        if(user != null && PasswordUtil.verifyPassword(password,user.getPassword())){
           return user;
        }
        return null;
    }
    @Override
    public boolean deleteUser(User targetUser, User currentUser){
        if(currentUser.getRole().getRoleName().name().equals("ADMIN")){
            userRepository.delete(targetUser);
            return true;
        }else if(currentUser.getRole().getRoleName().name().equals("PATIENT")){
            if(currentUser.getId().equals(targetUser.getId())){
                userRepository.delete(targetUser);
                return true;
            }else return false;
        }else if(currentUser.getRole().getRoleName().name().equals("DOCTOR")){
            return false;
        }
        return false;
    }

    @Override
    public List<User> findAll(User currentUser){
        if(currentUser.getRole().getRoleName().name().equals("ADMIN")){
            return userRepository.findAll();
        }else{
           return new ArrayList<>();
        }
    }

    @Override
    public User findById(Integer id){
        return userRepository.findById(id);
    }
}
