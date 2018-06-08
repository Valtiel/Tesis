package net.webapplication.model;

public class Image {

    private byte bytes[];
    
    private String idClient;
    
    public Image() {
    	super();
    }

    public Image(byte[] bytes, String idClient) {
    	super();
        this.bytes = bytes;
        this.idClient = idClient;
    }


    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String Client_idClient) {
        this.idClient = Client_idClient;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }
}
