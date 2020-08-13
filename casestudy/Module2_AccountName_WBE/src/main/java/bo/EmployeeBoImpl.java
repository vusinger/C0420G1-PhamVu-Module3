package bo;

import dao.EmployeeDaoImpl;
import dao.GetAttachInfo;
import model.Employee;

import java.util.List;
import java.util.Map;

public class EmployeeBoImpl implements EmployeeBo {

    private EmployeeDaoImpl employeeDaoImpl = new EmployeeDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pageCount;
    static int pageSearch;

    @Override
    public Employee getEmployeeById(String id) {
        return employeeDaoImpl.getEmployeeById(id);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return employeeDaoImpl.getEmployeeById(String.valueOf(id));
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDaoImpl.update(employee);
    }

    @Override
    public void insertNewEmployee(Employee employee) {
        employeeDaoImpl.insert(employee);
    }

    @Override
    public Map<Integer, String> getPosition() {
        return getAttachInfo.vitri;
    }

    @Override
    public Map<Integer, String> getLevel() {
        return getAttachInfo.trinhdo;
    }

    @Override
    public Map<Integer, String> getDepartment() {
        return getAttachInfo.bophan;
    }

    @Override
    public List<Employee> getPaging(String search, String next) {
        if (search == null) pageSearch = 0;
        if (next == null) pageCount = 0;
        if ("".equals(search) || search == null) {
            return getNextList(next);
        } else {
            return getNextSearch(search, next);
        }
    }

    private List<Employee> getNextSearch(String search, String next) {
        if ("true".equals(next)) pageSearch++; else if ("false".equals(next)) pageSearch--;
        if (pageSearch<0) pageSearch = 0;
        List<Employee> employeeList = employeeDaoImpl.getListSearchNext(pageSearch,search);
        if (employeeList.size()==0) {
            pageSearch--;
            return employeeDaoImpl.getListSearchNext(pageSearch-1,search);
        }
        return employeeList;
    }

    private List<Employee> getNextList(String next) {
        if ("true".equals(next)) pageCount++; else if ("false".equals(next)) pageCount--;
        if (pageCount<0) pageCount = 0;
        List<Employee> employeeList = employeeDaoImpl.getListNext(pageCount);
        if (employeeList.size()==0) {
            pageCount--;
            return employeeDaoImpl.getListNext(pageCount-1);
        }
        return employeeList;
    }
}