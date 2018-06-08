package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import net.webapplication.dao.ClientDAO;
import net.webapplication.dao.mapper.ClientMapper;
import net.webapplication.model.Client;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class ClientJDBCTemplate implements ClientDAO {

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
    public void create(Client client) {
        // TODO Auto-generated method stub
        String SQL = "INSERT INTO client (idClient,  firstName, lastName, birthDate, phoneNumber, email, address, bloodType, occupation, height, sex, citizenship)"
                + " values (?,?,?,?,?,?,?,?,?,?,?,?);";
        System.out.println("Creating Client: " + client.getIdClient() + " BT: "+client.getBloodType());
        jdbcTemplateObject.update(SQL, client.getIdClient(), client.getFirstName(), client.getLastName(), client.getBirthDate(), client.getPhoneNumber(), client.getEmail(), client.getAddress(), client.getBloodType(),
                client.getOccupation(), client.getHeight(), client.getSex(),client.getCitizenship());
        System.out.println("Created Client: " + client.getIdClient());
    }

    @Override
    public Client getClient(Integer id) {
        String SQL = "select * from client where idClient = ?";
        Client cl = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new ClientMapper());
        return cl;
    }

    @Override
    public List<Client> listClient() {
        String SQL = "select * from client";
        List<Client> cl = jdbcTemplateObject.query(SQL, new ClientMapper());
        return cl;
    }

    @Override
    public void delete(Integer id) {
        String SQL = "delete from client where idClient = ?";
        jdbcTemplateObject.update(SQL, id);
    }

    @Override
    public void update(Integer id, Integer age) {
        // TODO Auto-generated method stub
    }
}