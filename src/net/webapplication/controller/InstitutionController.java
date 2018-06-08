package net.webapplication.controller;

import javax.validation.Valid;

import net.webapplication.dao.InstitutionDAO;
import net.webapplication.dao.jdbc.InstitutionJDBCTemplate;
import net.webapplication.model.Institution;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.TableJsonResponse;
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
@RequestMapping(value = "/institution")
public class InstitutionController {

    @Autowired
    InstitutionDAO institutionDAO;

    public void setInstitutionDAO(InstitutionJDBCTemplate institutionDAO) {
        this.institutionDAO = institutionDAO;
    }

    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addInstitution(
            @Valid @ModelAttribute(value = "institution") Institution institution,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            // Oberto was here
            try {
                institutionDAO.create(institution);
                res.setStatus("SUCCESS");
            } catch (Exception e) {
                if (e instanceof DuplicateKeyException) {
                    res.setStatus("Fail");
                    res.setText("El registro ya existe en la base de datos");

                }
            }

        } else {
            res.setStatus("FAIL");
            for (ObjectError e : result.getAllErrors()) {
                res.setText(e.getDefaultMessage());
            }
        }
        res.setResult(institution);
        return res;
    }

    @RequestMapping(value = "/listAll.htm", method = RequestMethod.GET)
    public @ResponseBody
    TableJsonResponse<Institution> listAll() {
        TableJsonResponse<Institution> res = new TableJsonResponse<>();
        res.setAaData(institutionDAO.listInstitution());
        return res;
    }
}
