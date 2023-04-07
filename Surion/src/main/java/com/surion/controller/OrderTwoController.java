package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order2/*")
public class OrderTwoController {
    @RequestMapping("/orderList")
    public String orderList() {
        return "/order2/orderList";
    }

    @RequestMapping("/transaction")
    public String transaction() {
        return "/order2/transaction";
    }

    @RequestMapping("/repairForm")
    public String repairForm() {
        return "/order2/repairForm";
    }

}
