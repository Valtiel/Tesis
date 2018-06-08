package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.RelationClientInstitution;
import org.springframework.jdbc.core.RowMapper;

public class RelationClientInstitutionMapper implements RowMapper<RelationClientInstitution> {

    @Override
    public RelationClientInstitution mapRow(ResultSet rs, int i) throws SQLException {

        RelationClientInstitution clientInstitution = new RelationClientInstitution();

        clientInstitution.setIdClient(rs.getString("Client_idClient"));
        clientInstitution.setIdInstitution(rs.getString("Institution_idInstitution"));

        return clientInstitution;

    }
}
