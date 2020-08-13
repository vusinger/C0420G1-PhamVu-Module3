package dao;

import bo.CustomerBoImpl;
import bo.EmployeeBoImpl;
import bo.ServicesBoImpl;
import model.Contractor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractorDaoImpl implements ContractorDao<Contractor>{

    private final String SELECT_HOPDONG = "select * from HOPDONG";
    private final String SELECT_CONTRACTOR = "select * from HOPDONG where IdHopDong = ?";
    private final String INSERT_NHANVIEN = "insert into NhanVien(HoTen,NgaySinh,SoCMND," +
            "GioiTinh,Luong,SDT,Email,DiaChi,flag,IdViTri,IdTrinhDo,IdBoPhan) value (?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String UPDATE_NHANVIEN = "update NhanVien set HoTen = ? ,NgaySinh = ? ,SoCMND = ? ,GioiTinh = ? ," +
            "Luong = ? ,SDT = ?,Email = ? ,DiaChi = ?,flag = ? , IdViTri = ? , IdTrinhDo = ? , IdBoPhan = ? where IdNhanVien = ? ";
    private EmployeeBoImpl employeeBoImpl = new EmployeeBoImpl();
    private CustomerBoImpl customerBoImpl = new CustomerBoImpl();
    private ServicesBoImpl servicesBoImpl = new ServicesBoImpl();
    @Override
    public void insert(Contractor contractor) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_NHANVIEN);
//            preparedStatement.setString(1, contractor.getName());
//            preparedStatement.setString(2, contractor.getBirthDay());
//            preparedStatement.setString(3, contractor.getIdCard());
//            preparedStatement.setString(4, contractor.getGender());
//            preparedStatement.setString(5, contractor.getSalary());
//            preparedStatement.setString(6, contractor.getPhoneNumber());
//            preparedStatement.setString(7, contractor.getEmail());
//            preparedStatement.setString(8, contractor.getAddress());
//            preparedStatement.setBoolean(9, contractor.isFlag());
//            preparedStatement.setInt(10, contractor.getIdPosition());
//            preparedStatement.setInt(11, contractor.getIdLevel());
//            preparedStatement.setInt(12, contractor.getIdDepartment());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Contractor contractor) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_NHANVIEN);
//            preparedStatement.setString(1, contractor.getName());
//            preparedStatement.setString(2, contractor.getBirthDay());
//            preparedStatement.setString(3, contractor.getIdCard());
//            preparedStatement.setString(4, contractor.getGender());
//            preparedStatement.setString(5, contractor.getSalary());
//            preparedStatement.setString(6, contractor.getPhoneNumber());
//            preparedStatement.setString(7, contractor.getEmail());
//            preparedStatement.setString(8, contractor.getAddress());
//            preparedStatement.setBoolean(9, contractor.isFlag());
//            preparedStatement.setInt(10, contractor.getIdPosition());
//            preparedStatement.setInt(11, contractor.getIdLevel());
//            preparedStatement.setInt(12, contractor.getIdDepartment());
//            preparedStatement.setInt(13, contractor.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Contractor> getLCUSNext(int pageCount) {
        List<Contractor> contractorList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_HOPDONG);
            ResultSet resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if (count>pageCount*10&&resultSet.getBoolean(7))  {
                    Contractor contractor = new Contractor();
                    contractor.setIdHopDong(resultSet.getInt(1));
                    contractor.setNgayLamHopDong(resultSet.getString(2));
                    contractor.setNgayKetThuc(resultSet.getString(3));
                    contractor.setThoiGianThue(resultSet.getString(4));
                    contractor.setTienDatCoc(resultSet.getString(5));
                    contractor.setTongTien(resultSet.getString(6));
                    contractor.setFlag(resultSet.getBoolean(7));
                    contractor.setIdNhanVien(resultSet.getInt(8));
                    contractor.setIdNhanVien(resultSet.getInt(8));
                    contractor.setNameNhanVien(employeeBoImpl.getEmployeeById(resultSet.getInt(8)).getName());
                    contractor.setIdKhachHang(resultSet.getInt(9));
                    contractor.setNameKhachHang(customerBoImpl.getCustomerById(resultSet.getInt(9)).getName());
                    contractor.setIdDichVu(resultSet.getInt(10));
                    contractor.setNameDichVu(servicesBoImpl.getServicesById(resultSet.getInt(10)).getServiceName());
                    if (contractor.isFlag()) {
                        contractorList.add(contractor);
                        if (contractorList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(7)) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractorList;
    }

    @Override
    public List<Contractor> getLCUSSearch(int pageSearch, String search) {
        List<Contractor> contractorList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_HOPDONG);
            ResultSet resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if ((count>pageSearch*10)&&resultSet.getBoolean(7)
                        &&customerBoImpl.getCustomerById(resultSet.getInt(9)).getName().toLowerCase().contains(search.toLowerCase().trim()))  {
                    Contractor contractor = new Contractor();
                    contractor.setIdHopDong(resultSet.getInt(1));
                    contractor.setNgayLamHopDong(resultSet.getString(2));
                    contractor.setNgayKetThuc(resultSet.getString(3));
                    contractor.setThoiGianThue(resultSet.getString(4));
                    contractor.setTienDatCoc(resultSet.getString(5));
                    contractor.setTongTien(resultSet.getString(6));
                    contractor.setFlag(resultSet.getBoolean(7));
                    contractor.setIdNhanVien(resultSet.getInt(8));
                    contractor.setNameNhanVien(employeeBoImpl.getEmployeeById(resultSet.getInt(8)).getName());
                    contractor.setIdKhachHang(resultSet.getInt(9));
                    contractor.setNameKhachHang(customerBoImpl.getCustomerById(resultSet.getInt(9)).getName());
                    contractor.setIdDichVu(resultSet.getInt(10));
                    contractor.setNameDichVu(servicesBoImpl.getServicesById(resultSet.getInt(10)).getServiceName());
                    if (contractor.isFlag()) {
                        contractorList.add(contractor);
                        if (contractorList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(7)||
                        !customerBoImpl.getCustomerById(resultSet.getInt(9)).getName().toLowerCase().contains(search.toLowerCase().trim())) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractorList;
    }

    @Override
    public Contractor getContractorById(String id) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_CONTRACTOR);
            preparedStatement.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            Contractor contractor = new Contractor();
            contractor.setIdHopDong(resultSet.getInt(1));
            contractor.setNgayLamHopDong(resultSet.getString(2));
            contractor.setNgayKetThuc(resultSet.getString(3));
            contractor.setThoiGianThue(resultSet.getString(4));
            contractor.setTienDatCoc(resultSet.getString(5));
            contractor.setTongTien(resultSet.getString(6));
            contractor.setFlag(resultSet.getBoolean(7));
            contractor.setIdNhanVien(resultSet.getInt(8));
            contractor.setNameNhanVien(employeeBoImpl.getEmployeeById(resultSet.getInt(8)).getName());
            contractor.setIdKhachHang(resultSet.getInt(9));
            contractor.setNameKhachHang(customerBoImpl.getCustomerById(resultSet.getInt(9)).getName());
            contractor.setIdDichVu(resultSet.getInt(10));
            contractor.setNameDichVu(servicesBoImpl.getServicesById(resultSet.getInt(10)).getServiceName());
            return contractor;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
