package net.webapplication.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Medic {

    @NotNull(message = "La cédula es un requisito")
    @NumberFormat(style = Style.NUMBER)
    private String idMedic;
    @NotEmpty(message = "El nombre es un requisito")
    private String firstName;
    @NotEmpty(message = "El apellido es un requisito")
    private String lastName;
    @Length(max = 11, min = 11, message = "El número de teléfono no es válido, su longitud deberá ser de 11 Dígitos.")
    @NotNull(message = "El teléfono es un requisito")
    @NumberFormat(style = Style.NUMBER)
    private String phoneNumber;
    @NotEmpty(message = "El correo electrónico es un requisito")
    private String email;
    @NotEmpty(message = "La dirección es un requisito")
    private String address;
    @NotEmpty(message = "La dirección es un requisito")
    @Length(max = 10, message="El nombre de usuario no puede poseer mas de diez caracteres")
    private String username;
    @NotEmpty(message = "La dirección es un requisito")
    @Length(max = 45, message="El nombre de usuario no puede poseer mas de diez caracteres")
    private String password;
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
     * @return the idMedic
     */
    public String getIdMedic() {
        return idMedic;
    }

    /**
     * @param i the idMedic to set
     */
    public void setIdMedic(String idMedic) {
        this.idMedic = idMedic;
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
}
