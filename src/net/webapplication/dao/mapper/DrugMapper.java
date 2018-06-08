package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.webapplication.model.Drug;

public class DrugMapper implements RowMapper<Drug> {

    @Override
    public Drug mapRow(ResultSet rs, int arg1) throws SQLException {
        Drug drug = new Drug();
        drug.setDrugName(rs.getString("drugName"));
        drug.setIdDrug(rs.getString("idDrug"));
        return drug;
    }
}
