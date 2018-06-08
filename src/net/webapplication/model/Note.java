package net.webapplication.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Note {

    @NumberFormat(style = Style.NUMBER)
    private String noteId;
    @NotEmpty(message = "El título es un requisito")
    private String noteTitle;
    @NotEmpty(message = "El contexto es un requisito")
    private String noteContext;
    @NotNull(message = "No se ha seleccionado un cliente.")
    @NotEmpty(message = "No se ha seleccionado un cliente.")
    @NumberFormat(style = Style.NUMBER)
    private String clientId;

    /**
     * @return the noteID
     */
    public String getNoteId() {
        return noteId;
    }

    /**
     * @param noteID the noteID to set
     */
    public void setNoteId(String noteID) {
        this.noteId = noteID;
    }

    /**
     * @return the noteTitle
     */
    public String getNoteTitle() {
        return noteTitle;
    }

    /**
     * @param noteTitle the noteTitle to set
     */
    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    /**
     * @return the noteContext
     */
    public String getNoteContext() {
        return noteContext;
    }

    /**
     * @param noteContext the noteContext to set
     */
    public void setNoteContext(String noteContext) {
        this.noteContext = noteContext;
    }

    /**
     * @return the clientId
     */
    public String getClientId() {
        return clientId;
    }

    /**
     * @param clientId the clientId to set
     */
    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
}
