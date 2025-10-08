package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.Role;
import ma.clinique.project.models.enums.RoleType;

public interface IRoleRepository {
    Role findByRoleName(RoleType roleName);
    void save(Role role);
}
