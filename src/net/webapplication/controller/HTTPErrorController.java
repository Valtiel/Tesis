package net.webapplication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HTTPErrorController {

    @RequestMapping(value = "/errors/404.html")
    public ModelAndView handle404() {
        return new ModelAndView("errorTemplate");
    }
    
    @RequestMapping(value = "/errors/403.html")
    public ModelAndView handle403() {
        return new ModelAndView("403Template");
    }
}
