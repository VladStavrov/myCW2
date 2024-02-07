package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("products", productService.getProductList(title));
        User user = userService.getUserByPrincipal(principal);
        if (user == null) {
            user = new User();
        }
        model.addAttribute("user", user);
        return "catalog2";
    }

    @GetMapping("/mainPage")
    public String mainPage(Model model, Principal principal) {

        User user = userService.getUserByPrincipal(principal);
        if (user == null) {
            user = new User();
        }
        model.addAttribute("user", user);
        return "mainPage";
    }


    @GetMapping("/product/{id}")
    public String productInfo(Model model, @PathVariable Long id, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        if (user == null) {
            user = new User();
        }
        model.addAttribute("user", user);
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImageList());
        return "realEstatePage2";
    }
}

