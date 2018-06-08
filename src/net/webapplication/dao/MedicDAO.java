package net.webapplication.dao;

import java.util.List;

import javax.sql.DataSource;

import net.webapplication.model.Medic;

public interface MedicDAO {

    /**
     * This is the method to be used to initialize * database resources ie.
     * connection.
     */
    public void setDataSource(DataSource ds);

    /**
     * This is the method to be used to create * a record in the Student table.
     */
    public void create(Medic medic);

    /**
     * This is the method to be used to list down * a record from the Student
     * table corresponding * to a passed student id.
     */
    public Medic getMedic(Integer id);

    /**
     * This is the method to be used to list down * all the records from the
     * Student table.
     */
    public List<Medic> listMedic();

    /**
     * This is the method to be used to delete * a record from the Student table
     * corresponding * to a passed student id.
     */
    public void delete(Integer id);
}
