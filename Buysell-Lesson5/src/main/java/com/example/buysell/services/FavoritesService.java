package com.example.buysell.services;

import com.example.buysell.models.Favorites;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.FavoritesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@Slf4j
@RequiredArgsConstructor
public class FavoritesService {
    private final UserService userService;
    private final ProductService productService;
    private final FavoritesRepository favoritesRepository;
    public void addProductToFavorites(Product product, User user){

        if(user!=null){
            System.out.println("email: " + user.getPhoneNumber());
            System.out.println("title: " + product.getTitle());
            user.getFavorites().getProducts().add(product);
            product.getFavorites().add(user.getFavorites());

            log.info("new Product - User: {} - {}",user.getPhoneNumber(),product.getTitle());
            favoritesRepository.save(user.getFavorites());
            userService.saveUser(user);
        }
    }
    public void removedProductFromFavorites(Product product, Favorites favorites){
        product.getFavorites().remove(favorites);
        favorites.getProducts().remove(product);

        log.info("remove Product - User: {} - {}",favorites.getUser().getPhoneNumber(),product.getTitle());
        favoritesRepository.save(favorites);
        userService.saveUser(favorites.getUser());
    }
    public void removedProductFromFavorites(Long productId, Favorites favorites){
        Product product = productService.getProductById(productId);
        favorites.getProducts().remove(product);
        log.info("remove Product - User: {} - {}",favorites.getUser().getPhoneNumber(),product.getTitle());
        favoritesRepository.save(favorites);
    }
    public void removedProductFromFavorites(Long productId, Principal principal ){
        Favorites favorites=userService.getUserByPrincipal(principal).getFavorites();
        Product product = productService.getProductById(productId);
        /*product.getFavorites().remove(favorites);*/
        favorites.getProducts().remove(product);
        log.info("remove Product - User: {} - {}",favorites.getUser().getPhoneNumber(),product.getTitle());
        favoritesRepository.save(favorites);

    }


}
