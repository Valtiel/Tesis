package net.webapplication.model;

import org.hibernate.validator.constraints.NotEmpty;

public class User {

    @NotEmpty(message = "El nombre del usuario es un requisito")
    private String name = null;
    @NotEmpty(message = "La educación es un requisito")
    private String education = null;

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
     * @return the education
     */
    public String getEducation() {
        return education;
    }

    /**
     * @param education the education to set
     */
    public void setEducation(String education) {
        this.education = education;
    }
}
