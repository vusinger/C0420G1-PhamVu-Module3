package bo;

import model.Contractor;
import model.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerBo {

    Customer getCustomerById(String id);

    Customer getCustomerById(int id);

    List<Customer> paging(String search, String next);

    Map<Integer, String> getListCustomerType();

    void updateCustomer(Customer customer);

    void insertNewCustomer(Customer customer);

}
