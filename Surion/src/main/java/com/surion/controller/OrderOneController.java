package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order1/*")
public class OrderOneController {

    @GetMapping("/detail/{mechanic_id}")
    public String orderdetail(@PathVariable int mechanic_id, Model model){


        return "/order1/productdetail";
    }



}
