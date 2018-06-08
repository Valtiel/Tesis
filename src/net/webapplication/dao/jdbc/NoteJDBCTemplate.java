package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import net.webapplication.dao.NoteDAO;
import net.webapplication.dao.mapper.NoteMapper;
import net.webapplication.model.Note;

public class NoteJDBCTemplate implements NoteDAO {

    @SuppressWarnings("unused")
    private DataSource dataSource;
    @SuppressWarnings("unused")
    private SimpleJdbcCall jdbcCall;
    private JdbcTemplate jdbcTemplateObject;

    @Override
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcCall = new SimpleJdbcCall(dataSource)
                .withProcedureName("getRecord");
        jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override
    public void create(Note note) {
        String SQL = "INSERT INTO note(noteTitle, noteContent, Client_idClient) VALUES (?,?,?);";
        jdbcTemplateObject.update(SQL, note.getNoteTitle(), note.getNoteContext(), note.getClientId());
    }

    @Override
    public Note getNote(int id) {
        String SQL = "select * from note where idNote = ?";
        Note nt = jdbcTemplateObject.queryForObject(SQL, new NoteMapper(), id);
        return nt;
    }

    @Override
    public List<Note> listNote() {
        String SQL = "select * from note";
        List<Note> nt = jdbcTemplateObject.query(SQL, new NoteMapper());
        return nt;
    }

    @Override
    public void delete(int id) {
        String SQL = "delete from note where idNote = ?";
        jdbcTemplateObject.update(SQL, id);
    }

	@Override
	public List<Note> getNoteList(int idNumber) {
		String SQL = "select * from note where Client_idClient=?";
        List<Note> nt = jdbcTemplateObject.query(SQL, new NoteMapper(),idNumber);
        return nt;
	}
}
