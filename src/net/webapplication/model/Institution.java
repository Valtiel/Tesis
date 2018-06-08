package net.webapplication.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Institution {

    @NotEmpty(message = "El Rif es un requisito")
    //@Pattern(regexp = "^\\d{8}-\\d$")
    private String idInstitution;
    @NotEmpty(message = "El nombre es un requisito")
    private String name;
    @NotEmpty(message = "La dirección es un requisito")
    private String address;
    @NotEmpty(message = "La dirección Web es necesaria")
    @URL(message = "La URL no es válida")
    private String webPage;
    //@Length(max = 10, min = 10, message = "El número de teléfono no es válido, su longitud deberá ser de 11 Dígitos.")
    @NotNull(message = "El teléfono es un requisito")
    @NumberFormat(style = Style.NUMBER)
    private String phoneNumber;

    /**
     * @return the idInstitution
     */
    public String getIdInstitution() {
        return idInstitution;
    }

    /**
     * @param idInstitution the idInstitution to set
     */
    public void setIdInstitution(String idInstitution) {
        this.idInstitution = idInstitution;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
     * @return the webPage
     */
    public String getWebPage() {
        return webPage;
    }

    /**
     * @param webPage the webPage to set
     */
    public void setWebPage(String webPage) {
        this.webPage = webPage;
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
}
