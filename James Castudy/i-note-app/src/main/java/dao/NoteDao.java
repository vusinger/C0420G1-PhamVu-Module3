package dao;

public interface NoteDao {
    void setTitle(String title);
    void setContent(String content);
    void setTypeId(int typeId);
    String getTitle(String content);
    String getContent(String content);
    String getType(String content);
    boolean save(String content);
    boolean delete(String content);
}