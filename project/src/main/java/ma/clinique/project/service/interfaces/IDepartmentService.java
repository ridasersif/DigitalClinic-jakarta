package ma.clinique.project.service.interfaces;

import ma.clinique.project.models.Department;

import java.util.List;

public interface IDepartmentService {
    void save(Department department);
    void update(Department department);
    void delete(Integer id);
    Department findById(Integer id);
    List<Department> findAll();
}
