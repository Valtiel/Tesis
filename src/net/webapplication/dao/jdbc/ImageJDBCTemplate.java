package net.webapplication.dao.jdbc;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.sql.DataSource;
import net.webapplication.dao.ImageDAO;
import net.webapplication.dao.mapper.ImageMapper;
import net.webapplication.jrecog.utils.FaceCropper;
import net.webapplication.model.Image;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import static com.googlecode.javacv.cpp.opencv_core.CV_8UC1;
import static com.googlecode.javacv.cpp.opencv_core.cvMat;
import static com.googlecode.javacv.cpp.opencv_highgui.cvDecodeImage;
import static com.googlecode.javacv.cpp.opencv_highgui.cvSaveImage;

import com.googlecode.javacpp.BytePointer;
import com.googlecode.javacv.cpp.opencv_core.IplImage;

public class ImageJDBCTemplate implements ImageDAO {
	private static FaceCropper faceCropper;
	
	public ImageJDBCTemplate(){
		faceCropper=new FaceCropper();
		
	}
	
	public static synchronized byte[] getFace(byte[] data) throws IOException{
    	IplImage img=cvDecodeImage(cvMat(1, data.length, CV_8UC1, new BytePointer(data)));
    	IplImage grayFace=faceCropper.getGrayScaleFaceImage(img);
    	if(grayFace!=null){
    		System.out.println("asdasdasd");
    	}
		cvSaveImage("C:\testresult.png", grayFace);
		BufferedImage originalImage = grayFace.getBufferedImage();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write( originalImage, "png", baos );
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		baos.close();
		return imageInByte;
	}
	
	
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
    public void insertImage(Image image) throws DataAccessException, IOException {
    	
        String SQL = "INSERT INTO imagedb (image, Client_idClient) values (?,?);";
        jdbcTemplateObject.update(SQL, getFace(image.getBytes()) , image.getIdClient());
        
    }

    @Override
    public Image getImage(Integer id) {
        Image image;
        String SQL = "SELECT * FROM ImageDB WHERE idImage = ?";
        image = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new ImageMapper());
        return image;
    }

    @Override
    public List<Image> listImage() {
        String SQL = "SELECT * FROM imagedb";
        List<Image> images = jdbcTemplateObject.query(SQL, new ImageMapper());
        return images;
    }
}
