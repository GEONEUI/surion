package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order1/*")
public class OrderOneController {

    @GetMapping("/detail")
    public String orderdetail(Model model){
        return "/order1/productdetail";
    }

}
