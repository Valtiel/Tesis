package net.webapplication.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes
@RequestMapping(value = "/user")
public class UserController {

    @RequestMapping(value = "/clientView", method = RequestMethod.GET)
    public String showMedicPanel(ModelMap model, Principal principal) {
        String name = "NO_USER";
        if (principal != null) {
            name = principal.getName();
        }
        model.addAttribute("username", name);
        model.addAttribute("message", " Bienvenido. ");
        return "user/clientView";
    }
}
