package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.RelationMedicInstitution;
import org.springframework.jdbc.core.RowMapper;

public class RelationMedicInstitutionMapper implements RowMapper<RelationMedicInstitution> {

    @Override
    public RelationMedicInstitution mapRow(ResultSet rs, int i) throws SQLException {

        RelationMedicInstitution medicInstitution = new RelationMedicInstitution();

        medicInstitution.setIdMedic(rs.getString("Medic_idMedic"));
        medicInstitution.setIdInstitution(rs.getString("Institution_idInstitution"));

        return medicInstitution;

    }
}
