package dao;

import model.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentDAOImpl implements StudentDAO {

    private static Map<Integer, Student> studentMap;

    static {
        studentMap = new HashMap<>();
        studentMap.put(1, new Student(1, "Tien", "2000", 7));
        studentMap.put(2, new Student(2, "Tien Quoc", "2005", 4));
        studentMap.put(3, new Student(3, "Thinh", "2005", 9));
    }

    @Override
    public List<Student> findAll() {
        return new ArrayList<>(studentMap.values());
    }
}
