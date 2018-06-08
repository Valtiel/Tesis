package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.RelationClientProblem;
import org.springframework.jdbc.core.RowMapper;

public class RelationClientProblemMapper implements RowMapper<RelationClientProblem> {

    @Override
    public RelationClientProblem mapRow(ResultSet rs, int i) throws SQLException {

        RelationClientProblem clientProblem = new RelationClientProblem();

        clientProblem.setIdClient(rs.getString("Client_idClient"));
        clientProblem.setIdProblem(rs.getString("Problem_idProblem"));

        return clientProblem;

    }
}
