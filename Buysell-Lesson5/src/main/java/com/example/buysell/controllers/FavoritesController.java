package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.FavoritesService;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class FavoritesController {
    private final FavoritesService favoritesService;
    private final UserService userService;
    private final ProductService productService;
    @GetMapping("/favorites/{id}")
    public String favoritesProduct(Model model, @PathVariable Long id, Principal principal){

        Product product = productService.getProductById(id);

        User user=userService.getUserByPrincipal(principal);
        favoritesService.addProductToFavorites(product,user);

        return "redirect:/";
    }
    //@PostMapping("/favorites/delete/{id}")
    @GetMapping("/favorites/delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id, Principal principal){
        /*favoritesService.removedProductFromFavorites(id,  principal );*/
        /*favoritesService.removedProductFromFavorites(id,userService.getUserByPrincipal(principal).getFavorites());*/
        favoritesService.removedProductFromFavorites( productService.getProductById(id),
                userService.getUserByPrincipal(principal).getFavorites());

        return "redirect:/";
    }
}
