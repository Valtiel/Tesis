package net.webapplication.jrecog.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.googlecode.javacv.cpp.opencv_core.IplImage;

public class Utils {

	public static boolean isAceptable(IplImage image){
		return (image.width()>=250 && image.height()>=250) && (image.width()<=500 && image.height()<=500) ;
	}
	
	public static void toIplImage(){
		
	}
	
	public static void toMultiPartArchive(IplImage image){
		
	}
	public static void main(String arg[]){
		System.out.print(encodeSHA("123456"));
	}
	public static String encodeSHA(String password)
    {
    	//String password = "DescripcióndePassword";
 
        MessageDigest md=null;
		try {
			md = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        md.update(password.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
 
        return sb.toString();
 
    }
}