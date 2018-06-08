package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.webapplication.model.Image;
import org.springframework.jdbc.core.RowMapper;

public class ListImageMapper implements RowMapper<List<Image>> {

    @Override
    public List<Image> mapRow(ResultSet rs, int i) throws SQLException {
    	List<Image> list = new ArrayList<>();
    	while(rs.next()){
    		 Image image = new Image();

    	        image.setBytes(rs.getBytes("bytes"));
    	        image.setIdClient(rs.getString("Client_idClient"));
    	        list.add(image);
    	}
        return list;

    }
}
