
package net.webapplication.controller;

import javax.validation.Valid;

import net.webapplication.dao.RelationClientDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationClientMedic;
import net.webapplication.model.RelationClientProblem;

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
@RequestMapping(value = "/relationClient")
public class RelationClientController {
    
    @Autowired
    RelationClientDAO relationClientDAO;

    public void setRelationClientDAO(RelationClientDAO relationClientDAO) {
        this.relationClientDAO = relationClientDAO;
    }
    
    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addRelationClientInstitution(@ModelAttribute(value = "relationClientInstitution") RelationClientInstitution clientInstitution,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                relationClientDAO.addRelationInstitution(clientInstitution);
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
        res.setResult(clientInstitution);
        return res;
    }
    @RequestMapping(value = "/addr.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addRelationClientMedic(@ModelAttribute(value = "relationClientMedic") RelationClientMedic clientMedic,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                relationClientDAO.addRelationMedic(clientMedic);
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
        res.setResult(clientMedic);
        return res;
    }

    @RequestMapping(value = "/deleteProblem={idProblem}/fromClient={idClient}", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse deleteProblemFromClient(@PathVariable String idProblem,@PathVariable String idClient) {
    	
		JsonResponse res = new JsonResponse();
		try {
			relationClientDAO.deleteRelationProblem(new RelationClientProblem(idProblem, idClient));
			
		} catch (NumberFormatException e) {
			res.setStatus("FAIL");
			res.setText("Alguno de los datos suministrados no posee el formato correcto (número entero).");
			return res;
		}catch(IncorrectResultSizeDataAccessException e){
			res.setStatus("FAIL");
			res.setText("No existe un registro con esa identificación");
			return res;
		}catch (Exception e) {
			res.setStatus("FAIL");
			res.setText("Ha ocurrido un error interno del sistema, por favor contacte con los administradores.");
			e.printStackTrace();
			return res;
		}
		res.setStatus("SUCCESS");
		res.setText("El proceso ha culminado con éxito :)");
		return res;
    }
    
    @RequestMapping(value = "/addProblemClientRelation", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addRelationClientProblem(@Valid @ModelAttribute(value = "relationClientProblem") RelationClientProblem clientProblem,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                relationClientDAO.addRelationProblem(clientProblem);
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
        res.setResult(clientProblem);
        return res;
    }
    
}
