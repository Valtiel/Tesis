package net.webapplication.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class RelationClientProblem {
	
    @NotNull(message = "El id del problema es un requisito")
    @NotEmpty(message = "El id del problema es un requisito")
    @Pattern(message = "El número CAS no tiene el patrón correcto",
    regexp = "^[a-zA-Z]\\d{2}(\\.\\d{1,3}){0,1}$")
    private String idProblem;
    
    @NotNull(message = "Existe un problema con el id del Cliente manejado"
    		+ " por el sistema en la sesión actual.")
    @NotEmpty(message = "Existe un problema con el id del Cliente manejado"
    		+ "por el sistema en la sesión actual.")
    @NumberFormat(style = Style.NUMBER)
    private String idClient;

    public RelationClientProblem(){
    	
    }
    public RelationClientProblem(String idProblem, String idClient) {
    	this.idProblem=idProblem;
    	this.idClient=idClient;
    }

	public String getIdProblem() {
        return idProblem;
    }

    public void setIdProblem(String idProblem) {
        this.idProblem = idProblem;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }
    
    
    
}
