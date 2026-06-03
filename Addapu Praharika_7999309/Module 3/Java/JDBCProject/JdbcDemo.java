package JDBCProject;

import java.sql.*;

public class JdbcDemo {

    public static void main(String[] args) {

        String url =
                "jdbc:mysql://localhost:3306/testdb";

        String user = "root";
        String password = "Archana@2026#Mysql";

        try {

            Connection con =
                    DriverManager.getConnection(
                            url,
                            user,
                            password);

            Statement stmt =
                    con.createStatement();

            ResultSet rs =
                    stmt.executeQuery(
                            "SELECT * FROM students");

            while (rs.next()) {

                System.out.println(
                        rs.getInt("id")
                                + " "
                                + rs.getString("name"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}