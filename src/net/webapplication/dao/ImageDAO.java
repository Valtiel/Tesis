package net.webapplication.dao;

import java.io.IOException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;

import net.webapplication.model.Image;


public interface ImageDAO {
    
    /**
     * This is the method to be used to initialize * database resources ie.
     * connection.
     */
	
	
    public void setDataSource(DataSource ds);

    public void insertImage(Image image) throws DataAccessException, IOException;

    public Image getImage(Integer id);

    public List<Image> listImage();

    
    
}
