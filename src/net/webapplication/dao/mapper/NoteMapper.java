package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.webapplication.model.Note;

public class NoteMapper implements RowMapper<Note> {

    @Override
    public Note mapRow(ResultSet rs, int arg1) throws SQLException {
        Note n = new Note();
        n.setClientId(rs.getString("Client_idClient"));
        n.setNoteContext(rs.getString("noteContent"));
        n.setNoteTitle(rs.getString("noteTitle"));
        n.setNoteId(rs.getString("idNote"));
        return n;
    }
}
