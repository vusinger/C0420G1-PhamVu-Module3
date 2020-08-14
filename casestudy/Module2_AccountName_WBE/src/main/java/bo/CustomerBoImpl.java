package bo;

import dao.CustomerDaoImpl;
import dao.GetAttachInfo;
import model.Customer;

import java.util.List;
import java.util.Map;

public class CustomerBoImpl implements CustomerBo{

    private CustomerDaoImpl customerDaoImpl = new CustomerDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pageCount = 0;
    static int pageSearch = 0;


    @Override
    public Customer getCustomerById(String id) {
        return customerDaoImpl.getCustomerById(id);

    }

    @Override
    public Customer getCustomerById(int id) {
        return customerDaoImpl.getCustomerById(String.valueOf(id));
    }

    @Override
    public Map<Integer,String> getListCustomerType() {
        return getAttachInfo.loaikhach;
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDaoImpl.update(customer);
    }

    @Override
    public void deleteCustomer(Customer customer) {
        customer.setFlag(false);
        customerDaoImpl.update(customer);
    }

    @Override
    public void insertNewCustomer(Customer customer) {
        customerDaoImpl.insert(customer);
    }

    @Override
    public List<Customer> getPaging(String search, String next) {
        if (search == null) pageSearch = 0;
        if (next == null) pageCount = 0;
        if ("".equals(search) || search == null) {
            return getNextList(next);
        } else {
            return getNextSearch(search, next);
        }
    }

    private List<Customer> getNextSearch(String search, String next) {
        if ("true".equals(next)) pageSearch++; else if ("false".equals(next)) pageSearch--;
        if (pageSearch<0) pageSearch = 0;
        List<Customer> customerList = customerDaoImpl.getListSearchNext(pageSearch,search);
        if (customerList.size()==0) {
            pageSearch--;
            return customerDaoImpl.getListSearchNext(pageSearch-1,search);
        }
        return customerList;
    }

    private List<Customer> getNextList(String next) {
        if ("true".equals(next)) pageCount++; else if ("false".equals(next)) pageCount--;
        if (pageCount<0) pageCount = 0;
        List<Customer> customerList = customerDaoImpl.getListNext(pageCount);
        if (customerList.size()==0) {
            pageCount--;
            return customerDaoImpl.getListNext(pageCount);
        }
        return customerList;
    }
}
