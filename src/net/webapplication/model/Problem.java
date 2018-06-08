package net.webapplication.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Problem {

    @NotNull(message = "El id del problema es un requisito")
    @NotEmpty(message = "El id del problema es un requisito")
    @Pattern(message = "El número CIE no tiene el patrón correcto",
    regexp = "^[a-zA-Z]\\d{2}(\\.\\d{1,3}){0,1}$")
    private String idProblem;
    @NotEmpty(message = "La descripción es un requisito")
    @Length(max = 250)
    private String description;

    /**
     * @return the idProblem
     */
    public String getIdProblem() {
        return idProblem;
    }

    /**
     * @param idProblem the idProblem to set
     */
    public void setIdProblem(String idProblem) {
        this.idProblem = idProblem;
    }
    
    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
