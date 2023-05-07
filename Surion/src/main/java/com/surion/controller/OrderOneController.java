package com.surion.controller;

import com.surion.domain.mechanic.Mechanic;
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

    private final MechanicService mechanicService;

    @GetMapping("/detail/{mechanic_id}")
    public String orderdetail(@PathVariable String mechanic_id, Model model){
        Mechanic mechanic = mechanicService.findById(mechanic_id);
        model.addAttribute("mechanic", mechanic);
        return "/order1/productdetail";
    }

    @GetMapping("/map")
    public String mapTest(){
        return "/map/map";
    }

}
