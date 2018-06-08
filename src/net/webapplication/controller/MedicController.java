package net.webapplication.controller;

import javax.validation.Valid;

import net.webapplication.dao.MedicDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.Medic;

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
@RequestMapping(value = "/medic")
public class MedicController {

    @Autowired
    MedicDAO medicDAO;

    public void setMedicDAO(MedicDAO medicDAO) {
        this.medicDAO = medicDAO;
    }

    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addMedic(
            @Valid @ModelAttribute(value = "medic") Medic medic,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            try {
                medicDAO.create(medic);
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
                System.out.println(e.getDefaultMessage());
            }
        }
        res.setResult(medic);
        return res;
    }
}
