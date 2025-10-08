package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;

public interface IRoleService {
    Role findByRoleName(RoleType roleName);
    void save(Role role);
}
