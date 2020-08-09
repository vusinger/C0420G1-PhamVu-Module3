package dao;

import model.Note;
import model.Type;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteDaoImpl implements NoteDao{

    private final String INSERT_NOTE = "insert into note(title,content,flag,type_id) value (?,?,?,?)";
    private final String SELECT_NOTE = "select * from note";
    private final String SELECT_NOTE_TYPE = "select * from note_type";
    private final String DELETE_NOTE = "update note set flag = false where note.id = ? ";
    private final String UPDATE_NOTE = "update note set title = ?,content = ?,type_id = ? where note.id = ? ";
    private final String GET_NOTE_BY_ID = "select * from note where note.id = ?";

    @Override
    public void insert(Note note){
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(INSERT_NOTE);
            preparedStatement.setString(1, note.getTitle());
            preparedStatement.setString(2, note.getContent());
            preparedStatement.setBoolean(3, note.getFlag());
            preparedStatement.setInt(4, note.getTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Note note){
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(UPDATE_NOTE);
            preparedStatement.setString(1, note.getTitle());
            preparedStatement.setString(2, note.getContent());
            preparedStatement.setInt(3, note.getTypeId());
            preparedStatement.setInt(4, note.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Note getNote(int id) {
        Note note = new Note();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(GET_NOTE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                note.setId(resultSet.getInt(1));
                note.setTitle(resultSet.getString(2));
                note.setContent(resultSet.getString(3));
                note.setTypeId(resultSet.getInt(4));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return note;
    }

    @Override
    public boolean delete(int id) {
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(DELETE_NOTE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Note> getList() {
        List<Note> noteList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NOTE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Note note = new Note();
                note.setId(resultSet.getInt(1));
                note.setTitle(resultSet.getString(2));
                note.setContent(resultSet.getString(3));
                note.setTypeId(resultSet.getInt(4));
                if (resultSet.getBoolean(5) == true) {
                    noteList.add(note);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return noteList;
    }

    @Override
    public List<Type> getListType() {
        List<Type> typeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseDao.getConnection().prepareStatement(SELECT_NOTE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Type type = new Type();
                type.setId(resultSet.getInt(1));
                type.setName(resultSet.getString(2));
                typeList.add(type);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return typeList;
    }
}
