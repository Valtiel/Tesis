package net.webapplication.dao;

import java.util.List;

import javax.sql.DataSource;

import net.webapplication.model.Record;

public interface RecordDAO {

    /**
     * This is the method to be used to initialize * database resources ie.
     * connection.
     */
    public void setDataSource(DataSource ds);

    /**
     * This is the method to be used to create * a record in the Student table.
     */
    public void create(Record record);
    
    public void insertFile(Record file);

    /**
     * This is the method to be used to list down * a record from the Student
     * table corresponding * to a passed student id.
     */
    public Record getRecord(int id);

    /**
     * This is the method to be used to list down * all the records from the
     * Student table.
     */
    public List<Record> listRecord();

    /**
     * This is the method to be used to delete * a record from the Student table
     * corresponding * to a passed student id.
     */
    public void delete(Integer id);

	public List<Record> getRecordList(int idNumber, String string);

	public String getMedicId(String name);

}
