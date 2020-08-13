package dao;

import model.Employee;

import java.util.List;

public interface EmployeeDao<E> {
    List<E> getListAll();
    void insert(E employee);
    void update(E employee);
    List<E> getListNext(int pageCount);
    List<E> getListSearchNext(int pageSearch, String search);
    E getEmployeeById(String id);
}
