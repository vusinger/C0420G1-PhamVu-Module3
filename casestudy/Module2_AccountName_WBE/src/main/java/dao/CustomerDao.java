package dao;

import model.Customer;

import java.util.List;

public interface CustomerDao<E> {
    List<E> getListAll();
    void insert(E customer);
    void update(E customer);
    Customer getCustomerById(String id);
}
