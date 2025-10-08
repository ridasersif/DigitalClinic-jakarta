package ma.clinique.project.service.impl;

import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.RoleRepositoryImpl;
import ma.clinique.project.repository.interfaces.IRoleRepository;
import ma.clinique.project.service.interfaces.IRoleService;

public class RoleServiceImpl implements IRoleService {

    private  IRoleRepository roleRepo ;

    public RoleServiceImpl(IRoleRepository roleRepo) {
        this.roleRepo = roleRepo;
    }

    @Override
    public Role findByRoleName(RoleType roleName) {
        return roleRepo.findByRoleName(roleName);
    }

    @Override
    public void save(Role role) {
        roleRepo.save(role);
    }
}
