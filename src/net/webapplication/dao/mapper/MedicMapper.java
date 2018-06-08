package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import net.webapplication.model.Medic;

import org.springframework.jdbc.core.RowMapper;

public class MedicMapper implements RowMapper<Medic> {

    @Override
    public Medic mapRow(ResultSet rs, int arg1) throws SQLException {
        Medic m = new Medic();
        m.setIdMedic(rs.getString("idMedic"));
        m.setFirstName(rs.getString("firstName"));
        m.setLastName(rs.getString("lastName"));
        m.setEmail(rs.getString("email"));
        m.setAddress(rs.getString("address"));
        return m;
    }
}
