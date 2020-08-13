package dao;

import model.Contractor;
import model.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao<Employee> {

    private final String SELECT_NHANVIEN = "select * from NhanVien";
    private final String SELECT_NHANVIENID = "select * from NhanVien where IdNhanVien = ?";
    private final String INSERT_NHANVIEN = "insert into NhanVien(HoTen,NgaySinh,SoCMND," +
                        "GioiTinh,Luong,SDT,Email,DiaChi,flag,IdViTri,IdTrinhDo,IdBoPhan) value (?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_NHANVIEN = "update NhanVien set HoTen = ? ,NgaySinh = ? ,SoCMND = ? ,GioiTinh = ? ," +
                        "Luong = ? ,SDT = ?,Email = ? ,DiaChi = ?,flag = ? , IdViTri = ? , IdTrinhDo = ? , IdBoPhan = ? where IdNhanVien = ? ";
    private GetAttachInfo getAttachInfo = new GetAttachInfo();


    @Override
    public List<Employee> getListAll() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NHANVIEN);
            ResultSet resultSet1 = preparedStatement.executeQuery();
            while (resultSet1.next()) {
                Employee employee = new Employee();
                employee.setId(resultSet1.getInt(1));
                employee.setName(resultSet1.getString(2));
                employee.setBirthDay(resultSet1.getString(3));
                employee.setIdCard(resultSet1.getString(4));
                employee.setGender(resultSet1.getString(5));
                employee.setSalary(resultSet1.getString(6));
                employee.setPhoneNumber(resultSet1.getString(7));
                employee.setEmail(resultSet1.getString(8));
                employee.setAddress(resultSet1.getString(9));
                employee.setFlag(resultSet1.getBoolean(10));
                employee.setIdPosition(resultSet1.getInt(11));
                employee.setIdLevel(resultSet1.getInt(12));
                employee.setIdDepartment(resultSet1.getInt(13));
                if (employee.isFlag()) {
                    employee.setNamePosition(getAttachInfo.vitri.get(employee.getIdPosition()));
                    employee.setNameLevel(getAttachInfo.trinhdo.get(employee.getIdLevel()));
                    employee.setNameDepartment(getAttachInfo.bophan.get(employee.getIdDepartment()));
                    employeeList.add(employee);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void insert(Employee employee) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_NHANVIEN);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthDay());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setString(4, employee.getGender());
            preparedStatement.setString(5, employee.getSalary());
            preparedStatement.setString(6, employee.getPhoneNumber());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setBoolean(9, employee.isFlag());
            preparedStatement.setInt(10, employee.getIdPosition());
            preparedStatement.setInt(11, employee.getIdLevel());
            preparedStatement.setInt(12, employee.getIdDepartment());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Employee employee) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_NHANVIEN);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthDay());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setString(4, employee.getGender());
            preparedStatement.setString(5, employee.getSalary());
            preparedStatement.setString(6, employee.getPhoneNumber());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setBoolean(9, employee.isFlag());
            preparedStatement.setInt(10, employee.getIdPosition());
            preparedStatement.setInt(11, employee.getIdLevel());
            preparedStatement.setInt(12, employee.getIdDepartment());
            preparedStatement.setInt(13, employee.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Employee> getListNext(int pageCount) {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NHANVIEN);
            ResultSet resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if (count>pageCount*10&&resultSet.getBoolean(10))  {
                    Employee employee = new Employee();
                    employee.setId(resultSet.getInt(1));
                    employee.setName(resultSet.getString(2));
                    employee.setBirthDay(resultSet.getString(3));
                    employee.setIdCard(resultSet.getString(4));
                    employee.setGender(resultSet.getString(5));
                    employee.setSalary(resultSet.getString(6));
                    employee.setPhoneNumber(resultSet.getString(7));
                    employee.setEmail(resultSet.getString(8));
                    employee.setAddress(resultSet.getString(9));
                    employee.setFlag(resultSet.getBoolean(10));
                    employee.setIdPosition(resultSet.getInt(11));
                    employee.setIdLevel(resultSet.getInt(12));
                    employee.setIdDepartment(resultSet.getInt(13));
                    if (employee.isFlag()) {
                        employee.setNamePosition(getAttachInfo.vitri.get(employee.getIdPosition()));
                        employee.setNameLevel(getAttachInfo.trinhdo.get(employee.getIdLevel()));
                        employee.setNameDepartment(getAttachInfo.bophan.get(employee.getIdDepartment()));
                        employeeList.add(employee);
                        if (employeeList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(10)) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> getListSearchNext(int pageSearch,String search) {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NHANVIEN);
            ResultSet resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if ((count>pageSearch*10)&&resultSet.getBoolean(10)
                        &&resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim()))  {
                    Employee employee = new Employee();
                    employee.setId(resultSet.getInt(1));
                    employee.setName(resultSet.getString(2));
                    employee.setBirthDay(resultSet.getString(3));
                    employee.setIdCard(resultSet.getString(4));
                    employee.setGender(resultSet.getString(5));
                    employee.setSalary(resultSet.getString(6));
                    employee.setPhoneNumber(resultSet.getString(7));
                    employee.setEmail(resultSet.getString(8));
                    employee.setAddress(resultSet.getString(9));
                    employee.setFlag(resultSet.getBoolean(10));
                    employee.setIdPosition(resultSet.getInt(11));
                    employee.setIdLevel(resultSet.getInt(12));
                    employee.setIdDepartment(resultSet.getInt(13));
                    if (employee.isFlag()) {
                        employee.setNamePosition(getAttachInfo.vitri.get(employee.getIdPosition()));
                        employee.setNameLevel(getAttachInfo.trinhdo.get(employee.getIdLevel()));
                        employee.setNameDepartment(getAttachInfo.bophan.get(employee.getIdDepartment()));
                        employeeList.add(employee);
                        if (employeeList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(10)||
                        !resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim())) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee getEmployeeById(String id) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NHANVIENID);
            preparedStatement.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            Employee employee = new Employee();
            employee.setId(resultSet.getInt(1));
            employee.setName(resultSet.getString(2));
            employee.setBirthDay(resultSet.getString(3));
            employee.setIdCard(resultSet.getString(4));
            employee.setGender(resultSet.getString(5));
            employee.setSalary(resultSet.getString(6));
            employee.setPhoneNumber(resultSet.getString(7));
            employee.setEmail(resultSet.getString(8));
            employee.setAddress(resultSet.getString(9));
            employee.setFlag(resultSet.getBoolean(10));
            employee.setIdPosition(resultSet.getInt(11));
            employee.setNamePosition(getAttachInfo.vitri.get(resultSet.getInt(11)));
            employee.setIdLevel(resultSet.getInt(12));
            employee.setNameLevel(getAttachInfo.trinhdo.get(resultSet.getInt(12)));
            employee.setIdDepartment(resultSet.getInt(13));
            employee.setNameDepartment(getAttachInfo.bophan.get(resultSet.getInt(13)));
            return employee;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
