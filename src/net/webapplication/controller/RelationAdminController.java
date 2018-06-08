package net.webapplication.controller;

import net.webapplication.dao.RelationAdminDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationMedicInstitution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
@RequestMapping(value = "/relationAdmin")
public class RelationAdminController {
    
    @Autowired
    RelationAdminDAO relationAdminDAO;

    public void setRelationAdminDAO(RelationAdminDAO relationAdminDAO) {
        this.relationAdminDAO = relationAdminDAO;
    }
    
    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addRelationAdminMedic(@ModelAttribute(value = "relationAdminMedic") RelationMedicInstitution medicInstitution,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                relationAdminDAO.addRelationMedic(medicInstitution);
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
        res.setResult(medicInstitution);
        return res;
    }
    
    @RequestMapping(value = "/addr.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addRelationAdminClient(@ModelAttribute(value = "relationAdminClient") RelationClientInstitution clientInstitution,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                relationAdminDAO.addRelationClient(clientInstitution);
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
}
