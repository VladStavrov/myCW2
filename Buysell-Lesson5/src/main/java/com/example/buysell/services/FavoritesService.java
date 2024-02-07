package com.example.buysell.services;

import com.example.buysell.models.Favorites;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.FavoritesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class FavoritesService {

    private final FavoritesRepository favoritesRepository;

    public void addProductToFavorites(Product product, User user) {

        if (user != null) {
            System.out.println("email: " + user.getPhoneNumber());
            System.out.println("title: " + product.getTitle());
            user.getFavorites().getProducts().add(product);
            product.getFavorites().add(user.getFavorites());

            log.info("new Product - User: {} - {}", user.getPhoneNumber(), product.getTitle());
            favoritesRepository.save(user.getFavorites());
        }
    }

    public void removedProductFromFavorites(Product product, Favorites favorites) {
        product.getFavorites().remove(favorites);
        favorites.getProducts().remove(product);

        log.info("remove Product - User: {} - {}", favorites.getUser().getPhoneNumber(), product.getTitle());
        favoritesRepository.save(favorites);
    }

    public void saveFavorites(Favorites favorites) {
        favoritesRepository.save(favorites);
    }
}
