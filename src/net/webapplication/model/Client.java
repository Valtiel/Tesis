package net.webapplication.model;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Client {

    @NotNull(message = "La cédula es un requisito")
    @NotEmpty(message = "La cédula es un requisito")
    @NumberFormat(style = Style.NUMBER)
    private String idClient;
    @NotEmpty(message = "El nombre es un requisito")
    private String firstName;
    @NotEmpty(message = "El apellido es un requisito")
    private String lastName;
    @Past(message = "No es posible registrar una persona que no ha nacido.")
    private Date birthDate;
    @Length(max = 11, message = "El número de teléfono no es válido, su longitud deberá ser de 11 Dígitos.")
    @NotNull(message = "El teléfono es un requisito")
    @NumberFormat(style = Style.NUMBER)
    private String phoneNumber;
    @Email(message = "El Correo electrónico no tiene el formato requerido")
    @NotEmpty(message = "El correo electrónico es un requisito")
    private String email;
    @NotEmpty(message = "La dirección es un requisito")
    private String address;
    @NotEmpty(message = "El tipo de sangre es un requisito")
    private String bloodType;
    @NotEmpty(message = "El sexo es un requisito")
    private String sex;
    @NotEmpty(message = "La ocupación es un requisito")
    private String occupation;
    @NotEmpty(message = "La altura es un requisito")
    private String height;
    @NumberFormat(style = Style.NUMBER)
    private String contactId;
    @Length(max = 1, message = "La ciudadanía no tiene el formato correcto")
    @NotNull
    @NotEmpty
    private String citizenship;

    public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	/**
     * @return the bloodType
     */
    public String getBloodType() {
        return bloodType;
    }

    /**
     * @param bloodType the bloodType to set
     */
    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the birthDate
     */
    public Date getBirthDate() {
        return birthDate;
    }

    /**
     * @param birthDate the birthDate to set
     */
    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the occupation
     */
    public String getOccupation() {
        return occupation;
    }

    /**
     * @param occupation the occupation to set
     */
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    /**
     * @return the sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return the id
     */
    public String getIdClient() {
        return idClient;
    }

    /**
     * @param id the id to set
     */
    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    /**
     * @return the contactId
     */
    public String getContactId() {
        return contactId;
    }

    /**
     * @param contactId the contactId to set
     */
    public void setContactId(String contactId) {
        this.contactId = contactId;
    }

    /**
     * @return the weight
     */
    public String getHeight() {
        return height;
    }

    /**
     * @param weight the weight to set
     */
    public void setHeight(String height) {
        this.height = height;
    }
}
