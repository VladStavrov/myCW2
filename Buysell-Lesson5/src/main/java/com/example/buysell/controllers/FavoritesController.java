package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.FavoritesService;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
        user = userService.getUserById(user.getId()); // Получаем обновленную версию пользователя из базы данных
        model.addAttribute("user", user);
        System.out.println("Конец 1 функции");
        return "redirect:/";
    }
    //@PostMapping("/favorites/delete/{id}")
    @PostMapping("/favorites/delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id, Principal principal){
        /*favoritesService.removedProductFromFavorites(id,  principal );*/
        /*favoritesService.removedProductFromFavorites(id,userService.getUserByPrincipal(principal).getFavorites());*/
        User user =  userService.getUserByPrincipal(principal);
        user.setName("Пупсень");
        favoritesService.removedProductFromFavorites( productService.getProductById(id),
               user.getFavorites());
         user = userService.getUserById(user.getId()); // Получаем обновленную версию пользователя из базы данных

        model.addAttribute("user", user);
        System.out.println("Конец 2 функции");

        return "redirect:/";
    }
    @DeleteMapping("/favorites/delete/{id}")
    public String deleteProduct2(Model model, @PathVariable Long id, Principal principal){
        /*favoritesService.removedProductFromFavorites(id,  principal );*/
        /*favoritesService.removedProductFromFavorites(id,userService.getUserByPrincipal(principal).getFavorites());*/
        User user =  userService.getUserByPrincipal(principal);
        System.out.println("1) size = "+user.getFavorites().getProducts().size());
        favoritesService.removedProductFromFavorites( productService.getProductById(id),
                user.getFavorites());
        user = userService.getUserById(user.getId()); // Получаем обновленную версию пользователя из базы данных
        System.out.println("2) size = "+user.getFavorites().getProducts().size());
        model.addAttribute("user", user);
        System.out.println("Конец 2 функции");

        return "redirect:/";
    }


}
