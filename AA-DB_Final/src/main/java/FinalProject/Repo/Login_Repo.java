package FinalProject.Repo;


import FinalProject.Model.Login;
import FinalProject.Utils.JDBC_Connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login_Repo {
    public Login_Repo() {}
    public boolean validate(Login login) throws ClassNotFoundException {
        boolean isValid = false;
        String query = "select * from users where username = ? and password = ? ";
        try (
            Connection con = JDBC_Connection.connectToMysql();
            PreparedStatement ps = con.prepareStatement(query) )
        {
            ps.setString(1, login.getUsername());
            ps.setString(2, login.getPassword());
            ResultSet rs = ps.executeQuery();
            isValid = rs.next();
        } catch (Exception e) {
            System.out.println("Error in Login_Repo ->");
            e.printStackTrace();
        }
        return isValid;
    }
}