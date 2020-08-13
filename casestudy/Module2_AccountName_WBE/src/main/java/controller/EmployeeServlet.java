package controller;

import bo.EmployeeBoImpl;
import model.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/Employee")
public class EmployeeServlet extends HttpServlet {

    private EmployeeBoImpl employeeBoImpl = new EmployeeBoImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "AddEmployee":
                    addEmployee(request, response);
                    break;
                case "EditEmployee":
                    editEmployee(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String search = request.getParameter("search");
        if (search!=null) {
            action = "ListEmployee";
        }
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "AddEmployee":
                    showAddEmployee(request, response);
                    break;
                case "ViewEmployee":
                    showViewEmployee(request, response);
                    break;
                case "ListEmployee":
                    showListEmployee(request, response);
                    break;
                case "EditEmployee":
                    showEditEmployee(request, response);
                    break;
                case "DeleteEmployee":
                    deleteEmployee(request, response);
                    break;
                default:
                    showHomePage(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Employee getRequestEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        if (request.getParameter("id") !=null){
            employee.setId(Integer.parseInt(request.getParameter("id")));
        }
        employee.setName(request.getParameter("NameEmployee"));
        employee.setBirthDay(request.getParameter("BirthDayEmployee"));
        employee.setIdCard(request.getParameter("IdCardEmployee"));
        employee.setGender(request.getParameter("GenderEmployee"));
        employee.setSalary(request.getParameter("SalaryEmployee"));
        employee.setPhoneNumber(request.getParameter("PhoneNumberEmployee"));
        employee.setEmail(request.getParameter("EmailEmployee"));
        employee.setAddress(request.getParameter("AddressEmployee"));
        employee.setIdPosition(Integer.parseInt(request.getParameter("PositionEmployee")));
        employee.setIdLevel(Integer.parseInt(request.getParameter("LevelEmployee")));
        employee.setIdDepartment(Integer.parseInt(request.getParameter("DepartmentEmployee")));
        return employee;
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String next = request.getParameter("next");
        String search = request.getParameter("search");
//        List<Employee> employeeList = employeeBoImpl.paging(search,next);
        List<Employee> employeeList = employeeBoImpl.getPaging(search,next);
        request.setAttribute("Search",request.getParameter("search"));
        request.setAttribute("ListEmployee", employeeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/employee/ListEmployee.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showAddEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("PositionEmployee", employeeBoImpl.getPosition());
        request.setAttribute("LevelEmployee", employeeBoImpl.getLevel());
        request.setAttribute("DepartmentEmployee", employeeBoImpl.getDepartment());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/employee/AddNewEmployee.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("EmployeeDetail",employeeBoImpl.getEmployeeById(id));
        request.setAttribute("PositionEmployee", employeeBoImpl.getPosition());
        request.setAttribute("LevelEmployee", employeeBoImpl.getLevel());
        request.setAttribute("DepartmentEmployee", employeeBoImpl.getDepartment());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/employee/EditEmployee.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showViewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("EmployeeDetail",employeeBoImpl.getEmployeeById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/employee/ViewEmployee.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/HomePage.jsp");
        requestDispatcher.forward(request, response);
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = getRequestEmployee(request,response);
        employeeBoImpl.insertNewEmployee(employee);
        showListEmployee(request, response);
    }
    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = getRequestEmployee(request,response);;
        employeeBoImpl.updateEmployee(employee);
        showViewEmployee(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Employee employee =  employeeBoImpl.getEmployeeById(id);
        employee.setFlag(false);
        employeeBoImpl.updateEmployee(employee);
        showListEmployee(request, response);
    }
}
