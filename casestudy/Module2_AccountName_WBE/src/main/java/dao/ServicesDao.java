package dao;

import java.util.List;

public interface ServicesDao<E> {
    void insert(E service);
    void update(E service);
    List<E> getListNext(int pageCount);
    List<E> getListSearchNext(int pageSearch, String search);
    E getServicesById(String id);
}
