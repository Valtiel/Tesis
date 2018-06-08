package net.webapplication.dao.jdbc;

import javax.sql.DataSource;
import net.webapplication.dao.RelationAdminDAO;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationMedicInstitution;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class RelationAdminJDBCTemplate implements RelationAdminDAO {

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
    public void addRelationClient(RelationClientInstitution clientInstitution) {
        String SQL = "INSERT INTO institution_has_client (Institution_idInstitution, Client_idClient)"
                + " values (?,?)";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void addRelationMedic(RelationMedicInstitution medicInstitution) {
        String SQL = "INSERT INTO institution_has_medic (Institution_idInstitution, Medic_idMedic)"
                + " VALUES (?,?)";
        jdbcTemplateObject.update(SQL, medicInstitution.getIdInstitution(), medicInstitution.getIdMedic());
    }

    @Override
    public void deleteRelationClient(RelationClientInstitution clientInstitution) {
        String SQL = "DELETE FROM institution_has_client "
                + "WHERE Institution_idInstitution = ? and Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void deleteRelationMedic(RelationMedicInstitution medicInstitution) {
        String SQL = "DELETE FROM institution_has_medic "
                + "WHERE Institution_idInstitution = ? and Client_idClient = ?";
        jdbcTemplateObject.update(SQL, medicInstitution.getIdInstitution(), medicInstitution.getIdMedic());
    }

    @Override
    public void updateRelationClient(RelationClientInstitution clientInstitution) {
        String SQL = "UPDATE institution_has_client "
                + "SET Institution_idInstitution = ?, Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void updateRelationMedic(RelationMedicInstitution medicInstitution) {
        String SQL = "UPDATE institution_has_medic "
                + "SET Institution_idInstitution = ?, Client_idMedic = ?";
        jdbcTemplateObject.update(SQL, medicInstitution.getIdInstitution(), medicInstitution.getIdMedic());
    }


}
