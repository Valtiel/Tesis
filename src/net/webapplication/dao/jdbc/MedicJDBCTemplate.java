package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import net.webapplication.dao.MedicDAO;
import net.webapplication.dao.mapper.MedicMapper;
import net.webapplication.jrecog.utils.Utils;
import net.webapplication.model.Medic;

public class MedicJDBCTemplate implements MedicDAO {

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
	public void create(Medic medic) {
		String SQL = "INSERT INTO medic(idMedic, firstName, lastName, phoneNumber, email, address, username, password, enabled) VALUES (?,?,?,?,?,?,?,?,TRUE);";
		jdbcTemplateObject.update(SQL, medic.getIdMedic(),
				medic.getFirstName(), medic.getLastName(),
				medic.getPhoneNumber(), medic.getEmail(), medic.getAddress(),
				medic.getUsername(), Utils.encodeSHA(medic.getPassword()));
		String SQLB = "INSERT INTO user_roles(authority, user_id) VALUES ('ROLE_USER',?);";
		jdbcTemplateObject.update(SQLB, medic.getIdMedic());
	}

	@Override
	public Medic getMedic(Integer id) {
		String SQL = "select * from medic where idMedic = ?";
		Medic mc = jdbcTemplateObject.queryForObject(SQL, new Object[] { id },
				new MedicMapper());
		return mc;
	}

	@Override
	public List<Medic> listMedic() {
		String SQL = "select * from medic";
		List<Medic> mc = jdbcTemplateObject.query(SQL, new MedicMapper());
		return mc;
	}

	@Override
	public void delete(Integer id) {
		String SQL = "delete from medic where idMedic = ?";
		jdbcTemplateObject.update(SQL, id);
	}
}
