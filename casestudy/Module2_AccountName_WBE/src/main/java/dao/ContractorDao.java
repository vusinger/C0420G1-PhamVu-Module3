package dao;

import model.Contractor;

import java.util.List;

public interface ContractorDao<E> {

    void insert(E contractor);

    void update(E contractor);

    List<Contractor> getLCUSNext(int pageCount);

    List<Contractor> getLCUSSearch(int pageSearch, String search);

    Contractor getContractorById(String id);
}
