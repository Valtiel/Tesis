package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import net.webapplication.model.Record;

import org.springframework.jdbc.core.RowMapper;

public class RecordMapper implements RowMapper<Record> {

    @Override
    public Record mapRow(ResultSet rs, int arg1) throws SQLException {
    	Record r = new Record();
    	r.setBytes(rs.getBytes("bytes"));
    	r.setFileName(rs.getString("fileName"));
    	r.setIdClient(rs.getString("Client_idClient"));
    	r.setIdInstitution(rs.getString("Institution_idInstitution"));
    	r.setIdMedic(rs.getString("Medic_idMedic"));
    	r.setIdRecord(rs.getString("idRecord"));
    	r.setSizeInKb(rs.getLong("size"));
        return r;
    }
}
