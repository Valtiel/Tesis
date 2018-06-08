package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import net.webapplication.dao.InstitutionDAO;
import net.webapplication.dao.mapper.InstitutionMapper;
import net.webapplication.model.Institution;

public class InstitutionJDBCTemplate implements InstitutionDAO {

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
    public void create(Institution institution) {
        String SQL = "INSERT INTO institution(idInstitution, name, address, phoneNumber, webPage) VALUES (?,?,?,?,?);";
        jdbcTemplateObject.update(SQL, institution.getIdInstitution(), institution.getName(),
                institution.getAddress(), institution.getPhoneNumber(), institution.getWebPage());
    }

    @Override
    public Institution getInstitution(Integer id) {
        String SQL = "select * from institution where idInstitution = ?";
        Institution ins = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new InstitutionMapper());
        return ins;
    }

    @Override
    public List<Institution> listInstitution() {
        String SQL = "select * from institution";
        List<Institution> ins = jdbcTemplateObject.query(SQL, new InstitutionMapper());
        return ins;
    }

    @Override
    public void delete(Integer id) {
        String SQL = "delete from institution where idInstitution = ?";
        jdbcTemplateObject.update(SQL, id);
    }
}
