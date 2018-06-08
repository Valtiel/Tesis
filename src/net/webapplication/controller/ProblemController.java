package net.webapplication.controller;

import java.util.List;


import net.webapplication.dao.ProblemDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.Problem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
@RequestMapping(value = "/problem")
public class ProblemController {

    @Autowired
    ProblemDAO problemDAO;

    public void setProblemDAO(ProblemDAO problemDAO) {
        this.problemDAO = problemDAO;
    }
/*
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addProblem(
            @Valid @ModelAttribute(value = "problem") Problem problem,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
        	 try {
                 problemDAO.create(problem);
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
        res.setResult(problem);
        return res;
    }
    */
    
    @RequestMapping(value = "idProblem={id}", method = RequestMethod.GET)
	public @ResponseBody
	JsonResponse getClient(@PathVariable String id) {
		int idNumber;
		JsonResponse res = new JsonResponse();
		try {
			idNumber = Integer.parseInt(id);
			Problem p = problemDAO.getProblem(idNumber);
			if(p.getIdProblem()!=null || !p.getIdProblem().equals("")){
				res.setStatus("SUCCESS");
				res.setText("La consulta se ha realizado con éxito");
				res.setResult(p);
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
    
    @RequestMapping(value = "/getProblems/client={id}", method = RequestMethod.GET)
    public @ResponseBody
    JsonResponse getProblemsByClientId(@PathVariable String id) {
    	int idNumber;
		JsonResponse res = new JsonResponse();
		try {
			idNumber = Integer.parseInt(id);
			List<Problem> problems=problemDAO.getProblemsById(idNumber);
			if(problems!=null){
				res.setStatus("SUCCESS");
				res.setText("La consulta se ha realizado con éxito");
				res.setResult(problems);
				return res;
			}else{
				res.setStatus("FAIL");
				res.setText("Hubo un problema en la consulta");
				return res;
			}
		} catch (NumberFormatException e) {
			res.setStatus("FAIL");
			res.setText("El id del Cliente no posee el formato correcto (número entero).");
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
   
  }
