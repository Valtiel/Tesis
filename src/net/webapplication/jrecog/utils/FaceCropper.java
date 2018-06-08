package net.webapplication.jrecog.utils;

import com.googlecode.javacv.cpp.opencv_core.CvMemStorage;
import com.googlecode.javacv.cpp.opencv_core.CvRect;
import com.googlecode.javacv.cpp.opencv_core.CvSeq;
import com.googlecode.javacv.cpp.opencv_core.IplImage;

import com.googlecode.javacv.cpp.opencv_objdetect.CvHaarClassifierCascade;

import static com.googlecode.javacv.cpp.opencv_core.IPL_DEPTH_8U;
import static com.googlecode.javacv.cpp.opencv_core.cvClearMemStorage;
import static com.googlecode.javacv.cpp.opencv_core.cvGetSeqElem;
import static com.googlecode.javacv.cpp.opencv_core.cvLoad;
import static com.googlecode.javacv.cpp.opencv_core.cvSetImageROI;
import static com.googlecode.javacv.cpp.opencv_core.cvGetSize;
import static com.googlecode.javacv.cpp.opencv_core.cvCopy;
import static com.googlecode.javacv.cpp.opencv_core.cvCreateImage;

import static com.googlecode.javacv.cpp.opencv_imgproc.CV_BGR2GRAY;
import static com.googlecode.javacv.cpp.opencv_imgproc.cvCvtColor;
import static com.googlecode.javacv.cpp.opencv_imgproc.cvEqualizeHist;
import static com.googlecode.javacv.cpp.opencv_imgproc.cvResize;
import static com.googlecode.javacv.cpp.opencv_imgproc.CV_INTER_LINEAR;

import static com.googlecode.javacv.cpp.opencv_objdetect.CV_HAAR_DO_CANNY_PRUNING;
import static com.googlecode.javacv.cpp.opencv_objdetect.cvHaarDetectObjects;

import static com.googlecode.javacv.cpp.opencv_highgui.cvLoadImage;
import static com.googlecode.javacv.cpp.opencv_highgui.cvSaveImage;

public class FaceCropper {

	private String HaarCascadeFile = "/home/valtiel/OpenCV-2.4.2/data/haarcascades/haarcascade_frontalface_alt2.xml";
	private CvHaarClassifierCascade cascade;
	private CvMemStorage storage = CvMemStorage.create();

	public FaceCropper() {
		cascade = new CvHaarClassifierCascade(cvLoad(HaarCascadeFile));
	}

	public IplImage getGrayScaleFaceImage(IplImage image) {
		IplImage grayScaled = IplImage.create(image.width(), image.height(),
				IPL_DEPTH_8U, 1);
		cvCvtColor(image, grayScaled, CV_BGR2GRAY);
		return getFace(grayScaled);
	}
	
	public IplImage getGrayScaleImage(IplImage image) {
		IplImage grayScaled = IplImage.create(image.width(), image.height(),
				IPL_DEPTH_8U, 1);
		cvCvtColor(image, grayScaled, CV_BGR2GRAY);
		return grayScaled;
	}

	public boolean existFace(IplImage image) {
		IplImage grayScaled = IplImage.create(FaceVar.BEST_WITDH,
				FaceVar.BEST_HEIGHT, IPL_DEPTH_8U, 1);
		cvCvtColor(image, grayScaled, CV_BGR2GRAY);
		return (getFace(image) == null) ? true : false;
	}

	/**
	 * @return the haarCascadeFile
	 */
	public String getHaarCascadeFile() {
		return HaarCascadeFile;
	}

	/**
	 * @param haarCascadeFile
	 *            the haarCascadeFile to set
	 */
	public void setHaarCascadeFile(String haarCascadeFile) {
		HaarCascadeFile = haarCascadeFile;
		
		synchronized (this) {
			cascade = new CvHaarClassifierCascade(cvLoad(HaarCascadeFile));
		}
		
	}

	public IplImage cropImage(final IplImage image, final CvRect rect) {
		cvSetImageROI(image, rect);
		IplImage cropped = cvCreateImage(cvGetSize(image), image.depth(),
				image.nChannels());
		cvCopy(image, cropped);
		return cropped;

	}

	private IplImage getFace(IplImage image) {
		IplImage resized = IplImage.create(image.width() / FaceVar.SCALE,
				image.height() / FaceVar.SCALE, IPL_DEPTH_8U, 1);
		cvResize(image, resized, CV_INTER_LINEAR);

		IplImage equalized = IplImage.create(resized.width(), resized.height(),
				IPL_DEPTH_8U, 1);
		cvEqualizeHist(resized, equalized);
		CvSeq faces;

		synchronized (this) {
			faces = cvHaarDetectObjects(equalized, cascade, storage, 1.1, 3,
					CV_HAAR_DO_CANNY_PRUNING);
			cvClearMemStorage(storage);
		}
		
		CvRect rect = new CvRect(cvGetSeqElem(faces, 0));
		IplImage toReturn = cropImage(equalized, rect);
		return toReturn;
	}

	public static void main(String arg[]) {
		FaceCropper fc = new FaceCropper();
		IplImage toCrop = cvLoadImage("test.jpg");
		if (toCrop != null)
			cvSaveImage("testresult.png", fc.getGrayScaleFaceImage(toCrop));
		else {
			System.out.println("IMPOSSIBIRU D:");
		}
	}
}
