package JDBCProject;

import java.sql.*;

public class TransactionDemo {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/testdb";
        String user = "root";
        String password = "Archana@2026#Mysql";

        try {

            Connection con =DriverManager.getConnection(url, user, password);

            con.setAutoCommit(false);

            try {

                PreparedStatement debit =con.prepareStatement("UPDATE accounts SET balance = balance - ? WHERE id = ?");

                debit.setDouble(1, 1000);
                debit.setInt(2, 1);

                debit.executeUpdate();
                PreparedStatement credit = con.prepareStatement("UPDATE accounts SET balance = balance + ? WHERE id = ?");
                credit.setDouble(1, 1000);
                credit.setInt(2, 2);
                credit.executeUpdate();
                con.commit();
                System.out.println("Transfer Successful");

            } catch (Exception e) {

                con.rollback();

                System.out.println("Transfer Failed");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}