package bo;

import dao.GetAttachInfo;
import dao.ServicesDaoImpl;
import model.Services;

import java.util.List;
import java.util.Map;

public class ServicesBoImpl implements ServicesBo {

    private ServicesDaoImpl servicesDaoImpl = new ServicesDaoImpl();
    private GetAttachInfo getAttachInfo = new GetAttachInfo();
    static int pageCount;
    static int pageSearch;

    @Override
    public Services getServicesById(String id) {
        return servicesDaoImpl.getServicesById(id);
    }

    @Override
    public Services getServicesById(int id) {
        return servicesDaoImpl.getServicesById(String.valueOf(id));
    }

    @Override
    public void updateServices(Services services) {
        servicesDaoImpl.update(services);
    }

    @Override
    public void insertNewServices(Services services) {
        servicesDaoImpl.insert(services);
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
    public List<Services> getPaging(String search, String next) {
        if (search == null) pageSearch = 0;
        if (next == null) pageCount = 0;
        if ("".equals(search) || search == null) {
            return getNextList(next);
        } else {
            return getNextSearch(search, next);
        }
    }

    private List<Services> getNextSearch(String search, String next) {
        if ("true".equals(next)) pageSearch++; else if ("false".equals(next)) pageSearch--;
        if (pageSearch<0) pageSearch = 0;
        List<Services> servicesList = servicesDaoImpl.getListSearchNext(pageSearch,search);
        if (servicesList.size()==0) {
            pageSearch--;
            return servicesDaoImpl.getListSearchNext(pageSearch-1,search);
        }
        return servicesList;
    }

    private List<Services> getNextList(String next) {
        if ("true".equals(next)) pageCount++; else if ("false".equals(next)) pageCount--;
        if (pageCount<0) pageCount = 0;
        List<Services> servicesList = servicesDaoImpl.getListNext(pageCount);
        if (servicesList.size()==0) {
            pageCount--;
            return servicesDaoImpl.getListNext(pageCount-1);
        }
        return servicesList;
    }
}