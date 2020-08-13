package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class GetAttachInfo {
    public Map<Integer,String> vitri = new HashMap<>();
    public Map<Integer,String> trinhdo = new HashMap<>();
    public Map<Integer,String> bophan = new HashMap<>();
    public Map<Integer,String> loaikhach = new HashMap<>();
    public Map<Integer,String> kieuthue = new HashMap<>();
    static String SELECT_VITRI = "select * from ViTri";
    static String SELECT_TRINHDO = "select * from TrinhDo";
    static String SELECT_BOPHAN = "select * from BoPhan";
    static String SELECT_LOAIKHACH = "select * from LoaiKhach";

    public GetAttachInfo() {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_VITRI);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                vitri.put(resultSet.getInt(1),resultSet.getString(2));
            }
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_TRINHDO);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                trinhdo.put(resultSet.getInt(1),resultSet.getString(2));
            }
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_BOPHAN);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                bophan.put(resultSet.getInt(1),resultSet.getString(2));
            }
            preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_LOAIKHACH);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                loaikhach.put(resultSet.getInt(1),resultSet.getString(2));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
