/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.webapplication.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.webapplication.dao.RecordDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.Record;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author Ponquesito
 */
@Controller
@SessionAttributes
@RequestMapping(value = "/records")
public class RecordController {

	@Autowired
	RecordDAO recordDAO;

	public void setRecordDAO(RecordDAO recordDAO) {
		this.recordDAO = recordDAO;
	}
	
	@RequestMapping(value = "/getListRecord={id}", method = RequestMethod.GET)
	public @ResponseBody
	JsonResponse getNotesByClientId(@PathVariable String id, Principal principal) {
		int idNumber;
		JsonResponse res = new JsonResponse();
		try {
			idNumber = Integer.parseInt(id);
			List<Record> records= recordDAO.getRecordList(idNumber, principal.getName());
			if (records != null) {
				res.setStatus("SUCCESS");
				res.setText("La consulta se ha realizado con éxito");
				res.setResult(records);
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
	

	@RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
	  public void get(HttpServletResponse response,@PathVariable String value, Principal principal){
	        try {
	        	
	        	Record record=recordDAO.getRecord(Integer.parseInt(value));
	            response.setContentLength((int)record.getBytes().length);
	            response.setContentType("application/octet-stream");
	            String headerKey = "Content-Disposition";
	            String headerValue = String.format("attachment; filename=\"%s\"",
	                    record.getFileName());
	            response.setHeader(headerKey, headerValue);
	            FileCopyUtils.copy(record.getBytes(), response.getOutputStream());
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	  }
	
	@RequestMapping(value = "/file.htm", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse upload(@RequestParam("archive") MultipartFile archive,
			@RequestParam("clientId") String inputClientId,
			@RequestParam("institutionId") String inputInstitutionId,
			Principal principal
			) throws IOException{
		JsonResponse res = new JsonResponse();
		System.out.println("Llegó el archivo y el record ="+inputInstitutionId);
		if (archive == null) {
			res.setStatus("FAIL");
			res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
			//u.setName("FAIL");
			return res;
		}
		String name = "NO_USER";
        if (principal != null) {
            name = principal.getName();
        }else{
        	res.setStatus("FAIL");
			res.setText("Disculpe: Al paracer no existe registro de su sesion, vuelva a inicializarla");
			//u.setName("FAIL");
			return res;
        }
        String inputMedicId=recordDAO.getMedicId(name);
        System.out.print(inputMedicId);
		Record record=new Record(archive.getBytes(), ""
				+ inputClientId, "" + inputInstitutionId, ""
				+ inputMedicId, archive.getOriginalFilename(),
				(archive.getSize()/1024));

		if (!hasErrors(record)) {
				try {
					recordDAO.insertFile(record);
				} catch (Exception e) {
					e.printStackTrace();
					res.setStatus("FAIL");
					res.setText("Disculpe: Hubo un problema en la subida del archivo.\nContacte a Soporte.");
					//u.setName("FAIL");
					return res;
				}
		} else {
			res.setStatus("FAIL");
			res.setText("Disculpe: El archivo no posee un formato soportado [XML, PDF, DOC");
			return res;
		}
		
		res.setStatus("SUCCESS");
		res.setText("Se ha completado la carga del archivo con éxito :)");
		//u.setName("FAIL");
		return res;
	}

	private boolean hasErrors(Record record) {
		// TODO Auto-generated method stub
		boolean asd = record.getFileName().endsWith(".pdf") 
				|| record.getFileName().endsWith(".xml")
				|| record.getFileName().endsWith(".doc");				
		return !asd;
	}
}
