package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import net.webapplication.dao.ProblemDAO;
import net.webapplication.dao.mapper.ProblemMapper;
import net.webapplication.model.Problem;

public class ProblemJDBCTemplate implements ProblemDAO {

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
    public void create(Problem problem) {
        String SQL = "INSERT INTO problem(idProblem, description) VALUES (?,?);";
        jdbcTemplateObject.update(SQL, problem.getIdProblem(),  problem.getDescription());
    }

    @Override
    public Problem getProblem(Integer id) {
        String SQL = "select * from problem where idProblem = ?";
        Problem pr = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new ProblemMapper());
        return pr;
    }

    @Override
    public List<Problem> listProblem() {
        String SQL = "select * from Problem";
        List<Problem> problem = jdbcTemplateObject.query(SQL, new ProblemMapper());
        return problem;
    }

    @Override
    public void delete(Integer id) {
        String SQL = "delete from problem where idProblem = ?";
        jdbcTemplateObject.update(SQL, id);
    }

	@Override
	public List<Problem> getProblemsById(int idNumber) {
		String SQL = "select * from problem inner join client_has_problem on problem.idProblem=client_has_problem.Problem_idProblem where client_has_problem.Client_idClient = ?";
        List<Problem> problem = jdbcTemplateObject.query(SQL, new ProblemMapper(), idNumber);
		return problem;
	}
}
