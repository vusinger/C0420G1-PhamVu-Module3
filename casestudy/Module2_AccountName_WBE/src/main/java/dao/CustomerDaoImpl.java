package dao;

import model.Customer;
import model.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoImpl implements CustomerDao<Customer> {

    private final String SELECT_KHACHHANG = "select * from KhachHang";
    private final String SELECT_KHACHHANGID = "select * from KhachHang where IdKhachHang = ?";
    private final String INSERT_KHACHHANG = "insert into KhachHang(HoTen,NgaySinh,GioiTinh,SoCMND,SDT,Email,DiaChi," +
            "flag,IdLoaiKhach) value (?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_KHACHHANG = "update KhachHang set HoTen = ? , NgaySinh = ? , GioiTinh = ? , SoCMND = ? , SDT = ? , " +
            "Email = ? , DiaChi = ? , flag = ? , IdLoaiKhach = ? where IdKHachHang = ?";
    private GetAttachInfo getAttachInfo = new GetAttachInfo();

    @Override
    public void insert(Customer customer) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_KHACHHANG);
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
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_KHACHHANG);
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

    @Override
    public List<Customer> getListNext(int pageCount) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Customer> customerList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_KHACHHANG);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if (count>pageCount*10&&resultSet.getBoolean(9))  {
                    Customer customer = new Customer();
                    customer.setId(resultSet.getInt(1));
                    customer.setName(resultSet.getString(2));
                    customer.setBirthDay(resultSet.getString(3));
                    customer.setGender(resultSet.getString(4));
                    customer.setIdCard(resultSet.getString(5));
                    customer.setPhoneNumber(resultSet.getString(6));
                    customer.setEmail(resultSet.getString(7));
                    customer.setAddress(resultSet.getString(8));
                    customer.setFlag(resultSet.getBoolean(9));
                    customer.setIdCustomerType(resultSet.getInt(10));
                    if (customer.isFlag()) {
                        customerList.add(customer);
                        if (customerList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(9)) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<Customer> getListSearchNext(int pageSearch, String search) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Customer> customerList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_KHACHHANG);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if ((count>pageSearch*10)&&resultSet.getBoolean(9)
                        &&resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim()))  {
                    Customer customer = new Customer();
                    customer.setId(resultSet.getInt(1));
                    customer.setName(resultSet.getString(2));
                    customer.setBirthDay(resultSet.getString(3));
                    customer.setGender(resultSet.getString(4));
                    customer.setIdCard(resultSet.getString(5));
                    customer.setPhoneNumber(resultSet.getString(6));
                    customer.setEmail(resultSet.getString(7));
                    customer.setAddress(resultSet.getString(8));
                    customer.setFlag(resultSet.getBoolean(9));
                    customer.setIdCustomerType(resultSet.getInt(10));
                    if (customer.isFlag()) {
                        customerList.add(customer);
                        if (customerList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(9)||
                        !resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim())) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer getCustomerById(String id) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        Customer customer = new Customer();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_KHACHHANGID);
            preparedStatement.setInt(1, Integer.parseInt(id));
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            customer.setId(resultSet.getInt(1));
            customer.setName(resultSet.getString(2));
            customer.setBirthDay(resultSet.getString(3));
            customer.setGender(resultSet.getString(4));
            customer.setIdCard(resultSet.getString(5));
            customer.setPhoneNumber(resultSet.getString(6));
            customer.setEmail(resultSet.getString(7));
            customer.setAddress(resultSet.getString(8));
            customer.setFlag(resultSet.getBoolean(9));
            customer.setIdCustomerType(resultSet.getInt(10));
            customer.setNameCustomerType(getAttachInfo.loaikhach.get(resultSet.getInt(10)));
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }
}
