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

public class ContractorDaoImpl implements ContractorDao<Contractor> {

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
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_NHANVIEN);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Contractor contractor) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_NHANVIEN);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Contractor> getLCUSNext(int pageCount) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Contractor> contractorList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_HOPDONG);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if (count > pageCount * 10 && resultSet.getBoolean(7)) {
                    Contractor contractor = new Contractor();
                    contractor.setIdHopDong(resultSet.getInt(1));
                    contractor.setNgayLamHopDong(resultSet.getString(2));
                    contractor.setNgayKetThuc(resultSet.getString(3));
                    contractor.setThoiGianThue(resultSet.getString(4));
                    contractor.setTienDatCoc(resultSet.getString(5));
                    contractor.setTongTien(resultSet.getString(6));
                    contractor.setFlag(resultSet.getBoolean(7));
                    contractor.setIdNhanVien(resultSet.getInt(8));
                    contractor.setIdKhachHang(resultSet.getInt(9));
                    contractor.setIdDichVu(resultSet.getInt(10));
                    if (contractor.isFlag()) {
                        contractorList.add(contractor);
                        if (contractorList.size() == 10) break;
                    }
                }
                if (!resultSet.getBoolean(7)) count--;
            }
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return contractorList;
    }

    @Override
    public List<Contractor> getLCUSSearch(int pageSearch, String search) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Contractor> contractorList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_HOPDONG);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if ((count > pageSearch * 10) && resultSet.getBoolean(7)
                        && customerBoImpl.getCustomerById(resultSet.getInt(9)).getName().toLowerCase().contains(search.toLowerCase().trim())) {
                    Contractor contractor = new Contractor();
                    contractor.setIdHopDong(resultSet.getInt(1));
                    contractor.setNgayLamHopDong(resultSet.getString(2));
                    contractor.setNgayKetThuc(resultSet.getString(3));
                    contractor.setThoiGianThue(resultSet.getString(4));
                    contractor.setTienDatCoc(resultSet.getString(5));
                    contractor.setTongTien(resultSet.getString(6));
                    contractor.setFlag(resultSet.getBoolean(7));
                    contractor.setIdKhachHang(resultSet.getInt(9));
                    contractor.setIdDichVu(resultSet.getInt(10));
                    if (contractor.isFlag()) {
                        contractorList.add(contractor);
                        if (contractorList.size() == 10) break;
                    }
                }
                if (!resultSet.getBoolean(7) ||
                        !customerBoImpl.getCustomerById(resultSet.getInt(9)).getName().toLowerCase().contains(search.toLowerCase().trim()))
                    count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contractorList;
    }

    @Override
    public Contractor getContractorById(String id) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_CONTRACTOR);
            preparedStatement.setInt(1, Integer.parseInt(id));
            resultSet = preparedStatement.executeQuery();
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
            contractor.setIdKhachHang(resultSet.getInt(9));
            contractor.setIdDichVu(resultSet.getInt(10));
            return contractor;
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
