package bo;

import model.Services;

import java.util.List;
import java.util.Map;

public interface ServicesBo {
    Services getServicesById(String id);

    Services getServicesById(int id);

    void updateServices(Services services);

    void insertNewServices(Services services);

    Map<Integer, String> getPosition();

    Map<Integer, String> getLevel();

    Map<Integer, String> getDepartment();

    List<Services> getPaging(String search, String next);
}
