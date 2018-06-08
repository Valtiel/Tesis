package net.webapplication.controller;

import static com.googlecode.javacv.cpp.opencv_core.CV_8UC1;
import static com.googlecode.javacv.cpp.opencv_core.IPL_DEPTH_8U;
import static com.googlecode.javacv.cpp.opencv_core.cvMat;
import static com.googlecode.javacv.cpp.opencv_highgui.cvDecodeImage;
import static com.googlecode.javacv.cpp.opencv_imgproc.CV_BGR2GRAY;
import static com.googlecode.javacv.cpp.opencv_imgproc.cvCvtColor;

import java.util.List;
import java.io.IOException;


import net.webapplication.dao.ImageDAO;
import net.webapplication.jrecog.recognizer.RecognizerController;
import net.webapplication.jrecog.utils.FaceCropper;
import net.webapplication.model.Image;
import net.webapplication.model.JsonResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.googlecode.javacpp.BytePointer;
import com.googlecode.javacv.cpp.opencv_core.IplImage;


@Controller
@SessionAttributes
@RequestMapping(value = "/ClientImages")
public class ImageController {

	@Autowired
	ImageDAO imageDAO;

	RecognizerController faceRecognizer;

	public void train() {
		List<Image> images = imageDAO.listImage();
		IplImage[] imgs = new IplImage[images.size()];
		int[] ids = new int[images.size()];
		for (int i = 0; i < images.size(); i++) {
			System.out.println("PROCESSING =" + images.get(i).getIdClient());
			IplImage temp = null;
			byte[] data = images.get(i).getBytes();
			temp = decode(data);
			//System.out.println("NULL TEST" + temp.height());
			IplImage grayScaled = IplImage.create(temp.width(), temp.height(),
					IPL_DEPTH_8U, 1);
			cvCvtColor(temp, grayScaled, CV_BGR2GRAY);
			imgs[i] = grayScaled;
			ids[i] = Integer.parseInt(images.get(i).getIdClient());
		}
		faceRecognizer = new RecognizerController(imgs, ids);
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
		train();
	}

	@RequestMapping(value = "/get.htm", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse get(@RequestParam("archive") MultipartFile archive)
			throws IOException {
		// Do custom steps here
		 //this.train();
		JsonResponse res = new JsonResponse();
		//UploadedFile u = new UploadedFile();
		if (archive == null) {
			res.setStatus("FAIL");
			res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
			//u.setName("FAIL");
			return res;
		}
		byte[] data = archive.getBytes();
		try{
			FaceCropper fc = new FaceCropper();
			IplImage temp = decode(data);
			int label = faceRecognizer.getLabel(fc.getGrayScaleFaceImage(temp));
			System.out.println(label);
			res.setStatus("SUCCESS");
			res.setText("" + label);
			System.out.println(res.getStatus());
			//u.setName("SUCCESS");
			return res;
		}catch(Exception e){
			e.printStackTrace();
			res.setStatus("FAIL");
			res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
			//u.setName("FAIL");
			return res;
		}
	}

	// TODO: Necesita un cambio con la respuesta
	@RequestMapping(value = "/file.htm", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse upload(@RequestParam("archive") MultipartFile archive,
			@RequestParam("clientId") String inputClientId) {
		// Do custom steps here
		JsonResponse res = new JsonResponse();
		System.out.println(inputClientId);
		if (archive == null || inputClientId.equalsIgnoreCase("")) {
			res.setStatus("FAIL");
			res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
			return res;
		} else {
			System.out.println(archive.getOriginalFilename());
		}
		try {
			imageDAO.insertImage(new Image(archive.getBytes(), inputClientId));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			res.setStatus("FAIL");
			res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
			e.printStackTrace();
			return res;
		}
		res.setStatus("SUCCESS");
		res.setText("Se ha procesado la imagen con éxito.");
		return res;
	}

	public IplImage decode(byte[] pole) {
		return cvDecodeImage(cvMat(1, pole.length, CV_8UC1, new BytePointer(
				pole)));
	}
}
