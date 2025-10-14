package ma.clinique.project.service.impl;

import ma.clinique.project.models.Department;
import ma.clinique.project.models.User;
import ma.clinique.project.models.enums.RoleType;
import ma.clinique.project.repository.impl.DepartmentRepositoryImpl;
import ma.clinique.project.service.interfaces.IDepartmentService;
import ma.clinique.project.utils.ValidationUtil;

import java.util.List;

public class DepartmentServiceImpl implements IDepartmentService {

    private final DepartmentRepositoryImpl departmentRepo;

    public DepartmentServiceImpl(DepartmentRepositoryImpl departmentRepo) {
        this.departmentRepo = departmentRepo;
    }
    @Override
    public void save(Department department) {
        department.setName(ValidationUtil.sanitizeInput(department.getName()));

        if (!ValidationUtil.isNotEmpty(department.getName())) {
            throw new IllegalArgumentException("Le nom du département ne peut pas être vide !");
        }
        departmentRepo.save(department);
    }

    public void update(Department department) {
        department.setName(ValidationUtil.sanitizeInput(department.getName()));

        if (!ValidationUtil.isNotEmpty(department.getName())) {
            throw new IllegalArgumentException("Le nom du département ne peut pas être vide !");
        }
        departmentRepo.update(department);
    }

    @Override
    public void delete(Integer id) {
        departmentRepo.delete(id);
    }

    @Override
    public Department findById(Integer id) {
        return departmentRepo.findById(id);
    }

    @Override
    public List<Department> findAll() {
        return departmentRepo.findAll();
    }
}
