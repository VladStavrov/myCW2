package com.example.buysell.controllers;

import com.example.buysell.models.User;
import com.example.buysell.services.OrderBuyingService;
import com.example.buysell.services.OrderQuestionServices;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
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
    private final UserService userService;

    @PostMapping("/order/Buying/{id}")
    public String createOrderBuying(@PathVariable Long id, Principal principal) {
        orderBuyingService.save(principal, id);
        return "redirect:/product/{id}";
    }

    @PostMapping("/order/Question")
    public String createOrderQuestion(
            @RequestParam("phoneNumber")
            String phoneNumber,
            @RequestParam("userName")
            String userName,
            HttpServletRequest request
    ) {
        orderQuestionServices.save(phoneNumber, userName);
        String refererUrl = request.getHeader("referer");
        System.out.println("current Url = " + refererUrl);
        return "redirect:" + refererUrl;

    }

    @GetMapping("/order/Buying/view")
    public String viewOrderBuying(Model model, Principal principal) {
        model.addAttribute("orders", orderBuyingService.getOrdersBuying());
        User user = userService.getUserByPrincipal(principal);
        if (user == null) {
            user = new User();
        }
        model.addAttribute("user", user);

        return "orderBuying2";
    }

    @PostMapping("/order/Buying/changeStatus/{id}")
    public String changeStatusBuying(@RequestParam("status") String status, @PathVariable Long id) {
        System.out.println("Зашлоооооооо");
        orderBuyingService.changeStatus(id, status);
        System.out.println("Вышлооооо");
        return "redirect:/order/Buying/view";

    }

    @PostMapping("/order/Buying/delete/{id}")
    public String deleteOrderBuying(@PathVariable Long id) {
        orderBuyingService.deleteOrder(id);
        return "redirect:/order/Buying/view";
    }


    @GetMapping("/order/Question/view")
    public String viewOrderQuestion(Model model, Principal principal) {

        model.addAttribute("orders", orderQuestionServices.getOrdersQuestions());
        User user = userService.getUserByPrincipal(principal);
        if (user == null) {
            user = new User();
        }
        model.addAttribute("user", user);

        return "orderQuestion2";
    }

    @PostMapping("/order/Question/changeStatus/{id}")
    public String changeStatusQuestion(@RequestParam("status") String status, @PathVariable Long id) {
        System.out.println("Зашлоооооооо");
        orderQuestionServices.changeStatus(id, status);
        System.out.println("Вышлооооо");
        return "redirect:/order/Question/view";
    }

    @PostMapping("/order/Question/delete/{id}")
    public String deleteOrderQuestion(@PathVariable Long id) {
        orderQuestionServices.deleteOrder(id);
        return "redirect:/order/Question/view";
    }
}
