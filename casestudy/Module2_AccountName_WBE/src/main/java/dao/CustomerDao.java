package dao;

import model.Customer;

import java.util.List;

public interface CustomerDao<E> {

    void insert(E customer);

    void update(E customer);

    List<Customer> getListNext(int pageCount);

    List<Customer> getListSearchNext(int pageSearch, String search);

    Customer getCustomerById(String id);
}
