package controller;

import bo.ContractorBoImpl;
import bo.CustomerBoImpl;
import bo.EmployeeBoImpl;
import model.Contractor;
import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet",urlPatterns = "/HomePage")
public class HomeServlet extends HttpServlet {

    private CustomerBoImpl customerBoImpl = new CustomerBoImpl();
    private ContractorBoImpl contractorBoImpl = new ContractorBoImpl();

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
                case "AddCustomer":
                    addCustomer(request, response);
                    break;
                case "EditCustomer":
                    editCustomer(request, response);
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
        String searchListCustomerUseService = request.getParameter("searchListCustomerUseService");
        if (search!=null) {
            action = "ListCustomer";
        }
        if (searchListCustomerUseService!=null) {
            action = "ListCustomerUseService";
        }
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "AddCustomer":
                    showAddCustomer(request, response);
                    break;
                case "ViewCustomer":
                    showViewCustomer(request, response);
                    break;
                case "ListCustomer":
                    showListCustomer(request, response);
                    break;
                case "ListCustomerUseService":
                    showListCustomerUseService(request, response);
                    break;
                case "EditCustomer":
                    showEditCustomer(request, response);
                    break;
                case "DeleteCustomer":
                    deleteCustomer(request, response);
                    break;
                default:
                    showHomePage(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Customer getRequestCustomer(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        if (request.getParameter("id") !=null){
            customer.setId(Integer.parseInt(request.getParameter("id")));
        }
        customer.setName(request.getParameter("NameCustomer"));
        customer.setBirthDay(request.getParameter("BirthDayCustomer"));
        customer.setGender(request.getParameter("GenderCustomer"));
        customer.setIdCard(request.getParameter("IdCardCustomer"));
        customer.setAddress(request.getParameter("AddressCustomer"));
        customer.setPhoneNumber(request.getParameter("PhoneNumberCustomer"));
        customer.setEmail(request.getParameter("EmailCustomer"));
        customer.setIdCustomerType(Integer.parseInt(request.getParameter("TypeCustomer")));
        return customer;
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String next = request.getParameter("next");
        String search = request.getParameter("search");
        List<Customer> customerList = customerBoImpl.paging(search,next);
        request.setAttribute("Search",request.getParameter("search"));
        request.setAttribute("ListCustomer", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/customer/ListCustomer.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showListCustomerUseService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String next = request.getParameter("next");
        String search = request.getParameter("searchListCustomerUseService");
        List<Contractor> contractorList = contractorBoImpl.getListUserUsingService(search,next);
        request.setAttribute("Search",request.getParameter("searchListCustomerUseService"));
        request.setAttribute("ListContractor", contractorList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/customer/ListCustomerUseService.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showAddCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ListTypeCustomer", customerBoImpl.getListCustomerType());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/customer/AddNewCustomer.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("CustomerDetail",customerBoImpl.getCustomerById(id));
        request.setAttribute("ListTypeCustomer", customerBoImpl.getListCustomerType());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/customer/EditCustomer.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showViewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("CustomerDetail",customerBoImpl.getCustomerById(id));
        request.setAttribute("ListTypeCustomer", customerBoImpl.getListCustomerType());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/customer/ViewCustomer.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/HomePage.jsp");
        requestDispatcher.forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = getRequestCustomer(request,response);
        customerBoImpl.insertNewCustomer(customer);
        showListCustomer(request, response);
    }
    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = getRequestCustomer(request,response);;
        customerBoImpl.updateCustomer(customer);
        showViewCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Customer customer =  customerBoImpl.getCustomerById(id);
        customer.setFlag(false);
        customerBoImpl.updateCustomer(customer);
        showListCustomer(request, response);
    }
}
