package net.webapplication.controller;

import net.webapplication.model.Institution;
import net.webapplication.model.JsonResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes
public class MainController {
	
	    @RequestMapping(value="/testJSON.htm",method=RequestMethod.POST)
	    public @ResponseBody JsonResponse addUser(@ModelAttribute(value="institution") Institution institution, BindingResult result ){
	        JsonResponse res = new JsonResponse();
	        if(!result.hasErrors()){
	            res.setStatus("SUCCESS");
	        }else{
	            res.setStatus("FAIL");
	        }
	       res.setResult(institution);
	       return res;
	    }
}
