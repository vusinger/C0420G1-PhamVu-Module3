package dao;

import model.Note;
import model.Type;

import java.util.List;

public interface NoteDao {

    void insert(Note note);

    void update(Note note);

    Note getNote(int id);

    boolean delete(int id);

    List<Note> getList();

    List<Type> getListType();
}