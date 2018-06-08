package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import net.webapplication.model.Problem;

import org.springframework.jdbc.core.RowMapper;

public class ProblemMapper implements RowMapper<Problem> {

    @Override
    public Problem mapRow(ResultSet rs, int arg1) throws SQLException {
        Problem p = new Problem();
        p.setIdProblem(rs.getString("idProblem"));
        p.setDescription(rs.getString("description"));
        return p;
    }
}
