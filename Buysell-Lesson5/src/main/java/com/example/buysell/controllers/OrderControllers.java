package com.example.buysell.controllers;

import com.example.buysell.models.OrderBuying;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.OrderBuyingService;
import com.example.buysell.services.OrderQuestionServices;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class OrderControllers {

    private final OrderBuyingService orderBuyingService;
    private final OrderQuestionServices orderQuestionServices;


    @PostMapping("/order/Buying/{id}")
    public String createOrderBuying( @PathVariable Long id, Principal principal){
        System.out.println("Мы в Заропсе!!!!!!!");
       orderBuyingService.save(principal,id);
        return "redirect:/product/{id}";
    }
    @PostMapping("/order/Question")
    public String createOrderQuestion(@RequestParam("phoneNumber") String phoneNumber,
                              @RequestParam("userName") String userName,
                              HttpServletRequest request){
        orderQuestionServices.save(phoneNumber,userName);
        String refererUrl = request.getHeader("referer");
        System.out.println("current Url = " + refererUrl);
        return "redirect:" + refererUrl;

    }
}
