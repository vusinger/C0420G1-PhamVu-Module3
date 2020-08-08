package bo;

import model.Note;

import java.util.List;

public interface NoteManager {
    List<Note> searchNote(String keyword);
    void addNote(String title,String content,int typeId);
    void removeNote(int noteId);
}
