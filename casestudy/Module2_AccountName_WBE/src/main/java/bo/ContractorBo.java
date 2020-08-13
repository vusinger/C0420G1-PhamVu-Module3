package bo;

import model.Contractor;

import java.util.List;
import java.util.Map;

public interface ContractorBo {
    Contractor getContractorById(String id);

    void updateContractor(Contractor contractor);

    void insertNewContractor(Contractor contractor);

    Map<Integer, String> getPosition();

    Map<Integer, String> getLevel();

    Map<Integer, String> getDepartment();

    List<Contractor> getListUserUsingService(String search, String next);
}
