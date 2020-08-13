package bo;

import dao.EmployeeDaoImpl;
import dao.GetAttachInfo;
import model.Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EmployeeBoImpl implements EmployeeBo {

    private EmployeeDaoImpl employeeDaoImpl = new EmployeeDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
//    static int paging = 0;
    static int pageCount = 0;
    static int pageSearch = 0;
    private List<Employee> employeeList = employeeDaoImpl.getListAll();

    @Override
    public Employee getEmployeeById(String id) {
        for (Employee employee : employeeList) {
            if (employee.getId() == Integer.parseInt(id)) {
                return employee;
            }
        }
        return null;
    }

//    @Override
//    public List<Employee> paging(String search, String next) {
//        List<Employee> employeeList = this.employeeList;
//        if (search != null) {
//            List<Employee> employeeSearchList = new ArrayList<>();
//            for (Employee employee : employeeList) {
//                if (employee.getName().toLowerCase().contains(search.toLowerCase().trim())) {
//                    employeeSearchList.add(employee);
//                }
//            }
//            employeeList = employeeSearchList;
//        }
//        if (next == null) {
//            paging = 0;
//            next = "false";
//        }
//        if (next != null) {
//            if (next.equals("true") && ((paging + 1) * 10 < employeeList.size())) {
//                ++paging;
//            } else if (next.equals("false") && (paging > 0)) {
//                --paging;
//            }
//            List<Employee> paginListEmployee = new ArrayList<>();
//            int index = 0;
//            for (Employee employee : employeeList) {
//                ++index;
//                if (index > paging * 10) {
//                    paginListEmployee.add(employee);
//                }
//                if (index >= (paging + 1) * 10) break;
//            }
//            return paginListEmployee;
//        }
//        return employeeList;
//    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDaoImpl.update(employee);
        this.employeeList = employeeDaoImpl.getListAll();
    }

    @Override
    public void insertNewEmployee(Employee employee) {
        employeeDaoImpl.insert(employee);
        this.employeeList = employeeDaoImpl.getListAll();
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