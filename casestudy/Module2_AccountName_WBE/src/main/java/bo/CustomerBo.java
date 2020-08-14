package bo;

import model.Contractor;
import model.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerBo {

    Customer getCustomerById(String id);

    Customer getCustomerById(int id);

    Map<Integer, String> getListCustomerType();

    void updateCustomer(Customer customer);

    void deleteCustomer(Customer customer);

    void insertNewCustomer(Customer customer);

    List<Customer> getPaging(String search, String next);
}
