package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import net.webapplication.dao.DrugDAO;
import net.webapplication.dao.mapper.DrugMapper;
import net.webapplication.model.Drug;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class DrugJDBCTemplate implements DrugDAO {

    @SuppressWarnings("unused")
    private DataSource dataSource;
    @SuppressWarnings("unused")
    private SimpleJdbcCall jdbcCall;
    JdbcTemplate jdbcTemplateObject;

    @Override
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcCall = new SimpleJdbcCall(dataSource)
                .withProcedureName("getRecord");
        jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override
    public void create(Drug drug) {
        String SQL = "INSERT INTO drug(idDrug, drugName) VALUES (?,?);";
        jdbcTemplateObject.update(SQL, drug.getIdDrug(), drug.getDrugName());
    }

    @Override
    public Drug getDrug(Integer id) {
        String SQL = "select * from drug where idDrug = ?";
        Drug drug = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new DrugMapper());
        return drug;
    }

    @Override
    public List<Drug> listDrug() {
        String SQL = "select * from drug";
        List<Drug> dr = jdbcTemplateObject.query(SQL, new DrugMapper());
        return dr;
    }

    @Override
    public void delete(Integer id) {
        String SQL = "delete from drug where idDrug = ?";
        jdbcTemplateObject.update(SQL, id);
    }

    @Override
    public void update(Integer id, Integer age) {
        // TODO Auto-generated method stub
    }
}
