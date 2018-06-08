package net.webapplication.dao;

import java.util.List;

import javax.sql.DataSource;

import net.webapplication.model.Note;

public interface NoteDAO {

    /**
     * This is the method to be used to initialize * database resources ie.
     * connection.
     */
    public void setDataSource(DataSource ds);

    /**
     * This is the method to be used to create * a record in the Student table.
     */
    public void create(Note note);

    /**
     * This is the method to be used to list down * a record from the Student
     * table corresponding * to a passed student id.
     */
    public Note getNote(int id);

    /**
     * This is the method to be used to list down * all the records from the
     * Student table.
     */
    public List<Note> listNote();

    /**
     * This is the method to be used to delete * a record from the Student table
     * corresponding * to a passed student id.
     */
    public void delete(int id);

	public List<Note> getNoteList(int idNumber);
}
