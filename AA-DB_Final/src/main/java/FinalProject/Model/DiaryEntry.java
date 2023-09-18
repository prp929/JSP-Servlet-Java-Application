package FinalProject.Model;

import java.time.LocalDate;
import java.util.Objects;

public class DiaryEntry implements Comparable<DiaryEntry>{
    private Integer id;
    private String title;
    private String description;
    private String username;

    private String contents;
    private LocalDate entry_date;
    private Boolean isBookmarked;

    public DiaryEntry() {}
    public DiaryEntry(String un) {
        this.username = un;
        this.title = "";
        this.description = "";
        this.contents = "";
        this.isBookmarked = false;
        this.id=-1;
    }

    public DiaryEntry(Integer id, String title, String description, String contents, LocalDate entry_date, Boolean isBookmarked,
                      String username) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.description = description;
        this.contents = contents;
        this.entry_date = entry_date;
        this.isBookmarked = isBookmarked;
    }
    public DiaryEntry(String title, String description, String contents, LocalDate entry_date,
                      String username, Boolean isBookmarked) {
        this.title = title;
        this.description = description;
        this.contents = contents;
        this.entry_date = entry_date;
        this.isBookmarked = isBookmarked;
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public LocalDate getEntry_date() {
        return entry_date;
    }

    public void setEntry_date(LocalDate entry_date) {
        this.entry_date = entry_date;
    }

    public Boolean getBookmarked() {
        return isBookmarked;
    }

    public void setBookmarked(Boolean bookmarked) {
        isBookmarked = bookmarked;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "DiaryEntry{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", contents='" + contents + '\'' +
                ", username='" + username + '\'' +
                ", entry_date=" + entry_date +
                ", isBookmarked=" + isBookmarked +
                '}';
    }


    @Override
    public int compareTo(DiaryEntry o) {
        return getEntry_date().compareTo(o.getEntry_date());
    }
}
