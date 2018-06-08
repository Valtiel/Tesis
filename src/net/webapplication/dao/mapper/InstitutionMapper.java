package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.webapplication.model.Institution;

public class InstitutionMapper implements RowMapper<Institution> {

    @Override
    public Institution mapRow(ResultSet rs, int arg1) throws SQLException {
        Institution institution = new Institution();
        institution.setIdInstitution(rs.getString("idInstitution"));
        institution.setAddress(rs.getString("name"));
        institution.setName(rs.getString("address"));
        institution.setPhoneNumber(rs.getString("phoneNumber"));
        institution.setWebPage(rs.getString("WebPage"));
        return institution;
    }
}
