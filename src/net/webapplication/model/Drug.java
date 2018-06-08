package net.webapplication.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Drug {

    @NotEmpty(message = "El campo del número CAS es un requisito. Este número"
            + " representa el registro único del medicamento.")
    @Pattern(message = "El número CAS no tiene el patrón correcto",
            regexp = "^\\d{2,6}-\\d{2}-\\d$")
    private String idDrug;
    @NotEmpty(message = "El nombre es un requisito")
    private String drugName;

    /**
     * @return the drugName
     */
    public String getDrugName() {
        return drugName;
    }

    /**
     * @param drugName the drugName to set
     */
    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    /**
     * @return the idDrug
     */
    public String getIdDrug() {
        return idDrug;
    }

    /**
     * @param idDrug the idDrug to set
     */
    public void setIdDrug(String idDrug) {
        this.idDrug = idDrug;
    }
}
