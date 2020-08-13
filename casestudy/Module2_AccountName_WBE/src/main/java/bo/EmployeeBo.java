package bo;

import model.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeBo {
    Employee getEmployeeById(String id);

    Employee getEmployeeById(int id);

    void updateEmployee(Employee employee);

    void insertNewEmployee(Employee employee);

    Map<Integer, String> getPosition();

    Map<Integer, String> getLevel();

    Map<Integer, String> getDepartment();

    List<Employee> getPaging(String search, String next);
}
