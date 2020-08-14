package bo;

import dao.ContractorDaoImpl;
import dao.GetAttachInfo;
import model.Contractor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ContractorBoImpl implements ContractorBo {

    private ContractorDaoImpl contractorDaoImpl = new ContractorDaoImpl();
    private EmployeeBoImpl employeeBoImpl = new EmployeeBoImpl();
    private CustomerBoImpl customerBoImpl = new CustomerBoImpl();
    private ServicesBoImpl servicesBoImpl = new ServicesBoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pageCount;
    static int pageSearch;
    static int maxPage = -1;
    static List<Contractor> contractorList = new ArrayList<>();

    @Override
    public Contractor getContractorById(String id) {
        Contractor contractor = contractorDaoImpl.getContractorById(id);
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
            getNextList(next);
        } else {
            getNextSearch(search, next);
        }
        return contractorList;
    }

    private void recheckContractorList() {
        for (Contractor contractor:contractorList) {
            String nameKhachHang = customerBoImpl.getCustomerById(contractor.getIdKhachHang()).getName();
            contractor.setNameKhachHang(nameKhachHang);
            String nameNhanVien = employeeBoImpl.getEmployeeById(contractor.getIdNhanVien()).getName();
            contractor.setNameNhanVien(nameNhanVien);
            String nameDichVu = servicesBoImpl.getServicesById(contractor.getIdDichVu()).getServiceName();
            contractor.setNameDichVu(nameDichVu);
        }
    }

    private void getNextSearch(String search, String next) {
        if ("true".equals(next)) pageSearch++; else if ("false".equals(next)) pageSearch--;
        if (pageSearch<0) {
            pageSearch = 0;
            return;
        }
        /*getListCustomerUsingServiceSearch*/
        if (maxPage>0&&pageSearch>maxPage){
            pageSearch--;
            return;
        }
        contractorList = contractorDaoImpl.getLCUSSearch(pageSearch,search);
        if (contractorList.size()==0) {
            maxPage = pageSearch-1;
            pageSearch--;
            /*getListCustomerUsingServiceSearch*/
            contractorList = contractorDaoImpl.getLCUSSearch(pageSearch,search);
        }
        recheckContractorList();
    }

    private void getNextList(String next) {
        if ("true".equals(next)) pageCount++; else if ("false".equals(next)) pageCount--;
        if (pageCount<0) {
            pageCount = 0;
            return;
        }
        /*getListCustomerUsingService*/
        if (maxPage>0&&pageCount>maxPage) {
            pageCount--;
            return;
        }
        contractorList = contractorDaoImpl.getLCUSNext(pageCount);
        if (contractorList.size()==0) {
            maxPage = pageCount-1;
            pageCount--;
            /*getListCustomerUsingService*/
            contractorList = contractorDaoImpl.getLCUSNext(pageCount);
        }
        recheckContractorList();
    }
}