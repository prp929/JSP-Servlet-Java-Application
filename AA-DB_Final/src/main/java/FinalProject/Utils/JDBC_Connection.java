package FinalProject.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;


public class JDBC_Connection {
    final static String PASSWORD = "password",
                        USER = "root",
                        URL = "jdbc:mysql://localhost:3306/db_final_project" ;

    public static Connection connectToMysql() {
        try {
            Connection connection = DriverManager.getConnection
                    (URL, USER, PASSWORD);
            return connection;
        } catch (Exception e) {
            System.out.println("ERROR IN JDBC_CONNECTION -> ");
            e.printStackTrace();
            return null;
        }
    }

    public static Date getSQLDate(LocalDate date) {
         return java.sql.Date.valueOf(date) ;
    }


    public static LocalDate getUtilDate(Date sqlDate) {
        return Instant.ofEpochMilli(sqlDate.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
    }

}
