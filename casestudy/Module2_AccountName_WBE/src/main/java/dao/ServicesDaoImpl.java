package dao;

import model.Services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServicesDaoImpl implements ServicesDao<Services> {

    private final String SELECT_DICHVU= "select * from DichVu";
    private final String SELECT_DICHVUID = "select * from DichVu where IdDichVu = ?";
    private final String INSERT_DICHVU = "insert into DichVu(TenDichVu,DienTich,SoTang," +
            "SoNguoiToiDa,TrangThai,flag,IdKieuThue,IdloaiDichVu) value (?,?,?,?,?,?,?,?)";
    private final String UPDATE_DICHVU = "update DichVu set TenDichVu = ? ,DienTich = ? ,SoTang = ? ,SoNguoiToiDa = ? ," +
            "ChiPhiThue = ? , TrangThai = ? ,flag = ?,IdKieuThue = ? ,IdloaiDichVu = ? where IdDichVu = ? ";

    @Override
    public void insert(Services services) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_DICHVU);
            preparedStatement.setString(1, services.getServiceName());
            preparedStatement.setDouble(2, services.getUseArea());
            preparedStatement.setDouble(3, services.getNumberFloor());
            preparedStatement.setDouble(4, services.getMaximumPerson());
            preparedStatement.setDouble(5, services.getRentalCost());
            preparedStatement.setString(6, services.getServiceStatus());
            preparedStatement.setBoolean(7, services.isFlag());
            preparedStatement.setInt(8, services.getIdKieuThue());
            preparedStatement.setInt(9, services.getIdLoaiDichVu());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Services services) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_DICHVU);
            preparedStatement.setString(1, services.getServiceName());
            preparedStatement.setDouble(2, services.getUseArea());
            preparedStatement.setDouble(3, services.getNumberFloor());
            preparedStatement.setDouble(4, services.getMaximumPerson());
            preparedStatement.setDouble(5, services.getRentalCost());
            preparedStatement.setString(6, services.getServiceStatus());
            preparedStatement.setBoolean(7, services.isFlag());
            preparedStatement.setInt(8, services.getIdKieuThue());
            preparedStatement.setInt(9, services.getIdLoaiDichVu());
            preparedStatement.setInt(10, services.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Services> getListNext(int pageCount) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Services> serviceList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_DICHVU);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if (count>pageCount*10&&resultSet.getBoolean(8))  {
                    Services services = new Services();
                    services.setId(resultSet.getInt(1));
                    services.setServiceName(resultSet.getString(2));
                    services.setUseArea(resultSet.getDouble(3));
                    services.setNumberFloor(resultSet.getDouble(4));
                    services.setMaximumPerson(resultSet.getInt(5));
                    services.setRentalCost(resultSet.getDouble(6));
                    services.setServiceStatus(resultSet.getString(7));
                    services.setFlag(resultSet.getBoolean(8));
                    services.setIdKieuThue(resultSet.getInt(9));
                    services.setIdLoaiDichVu(resultSet.getInt(10));
                    if (services.isFlag()) {
                        serviceList.add(services);
                        if (serviceList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(8)) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public List<Services> getListSearchNext(int pageSearch,String search) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        List<Services> serviceList = new ArrayList<>();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_DICHVU);
            resultSet = preparedStatement.executeQuery();
            int count = 0;
            while (resultSet.next()) {
                count++;
                if ((count>pageSearch*10)&&resultSet.getBoolean(8)
                        &&resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim()))  {
                    Services services = new Services();
                    services.setId(resultSet.getInt(1));
                    services.setServiceName(resultSet.getString(2));
                    services.setUseArea(resultSet.getDouble(3));
                    services.setNumberFloor(resultSet.getDouble(4));
                    services.setMaximumPerson(resultSet.getInt(5));
                    services.setRentalCost(resultSet.getDouble(6));
                    services.setServiceStatus(resultSet.getString(7));
                    services.setFlag(resultSet.getBoolean(8));
                    services.setIdKieuThue(resultSet.getInt(9));
                    services.setIdLoaiDichVu(resultSet.getInt(10));
                    if (services.isFlag()) {
                        serviceList.add(services);
                        if (serviceList.size()==10) break;
                    }
                }
                if (!resultSet.getBoolean(8)||
                        !resultSet.getString(2).toLowerCase().contains(search.toLowerCase().trim())) count--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public Services getServicesById(String id) {
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        Services services = new Services();
        try {
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_DICHVUID);
            preparedStatement.setInt(1, Integer.parseInt(id));
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            services.setId(resultSet.getInt(1));
            services.setServiceName(resultSet.getString(2));
            services.setUseArea(resultSet.getDouble(3));
            services.setNumberFloor(resultSet.getDouble(4));
            services.setMaximumPerson(resultSet.getInt(5));
            services.setRentalCost(resultSet.getDouble(6));
            services.setServiceStatus(resultSet.getString(7));
            services.setFlag(resultSet.getBoolean(8));
            services.setIdKieuThue(resultSet.getInt(9));
            services.setIdLoaiDichVu(resultSet.getInt(10));
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return services;
    }
}
