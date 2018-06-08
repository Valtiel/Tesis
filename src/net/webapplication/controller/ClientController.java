package net.webapplication.controller;

import javax.validation.Valid;

import net.webapplication.dao.ClientDAO;
import net.webapplication.model.Client;
import net.webapplication.model.TableJsonResponse;
import net.webapplication.model.JsonResponse;

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
@RequestMapping(value = "/client")
public class ClientController {

	@Autowired
	ClientDAO clientDAO;

	public void setClientDAO(ClientDAO clientDAO) {
		this.clientDAO = clientDAO;
	}

	@RequestMapping(value = "/add.htm", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addClient(@Valid @ModelAttribute(value = "client") Client client,
			BindingResult result) {
		JsonResponse res = new JsonResponse();
		if (!result.hasErrors()) {
			try {
				clientDAO.create(client);
				res.setStatus("SUCCESS");
			} catch (Exception e) {
				if (e instanceof DuplicateKeyException) {
					res.setStatus("FAIL");
					res.setText("El registro ya existe en la Base de Datos");
				}
				e.printStackTrace();
			}

		} else {
			res.setStatus("FAIL");
			for (ObjectError e : result.getAllErrors()) {
				res.setText(e.getDefaultMessage());
			}

		}
		res.setResult(client);
		return res;
	}

	@RequestMapping(value = "user={id}", method = RequestMethod.GET)
	public @ResponseBody
	JsonResponse getClient(@PathVariable String id) {
		int idNumber;
		JsonResponse res = new JsonResponse();
		try {
			idNumber = Integer.parseInt(id);
			Client c = clientDAO.getClient(idNumber);
			if(c.getFirstName()!=null || !c.getFirstName().equals("")){
				res.setStatus("SUCCESS");
				res.setText("La consulta se ha realizado con éxito");
				res.setResult(c);
				return res;
			}else{
				res.setStatus("FAIL");
				res.setText("No existe un registro con esa identificación");
				return res;
			}
		} catch (NumberFormatException e) {
			res.setStatus("FAIL");
			res.setText("No ha ingresado el valor correcto");
			return res;
		}catch(IncorrectResultSizeDataAccessException e){
			res.setStatus("FAIL");
			res.setText("No existe un registro con esa identificación");
			return res;
		}catch (Exception e) {
			res.setStatus("FAIL");
			res.setText("Ha ocurrido un error interno del sistema, por favor contacte con los administradores.");
			return res;
		}
	}

	@RequestMapping(value = "/listAll.htm", method = RequestMethod.GET)
	public @ResponseBody
	TableJsonResponse<Client> listAll() {
		TableJsonResponse<Client> res = new TableJsonResponse<>();
		res.setAaData(clientDAO.listClient());
		return res;
	}
}