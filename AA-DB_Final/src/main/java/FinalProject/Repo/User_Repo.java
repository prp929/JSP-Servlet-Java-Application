package FinalProject.Repo;

import FinalProject.Model.User;
import FinalProject.Utils.JDBC_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User_Repo {

        public User getUser(String username) throws ClassNotFoundException {
            User u = new User();
            String GET_USER = "Select * from users where username=? ";
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (
                    Connection connection = JDBC_Connection.connectToMysql();
                    PreparedStatement preparedStatement = connection.prepareStatement(GET_USER)) {
                    preparedStatement.setString(1, username);
                    ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    String fn = rs.getString("first_name");
                    String ln = rs.getString("last_name");
                    String pwd = rs.getString("password");
                    Integer id = rs.getInt("id");
                    u.setFirstName(fn);
                    u.setLastName(ln);
                    u.setPassword(pwd);
                    u.setId(id); u.setUsername(username);
                }

            } catch (Exception e) {
                System.out.println("Error in User_Repo -> ");
                e.printStackTrace();
            }
            return u;
        }

        public int registerUser(User user) throws ClassNotFoundException {
            String INSERT_USERS_SQL = "INSERT INTO users " +
                    "  (first_name, last_name, username, password) VALUES " +
                    " (?, ?, ?, ?);";

            int result = 0;
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (
                    Connection connection = JDBC_Connection.connectToMysql();
                 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL))
            {
                preparedStatement.setString(1, user.getFirstName());
                preparedStatement.setString(2, user.getLastName());
                preparedStatement.setString(3, user.getUsername());
                preparedStatement.setString(4, user.getPassword());
                result = preparedStatement.executeUpdate();

            } catch (Exception e) {
                System.out.println("Error in User_Repo -> ");
                e.printStackTrace();
            }
            return result;
        }

        public Integer deleteUser(String un) throws ClassNotFoundException {
            User u = getUser(un);
            String s = "DELETE FROM users WHERE username = ? ; " ;
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (
                    Connection connection = JDBC_Connection.connectToMysql();
                    PreparedStatement preparedStatement = connection.prepareStatement(s))
            {
                preparedStatement.setString(1, un);
                int rs = preparedStatement.executeUpdate();
                System.out.println("Deleted? " + rs + " USer:" + u.toString() );
            } catch (Exception e) {
                System.out.println("Error in User_Repo -> ");
                e.printStackTrace();
            }
            return u.getId();
        }

        public void updateUser(User newUser, String oldUsername) throws ClassNotFoundException {
            Integer i = deleteUser(oldUsername);
            newUser.setId(i);
            System.out.println("Adding new user-> " + newUser.toString());
            registerUser(newUser);
        }

}
