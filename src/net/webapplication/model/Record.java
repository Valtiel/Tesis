package net.webapplication.model;

import javax.validation.constraints.NotNull;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

//ignore "bytes" when return json format
@JsonIgnoreProperties({ "bytes" })
public class Record {
	
	private String fileName;
    @NotNull(message = "No se ha seleccionado un cliente.")
    @NotEmpty(message = "No se ha seleccionado un cliente.")
    @NumberFormat(style = Style.NUMBER)
	private String idClient;
    @NotNull(message = "No se ha seleccionado una Institución.")
    @NotEmpty(message = "No se ha seleccionado una Institución.")
    @NumberFormat(style = Style.NUMBER)
	private String idInstitution;
    @NotNull(message = "No se ha seleccionado un Médico.")
    @NotEmpty(message = "No se ha seleccionado un Médico.")
    @NumberFormat(style = Style.NUMBER)
	private String idMedic;
    @NumberFormat(style = Style.NUMBER)
	private String idRecord;
	private byte[] bytes;
	private long sizeInKb;

	public Record(){
		
	}
	public Record(byte[] bytes, String idClient, String idInstitution,
			String idMedic, String fileName, long sizeInKb) {
		this.bytes = bytes;
		this.idClient = idClient;
		this.idInstitution = idInstitution;
		this.idMedic = idMedic;
		this.fileName=fileName;
		this.sizeInKb=sizeInKb;
	}

	public Record(byte[] bytes, String idClient, String idInstitution,
			String idMedic) {
		this.bytes = bytes;
		this.idClient = idClient;
		this.idInstitution = idInstitution;
		this.idMedic = idMedic;
	}

	public Record(byte[] bytes) {
		this.bytes = bytes;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName
	 *            the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the bytes
	 */
	public byte[] getBytes() {
		return bytes;
	}

	/**
	 * @param bytes
	 *            the bytes to set
	 */
	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}

	/**
	 * @return the idMedic
	 */
	public String getIdMedic() {
		return idMedic;
	}

	/**
	 * @param idMedic
	 *            the idMedic to set
	 */
	public void setIdMedic(String idMedic) {
		this.idMedic = idMedic;
	}

	/**
	 * @return the idInstitution
	 */
	public String getIdInstitution() {
		return idInstitution;
	}

	/**
	 * @param idInstitution
	 *            the idInstitution to set
	 */
	public void setIdInstitution(String idInstitution) {
		this.idInstitution = idInstitution;
	}

	/**
	 * @return the idClient
	 */
	public String getIdClient() {
		return idClient;
	}

	/**
	 * @param idClient
	 *            the idClient to set
	 */
	public void setIdClient(String idClient) {
		this.idClient = idClient;
	}

	/**
	 * @return the idRecord
	 */
	public String getIdRecord() {
		return idRecord;
	}

	/**
	 * @param idRecord
	 *            the idRecord to set
	 */
	public void setIdRecord(String idRecord) {
		this.idRecord = idRecord;
	}
	/**
	 * @return the sizeInKb
	 */
	public long getSizeInKb() {
		return sizeInKb;
	}
	
	/**
	 * @param sizeInKb the sizeInKb to set
	 */
	public void setSizeInKb(long sizeInKB) {
		this.sizeInKb = sizeInKB;
	}
}
