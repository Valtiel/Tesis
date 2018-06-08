package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.Prescription;
import org.springframework.jdbc.core.RowMapper;

public class PrescriptionMapper implements RowMapper<Prescription> {

    @Override
    public Prescription mapRow(ResultSet rs, int i) throws SQLException {
        Prescription prescription = new Prescription();
        
        prescription.setBeganOn(rs.getString("beganOn"));
        prescription.setDosage(rs.getString("dosage"));
        prescription.setFrequency(rs.getString("frequency"));
        prescription.setReason(rs.getString("reason"));
        prescription.setSideEffect(rs.getString("sideEffect"));
        prescription.setNoteId(rs.getString("Notes_noteID"));
        prescription.setClientId(rs.getString("Client_idClient"));
        prescription.setDrugId(rs.getString("Drug_idDrug"));

        return prescription;


    }
}
