package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {
    static String jdbcURL = "jdbc:mysql://localhost:3306/FuramaResort";
    static String jdbcUsername = "root";
    static String jdbcPassword = "1234";

    static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            return null;
        }
        return connection;
    }
}
