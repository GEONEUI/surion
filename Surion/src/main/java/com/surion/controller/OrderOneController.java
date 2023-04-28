package com.surion.controller;

import com.surion.domain.member.Mechanic;
import com.surion.service.MechanicService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order1/*")
@RequiredArgsConstructor
public class OrderOneController {

    private final MechanicService ms;

    @GetMapping("/detail/{mechanic_id}")
    public String orderdetail(@PathVariable long mechanic_id, Model model){
        Mechanic mechanic = ms.findOne(mechanic_id);
        model.addAttribute("mechanic", mechanic);
        return "/order1/productdetail";
    }

    @GetMapping("/map")
    public String mapTest(){
        return "/map/map";
    }
    
    @RequestMapping("/detail")
    public String detail() {
    	return "/order1/productdetail";
    }


}
