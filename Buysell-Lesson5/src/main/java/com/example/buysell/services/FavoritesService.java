package com.example.buysell.services;

import com.example.buysell.controllers.FavoritesController;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.FavoritesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Principal;

@Service
@Slf4j
@RequiredArgsConstructor
public class FavoritesService {
    private final FavoritesRepository favoritesRepository;
    public void addProductToFavorites(Product product, User user){

        if(user!=null){
            System.out.println("email: " + user.getEmail());
            System.out.println("title: " + product.getTitle());
            user.getFavorites().getProducts().add(product);
            product.getFavorites().add(user.getFavorites());

            log.info("new Product - User: {} - {}",user.getEmail(),product.getTitle());
            favoritesRepository.save(user.getFavorites());
        }
    }

}
