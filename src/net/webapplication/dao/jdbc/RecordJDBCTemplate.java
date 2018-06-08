package net.webapplication.dao.jdbc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import net.webapplication.dao.RecordDAO;
import net.webapplication.dao.mapper.MedicMapper;
import net.webapplication.dao.mapper.RecordMapper;
import net.webapplication.model.Medic;
import net.webapplication.model.Record;

public class RecordJDBCTemplate implements RecordDAO {
	private DataSource dataSource;
	@SuppressWarnings("unused")
	private SimpleJdbcCall jdbcCall;
	private JdbcTemplate jdbcTemplateObject;

	@Override
	public void setDataSource(DataSource ds) {
		this.dataSource = ds;
		this.jdbcCall = new SimpleJdbcCall(dataSource)
				.withProcedureName("getRecord");
		jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	@Override
	public void create(Record record) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public Record getRecord(int id) {
		String SQL = "select * from record where idRecord=?";
        Record nt = jdbcTemplateObject.queryForObject(SQL, new RecordMapper(),id);
        return nt;	
     }

	@Override
	public List<Record> listRecord() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public void delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public void insertFile(Record file) {
		  // TODO Auto-generated method stub
        String SQL = "INSERT INTO record (bytes, Client_idClient, Institution_idInstitution, Medic_idMedic, fileName, size) values (?,?,?,?,?,?)";
        jdbcTemplateObject.update(SQL, file.getBytes(), file.getIdClient(), file.getIdInstitution(),file.getIdMedic(),file.getFileName(), file.getSizeInKb());
        System.out.println("Created Record: " + file.getFileName());
	}

	@Override
	public List<Record> getRecordList(int idNumber, String username) {
		String SQL = "select r.* from record r inner join medic m on r.Medic_idMedic=m.idMedic where r.Client_idClient=? and m.username=?";
        List<Record> nt = jdbcTemplateObject.query(SQL, new RecordMapper(),idNumber, username);
        return nt;
	}

	@Override
	public String getMedicId(String name) {
		String SQL = "select * from medic where username=?";
        Medic nt = jdbcTemplateObject.queryForObject(SQL, new MedicMapper(),name);
        return nt.getIdMedic();	
	}
}
