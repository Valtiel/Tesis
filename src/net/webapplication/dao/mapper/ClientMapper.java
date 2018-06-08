package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import net.webapplication.model.Client;

import org.springframework.jdbc.core.RowMapper;

public class ClientMapper implements RowMapper<Client> {

    @Override
    public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
        // TODO Generate log stream from here, 'Client id=id mapping'
        Client client = new Client();
        client.setFirstName(rs.getString("firstName"));
        client.setLastName(rs.getString("lastName"));
        client.setAddress(rs.getString("address"));
        client.setHeight(rs.getString("height"));
        client.setBloodType(rs.getString("bloodType"));
        client.setContactId(rs.getString("contactID"));
        client.setEmail(rs.getString("email"));
        client.setIdClient(rs.getString("idClient"));
        client.setPhoneNumber(rs.getString("phoneNumber"));
        client.setSex(rs.getString("sex"));
        client.setOccupation(rs.getString("occupation"));
        client.setBirthDate(rs.getDate("birthDate"));
        client.setCitizenship(rs.getString("citizenship"));

        return client;

    }
}
