/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.webapplication.dao.jdbc;

import java.util.List;
import javax.sql.DataSource;
import net.webapplication.dao.PrescriptionDAO;
import net.webapplication.dao.mapper.PrescriptionMapper;
import net.webapplication.model.Prescription;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

/**
 *
 * @author Rafael Acosta
 */
public class PrescriptionJDBCTemplate implements PrescriptionDAO {

    private DataSource dataSource;
    @SuppressWarnings("unused")
    private SimpleJdbcCall jdbcCall;
    private JdbcTemplate jdbcTemplateObject;

    @Override
    public void setDataSource(DataSource ds) {
        this.dataSource = ds;
        this.jdbcCall = new SimpleJdbcCall(dataSource)
                .withProcedureName("getRecord");
        jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override
    public void create(Prescription prescription) {
        String SQL = "INSERT INTO prescription (Drug_idDrug, Client_idClient,"
                + " dosage, frequency, beganOn, reason, sideEffect, Notes_noteID) VALUES (?,?,?,?);";
        jdbcTemplateObject.update(SQL, prescription.getDrugId(), prescription.getClientId(),
                prescription.getDosage(), prescription.getFrequency(), prescription.getBeganOn(),
                prescription.getReason(), prescription.getSideEffect(), prescription.getSideEffect());
    }
    
// se hace uso de inner joins para la toma de datos
    @Override
    public Prescription getPrescription(Integer id) {
        String SQL = "select * from prescription where  = ?";
        Prescription nt = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new PrescriptionMapper());
        return nt;
    }
//inner joins
    @Override
    public List<Prescription> listPrescription() {
        
        String SQL = "select * from prescription";
        List<Prescription> nt = jdbcTemplateObject.query(SQL, new PrescriptionMapper());
        return nt;
    }
//inner joins 
    @Override
    public void delete(Integer id) {
        String SQL = "delete from prescription where = ?";
        jdbcTemplateObject.update(SQL, id);
    }
}
