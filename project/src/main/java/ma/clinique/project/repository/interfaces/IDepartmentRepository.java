package ma.clinique.project.repository.interfaces;

import ma.clinique.project.models.Department;

import java.util.List;

public interface IDepartmentRepository {
    void save(Department department);
    void update(Department department);
    void delete(Integer id);
    Department findById(Integer id);
    List<Department> findAll();
}
