package dao;

import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoImpl implements CustomerDao<Customer> {

    private final String SELECT_KHACHHANG = "select * from KhachHang";
    private final String INSERT_KHACHHANG = "insert into KhachHang(HoTen,NgaySinh,GioiTinh,SoCMND,SDT,Email,DiaChi," +
            "flag,IdLoaiKhach) value (?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_KHACHHANG = "update KhachHang set HoTen = ? , NgaySinh = ? , GioiTinh = ? , SoCMND = ? , SDT = ? , " +
            "Email = ? , DiaChi = ? , flag = ? , IdLoaiKhach = ? where IdKHachHang = ?";

    @Override
    public List<Customer> getListAll() {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_KHACHHANG);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setId(resultSet.getInt(1));
                customer.setName(resultSet.getString(2));
                customer.setBirthDay(resultSet.getString(3));
                customer.setGender(resultSet.getString(4));
                customer.setIdCard(resultSet.getString(5));
                customer.setPhoneNumber(resultSet.getString(6));
                customer.setEmail(resultSet.getString(7));
                customer.setAddress(resultSet.getString(8));
                customer.setIdCustomerType(resultSet.getInt(10));
                if (resultSet.getBoolean(9)) {
                    customerList.add(customer);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void insert(Customer customer) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_KHACHHANG);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthDay());
            preparedStatement.setString(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setBoolean(8, customer.isFlag());
            preparedStatement.setInt(9, customer.getIdCustomerType());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Customer customer) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_KHACHHANG);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthDay());
            preparedStatement.setString(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setBoolean(8, customer.isFlag());
            preparedStatement.setInt(9, customer.getIdCustomerType());
            preparedStatement.setInt(10, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
