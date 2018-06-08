package net.webapplication.controller;

import java.util.List;

import javax.validation.Valid;

import net.webapplication.dao.NoteDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.Note;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
@RequestMapping(value = "/note")
public class NoteController {

	@Autowired
	NoteDAO noteDAO;

	public void setNoteDAO(NoteDAO noteDAO) {
		this.noteDAO = noteDAO;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addNote(@Valid @ModelAttribute(value = "note") Note note,
			BindingResult result) {
		JsonResponse res = new JsonResponse();
		if (!result.hasErrors()) {
			try {
				noteDAO.create(note);
				res.setStatus("SUCCESS");
			} catch (Exception e) {
				if (e instanceof DuplicateKeyException) {
					res.setStatus("FAIL");
					res.setText("El registro ya existe en la Base de Datos");
				}
			}
		} else {
			res.setStatus("FAIL");
			for (ObjectError e : result.getAllErrors()) {
				res.setText(e.getDefaultMessage());
			}
		}
		res.setResult(note);
		return res;
	}
	
	@RequestMapping(value = "/deleteNote={id}", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse deleteNote(@PathVariable String id) {
		JsonResponse res = new JsonResponse();
		int idNumber;
		try{
			idNumber = Integer.parseInt(id);
			noteDAO.delete(idNumber);
			
		}catch(NumberFormatException e){
			res.setStatus("FAIL");
			res.setText("El id de la nota a borrar no posee el formato correcto (número entero).");
			return res;
		}
		res.setStatus("SUCCESS");
		res.setText("El registro se ha completado con éxito :)");
		return res;
	}

	@RequestMapping(value = "/getNotes/client={id}", method = RequestMethod.GET)
	public @ResponseBody
	JsonResponse getNotesByClientId(@PathVariable String id) {
		int idNumber;
		JsonResponse res = new JsonResponse();
		try {
			idNumber = Integer.parseInt(id);
			List<Note> notes = noteDAO.getNoteList(idNumber);
			if (notes != null) {
				res.setStatus("SUCCESS");
				res.setText("La consulta se ha realizado con éxito");
				res.setResult(notes);
				return res;
			} else {
				res.setStatus("FAIL");
				res.setText("Hubo un problema en la consulta");
				return res;
			}
		} catch (NumberFormatException e) {
			res.setStatus("FAIL");
			res.setText("El id del Cliente no posee el formato correcto (número entero).");
			return res;
		} catch (IncorrectResultSizeDataAccessException e) {
			res.setStatus("FAIL");
			res.setText("No existe un registro con esa identificación");
			return res;
		} catch (Exception e) {
			res.setStatus("FAIL");
			res.setText("Ha ocurrido un error interno del sistema, por favor contacte con los administradores.");
			return res;
		}
	}
}
