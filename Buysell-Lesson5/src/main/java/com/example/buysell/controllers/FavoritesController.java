package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.FavoritesService;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class FavoritesController {
    private final FavoritesService favoritesService;
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/favorites/{id}")
    public String favoritesProduct(Model model, @PathVariable Long id, Principal principal) {

        Product product = productService.getProductById(id);

        User user = userService.getUserByPrincipal(principal);
        favoritesService.addProductToFavorites(product, user);
        user = userService.getUserById(user.getId());
        model.addAttribute("user", user);
        System.out.println("Конец 1 функции");
        return "redirect:/";
    }

    @PostMapping("/favorites/delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id, Principal principal) {
        User user = userService.getUserByPrincipal(principal);

        favoritesService.removedProductFromFavorites(productService.getProductById(id), user.getFavorites());
        user = userService.getUserById(user.getId());

        model.addAttribute("user", user);
        System.out.println("Конец 2 функции");

        return "redirect:/";
    }

    @PostMapping("/favorites2/{id}")
    public ResponseEntity<Boolean> changeFavorites(
            Model model,
            @PathVariable Long id,
            @RequestBody Map<String, Object> requestBody,
            Principal principal
    ) {
        Boolean isFavorite = (Boolean) requestBody.get("isFavorite");
        User user = userService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);

        if (user.getFavorites().getProducts().contains(product)) {
            favoritesService.removedProductFromFavorites(productService.getProductById(id), user.getFavorites());
            isFavorite = false;
        } else {
            favoritesService.addProductToFavorites(product, user);
            isFavorite = true;
        }

        user = userService.getUserById(user.getId());
        model.addAttribute("user", user);
        System.out.println(isFavorite + " = isFavorite");
        return ResponseEntity.ok(isFavorite);

    }

}
