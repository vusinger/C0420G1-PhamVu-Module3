package bo;

import dao.ContractorDaoImpl;
import dao.GetAttachInfo;
import model.Contractor;

import java.util.List;
import java.util.Map;

public class ContractorBoImpl implements ContractorBo {

    private ContractorDaoImpl contractorDaoImpl = new ContractorDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pageCount;
    static int pageSearch;

    @Override
    public Contractor getContractorById(String id) {
        Contractor contractor = contractorDaoImpl.getContractorById(id);
        CustomerBoImpl customerBoImpl = new CustomerBoImpl();
        EmployeeBoImpl employeeBoImpl = new EmployeeBoImpl();
        contractor.setNameKhachHang(customerBoImpl.getCustomerById(id).getName());
        contractor.setNameNhanVien(employeeBoImpl.getEmployeeById(id).getName());
        return contractor;
    }

    @Override
    public void updateContractor(Contractor contractor) {
        contractorDaoImpl.update(contractor);
    }

    @Override
    public void insertNewContractor(Contractor contractor) {
        contractorDaoImpl.insert(contractor);
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
    public List<Contractor> getListUserUsingService(String search, String next) {
        if (search == null) pageSearch = 0;
        if (next == null) pageCount = 0;
        if ("".equals(search) || search == null) {
            return getNextList(next);
        } else {
            return getNextSearch(search, next);
        }
    }

    private List<Contractor> getNextSearch(String search, String next) {
        if ("true".equals(next)) pageSearch++; else if ("false".equals(next)) pageSearch--;
        if (pageSearch<0) pageSearch = 0;
        /*getListCustomerUsingServiceSearch*/
        List<Contractor> customerList = contractorDaoImpl.getLCUSSearch(pageSearch,search);
        if (customerList.size()==0) {
            pageSearch--;
            /*getListCustomerUsingServiceSearch*/
            return contractorDaoImpl.getLCUSSearch(pageSearch-1,search);
        }
        return customerList;
    }

    private List<Contractor> getNextList(String next) {
        if ("true".equals(next)) pageCount++; else if ("false".equals(next)) pageCount--;
        if (pageCount<0) pageCount = 0;
        /*getListCustomerUsingService*/
        List<Contractor> customerList = contractorDaoImpl.getLCUSNext(pageCount);
        if (customerList.size()==0) {
            pageCount--;
            /*getListCustomerUsingService*/
            return contractorDaoImpl.getLCUSNext(pageCount-1);
        }
        return customerList;
    }
}