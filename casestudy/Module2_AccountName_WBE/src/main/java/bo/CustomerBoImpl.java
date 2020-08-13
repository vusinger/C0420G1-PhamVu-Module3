package bo;

import dao.CustomerDaoImpl;
import dao.GetAttachInfo;
import model.Customer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CustomerBoImpl implements CustomerBo{

    private CustomerDaoImpl customerDaoImpl = new CustomerDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pagein = 0;
    List<Customer> customerList = customerDaoImpl.getListAll();


    @Override
    public Customer getCustomerById(String id) {
        for (Customer customer : customerList) {
            if (customer.getId() == Integer.parseInt(id)) {
                return  customer;
            }
        }
        return null;
    }

    @Override
    public List<Customer> paging(String search, String next) {
        List<Customer> customerList = this.customerList;
        if (search!=null) {
            List<Customer> customerSearchList = new ArrayList<>();
            for (Customer customer: customerList) {
                if (customer.getName().toLowerCase().contains(search.toLowerCase().trim())) {
                    customerSearchList.add(customer);
                }
            }
            customerList = customerSearchList;
        }
        if (next==null) {
            pagein = 0;
            next = "false";
        }
        if (next!=null) {
            if (next.equals("true") && ((pagein+1) * 10 < customerList.size())) {
                ++pagein;
            } else if (next.equals("false") && (pagein > 0)) {
                --pagein;
            }
            List<Customer> paginListCustomer = new ArrayList<>();
            int index = 0;
            for (Customer customer : customerList) {
                ++index;
                if (index > pagein * 10) {
                    paginListCustomer.add(customer);
                }
                if (index >= (pagein + 1) * 10) break;
            }
            return paginListCustomer;
        }
        return customerList;
    }

    @Override
    public Map<Integer,String> getListCustomerType() {
        return getAttachInfo.loaikhach;
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDaoImpl.update(customer);
        this.customerList = customerDaoImpl.getListAll();
    }

    @Override
    public void insertNewCustomer(Customer customer) {
        customerDaoImpl.insert(customer);
        this.customerList = customerDaoImpl.getListAll();
    }
}
