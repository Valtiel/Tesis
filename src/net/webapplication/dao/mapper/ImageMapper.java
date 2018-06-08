package net.webapplication.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import net.webapplication.model.Image;
import org.springframework.jdbc.core.RowMapper;

public class ImageMapper implements RowMapper<Image> {

    @Override
    public Image mapRow(ResultSet rs, int i) throws SQLException {

        Image image = new Image();

        image.setBytes(rs.getBytes("image"));
        image.setIdClient(rs.getString("Client_idClient"));

        return image;

    }
}
