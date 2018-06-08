/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.RelationClientMedic;
import org.springframework.jdbc.core.RowMapper;

public class RelationClientMedicMapper implements RowMapper<RelationClientMedic> {

    @Override
    public RelationClientMedic mapRow(ResultSet rs, int i) throws SQLException {

        RelationClientMedic clientMedic = new RelationClientMedic();

        clientMedic.setIdClient(rs.getString("Client_idClient"));
        clientMedic.setIdMedic(rs.getString("Medic_idMedic"));

        return clientMedic;

    }
}
