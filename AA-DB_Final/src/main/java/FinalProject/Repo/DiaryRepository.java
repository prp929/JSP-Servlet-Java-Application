package FinalProject.Repo;

import FinalProject.Model.DiaryEntry;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface DiaryRepository {
    void insertEntry(DiaryEntry entry) throws SQLException;

    DiaryEntry selectEntry(Integer entryId);
    ArrayList<DiaryEntry> selectUserEntries(String username);

    List<DiaryEntry> selectAllEntries();

    boolean deleteEntry(Integer id) throws SQLException;

    boolean updateEntry(DiaryEntry entry) throws SQLException;

    boolean createEntry(DiaryEntry entry) throws SQLException;
}
