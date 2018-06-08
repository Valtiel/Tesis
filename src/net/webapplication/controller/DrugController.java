package net.webapplication.controller;

import javax.validation.Valid;

import net.webapplication.dao.DrugDAO;
import net.webapplication.model.Drug;
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
@RequestMapping(value = "/drug")
public class DrugController {

    @Autowired
    DrugDAO drugDAO;

    public void setDrugDAO(DrugDAO drugDAO) {
        this.drugDAO = drugDAO;
    }

    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addDrug(@Valid @ModelAttribute(value = "drug") Drug drug,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                drugDAO.create(drug);
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
        res.setResult(drug);
        return res;
    }

    @RequestMapping(value = "/listAll.htm", method = RequestMethod.GET)
    public @ResponseBody
    TableJsonResponse<Drug> listAll() {
        TableJsonResponse<Drug> res = new TableJsonResponse<>();
        res.setAaData(drugDAO.listDrug());
        return res;
    }
}
