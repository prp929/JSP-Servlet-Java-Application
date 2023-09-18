package FinalProject.Repo;

import FinalProject.Model.DiaryEntry;
import FinalProject.Utils.JDBC_Connection;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class Entry_Repo implements DiaryRepository {

    /*********************** Prepared Statements**********************************/
    private static final String INSERT_ENTRY = "INSERT INTO entries" +
            "  (title, username, description, contents ,entry_date,  isBookmarked) VALUES " + " (?, ?, ?, ?, ?, ?);";

    private static final String SELECT_ENTRY = "select id, title, username, contents, " +
            "description, entry_date, isBookmarked from entries where id =?";
    private static final String SELECT_ALL_FOR_USERNAME =
            "select * from entries where username=? ;";
    private static final String SELECT_ALL_ENTRIES = "select * from entries";
    private static final String DELETE_ENTRY = "delete from entries where id = ?;";
    private static final String UPDATE_ENTRY = "update entries set title = ?, username= ?, " +
            "description =?, contents=?, entry_date =?, isBookmarked = ? where id = ?;";


    /************************************************************************************/

    public Entry_Repo() {}

    @Override
    public void insertEntry(DiaryEntry entry) throws SQLException {
        try (
                Connection con = JDBC_Connection.connectToMysql();
                PreparedStatement ps = con.prepareStatement(INSERT_ENTRY);
            )
        { //(title, username, description, contents ,entry_date,  isBookmarked)
            ps.setString(1, entry.getTitle());
            ps.setString(2, entry.getUsername());
            ps.setString(3, entry.getDescription());
            ps.setString(4, entry.getContents());
            ps.setDate(5, (Date) JDBC_Connection.getSQLDate(entry.getEntry_date()));
            ps.setBoolean(6, entry.getBookmarked() );
            ps.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public DiaryEntry selectEntry(Integer entryId) {
        DiaryEntry t = null;
        try (Connection con = JDBC_Connection.connectToMysql();
             PreparedStatement ps = con.prepareStatement(SELECT_ENTRY);) {
            ps.setInt(1, entryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                t = extractEntry(rs);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return t;
    }

    public ArrayList<DiaryEntry> selectUserEntries(String username) {
        DiaryEntry t = new DiaryEntry();
        ArrayList<DiaryEntry> ans = new ArrayList<>();
        try (
                Connection con = JDBC_Connection.connectToMysql();
                PreparedStatement ps = con.prepareStatement(SELECT_ALL_FOR_USERNAME);
             )
        {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                t = extractEntry(rs);
                ans.add(t);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return ans;
    }


    @Override
    public List <DiaryEntry> selectAllEntries() {
        List <DiaryEntry> entrys = new ArrayList <> ();
        try (Connection con = JDBC_Connection.connectToMysql();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL_ENTRIES);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                entrys.add(extractEntry(rs));
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return entrys;
    }

    @Override
    public boolean deleteEntry(Integer id) throws SQLException {
        boolean del;
        try (
                Connection con = JDBC_Connection.connectToMysql();
                PreparedStatement ps = con.prepareStatement(DELETE_ENTRY);
        )
        {
            ps.setInt(1, id);
            del = ps.executeUpdate() > 0;
        }
        return del;
    }

    @Override
    public boolean updateEntry(DiaryEntry entry) throws SQLException {
        boolean up;
        try (
                Connection con = JDBC_Connection.connectToMysql();
                PreparedStatement ps = con.prepareStatement(UPDATE_ENTRY);)
        {
            ps.setString(1, entry.getTitle());
            ps.setString(2, entry.getUsername());
            ps.setString(3, entry.getDescription());
            ps.setString(4, entry.getContents());
            ps.setDate(5, (Date) JDBC_Connection.getSQLDate(entry.getEntry_date()));
            ps.setBoolean(6, entry.getBookmarked() );
            ps.setInt(7, entry.getId());
            up = ps.executeUpdate() > 0;
        }
        return up;
    }

    @Override
    public boolean createEntry(DiaryEntry entry) throws SQLException {
        boolean success;
        try (
                Connection con = JDBC_Connection.connectToMysql();
                PreparedStatement ps = con.prepareStatement(INSERT_ENTRY) )
        {
            ps.setString(1, entry.getTitle());
            ps.setString(2, entry.getUsername());
            ps.setString(3, entry.getDescription());
            ps.setString(4, entry.getContents());
            ps.setDate(5, (Date) JDBC_Connection.getSQLDate(entry.getEntry_date()));
            ps.setBoolean(6, entry.getBookmarked() );
            success = ps.executeUpdate() > 0;
        }
        return success;
    }

    /*********************** Helper Methods *******************************/
    public DiaryEntry extractEntry(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        String title = rs.getString("title");
        String description = rs.getString("description");
        String contents = rs.getString("contents");
        String username = rs.getString("username");
        LocalDate entry_date = rs.getDate("entry_date").toLocalDate();
        boolean isBookmarked = rs.getBoolean("isBookmarked");
        return new DiaryEntry(id, title, description, contents, entry_date, isBookmarked,
                username);
    }
}
