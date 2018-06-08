/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.webapplication.dao.jdbc;

import javax.sql.DataSource;
import net.webapplication.dao.RelationClientDAO;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationClientMedic;
import net.webapplication.model.RelationClientProblem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

/**
 *
 * @author Rafael Acosta
 */
public class RelationClientJDBCTemplate implements RelationClientDAO {

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
    public void addRelationInstitution(RelationClientInstitution clientInstitution) {
        String SQL = "INSERT INTO institution_has_client (Institution_idInstitution, Client_idClient)"
                + " values (?,?)";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void addRelationMedic(RelationClientMedic clientMedic) {
        String SQL = "INSERT INTO client_has_medic (Medic_idMedic, Client_idClient)"
                + " VALUES (?,?)";
        jdbcTemplateObject.update(SQL, clientMedic.getIdMedic(), clientMedic.getIdClient());
    }

    @Override
    public void addRelationProblem(RelationClientProblem clientProblem) {
        String SQL = "INSERT INTO client_has_problem (Problem_idProblem, Client_idClient)"
                + " VALUES (?,?)";
        jdbcTemplateObject.update(SQL, clientProblem.getIdProblem(), clientProblem.getIdClient());
    }

    @Override
    public void deleteRelationInstitution(RelationClientInstitution clientInstitution) {
        String SQL = "DELETE FROM institution_has_client "
                + "WHERE Institution_idInstitution = ? and Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void deleteRelationMedic(RelationClientMedic clientMedic) {
        String SQL = "DELETE FROM client_has_medic "
                + "WHERE Medic_idMedic = ? and Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientMedic.getIdMedic(), clientMedic.getIdClient());
    }

    @Override
    public void deleteRelationProblem(RelationClientProblem clientProblem) {
        String SQL = "DELETE FROM client_has_problem "
                + "WHERE Problem_idProblem = ? and Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientProblem.getIdProblem(), clientProblem.getIdClient());
    }

    @Override
    public void updateRelationInstitution(RelationClientInstitution clientInstitution) {
        String SQL = "UPDATE institution_has_client "
                + "SET Institution_idInstitution = ?, Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientInstitution.getIdInstitution(), clientInstitution.getIdClient());
    }

    @Override
    public void updateRelationMedic(RelationClientMedic clientMedic) {
        String SQL = "UPDATE client_has_medic "
                + "SET Medidc_idMedic = ?, Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientMedic.getIdMedic(), clientMedic.getIdClient());
    }

    @Override
    public void updateRelationProblem(RelationClientProblem clientProblem) {
        String SQL = "UPDATE client_has_problems "
                + "SET Problem_idProblem = ?, Client_idClient = ?";
        jdbcTemplateObject.update(SQL, clientProblem.getIdProblem(), clientProblem.getIdClient());
    }
}
//Example INNER JOIN
//        String SQL = "INSERT INTO institution_has_client (Institution_idInstitution, Client_idClient)"
//                + " VALUES ("
//                + "SELECT institution_has_client.Institution_idInstitution "
//                + "FROM institution_has_client"
//                + "INNER JOIN institution"
//                + "ON institution_has_client.Institution_idInstitution = institution.idClient);";

