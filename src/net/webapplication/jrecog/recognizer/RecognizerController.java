package net.webapplication.jrecog.recognizer;
import com.googlecode.javacv.cpp.opencv_core.IplImage;

import static com.googlecode.javacv.cpp.opencv_highgui.*;
import static com.googlecode.javacv.cpp.opencv_core.*;
import static com.googlecode.javacv.cpp.opencv_contrib.*;

import net.webapplication.jrecog.utils.FaceCropper;

public class RecognizerController {

    private FaceRecognizer faceRecognizer;
    private IplImage[] trainingSet;
    public int[] labels;
    private MatVector images;
    
    public RecognizerController( IplImage[] trainingSet, int[] labels ){
        setFaceRecognizer(createLBPHFaceRecognizer());
        this.trainingSet=trainingSet;
        this.labels=labels;
        images=new MatVector(trainingSet.length);
        for (int i=0;i<trainingSet.length;i++) {
        	
            images.put(i, trainingSet[i]);
        }
        faceRecognizer.train(images, labels);
    }
    
    public int getLabel(IplImage image){
    	return faceRecognizer.predict(image);
    }

	/**
	 * @return the trainingSet
	 */
	public IplImage[] getTrainingSet() {
		return trainingSet;
	}


	/**
	 * @param trainingSet the trainingSet to set
	 */
	public void setTrainingSet(IplImage[] trainingSet) {
		this.trainingSet = trainingSet;
	}


	/**
	 * @return the faceRecognizer
	 */
	public FaceRecognizer getFaceRecognizer() {
		return faceRecognizer;
	}


	/**
	 * @param faceRecognizer the faceRecognizer to set
	 */
	public void setFaceRecognizer(FaceRecognizer faceRecognizer) {
		this.faceRecognizer = faceRecognizer;
	}


	/**
	 * @return the images
	 */
	MatVector getImages() {
		return images;
	}


	/**
	 * @param images the images to set
	 */
	void setImages(MatVector images) {
		this.images = images;
	}

	
	public static void main(String[] arg){
		FaceCropper fc = new FaceCropper();
		IplImage[] trainingSet=new IplImage[4];
		int[] labels=new int[4];
		for(int i=0;i<labels.length;i++){
			IplImage img=fc.getGrayScaleImage(cvLoadImage((i+1)+".png"));
			trainingSet[i]=img;
			if(i%2==0)
				labels[i]=20584927;
			else
				labels[i]=20584929;
		}
		
		RecognizerController rc=new RecognizerController(trainingSet,labels);
		IplImage toCrop = cvLoadImage("test.jpg");
		if (toCrop != null){
			int label=rc.getLabel(fc.getGrayScaleFaceImage(toCrop));
			System.out.println(label);
		}else {
			System.out.println("IMPOSSIBIRU D:");
		}
	}
    
}
