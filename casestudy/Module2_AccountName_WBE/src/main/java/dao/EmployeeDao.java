package dao;

import model.Employee;

import java.util.List;

public interface EmployeeDao<E> {
    List<E> getListAll();
    void insert(E employee);
    void update(E employee);
    List<Employee> getListNext(int pageCount);
    List<Employee> getListSearchNext(int pageSearch, String search);
}
