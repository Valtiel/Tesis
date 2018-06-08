package net.webapplication.controller;

import javax.validation.Valid;
import net.webapplication.dao.PrescriptionDAO;
import net.webapplication.model.JsonResponse;
import net.webapplication.model.Prescription;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
@RequestMapping(value = "/prescription")
public class PrescriptionController {

    @Autowired
    PrescriptionDAO prescriptionDAO;

    public void setPrescriptionDAO(PrescriptionDAO prescriptionDAO) {
        this.prescriptionDAO = prescriptionDAO;
    }

    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public @ResponseBody
    JsonResponse addPrescription(
            @Valid @ModelAttribute(value = "prescription") Prescription prescription,
            BindingResult result) {
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            res.setStatus("SUCCESS");
        } else {
            res.setStatus("FAIL");
        }
        res.setResult(prescription);
        return res;
    }
}
