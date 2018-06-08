package net.webapplication.model;

import java.io.Serializable;

public class JsonResponse implements Serializable {

	private static final long serialVersionUID = -38331060512340967L;
    private String status = null;
    private Object result = null;
    private String text = null;
 
    public JsonResponse(String status, String text){
    	this.status=status;
    	this.text=text;
    }
    public JsonResponse(){

    }
     /**
     * @return the result
     */
    public Object getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(Object result) {
        this.result = result;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }
}
