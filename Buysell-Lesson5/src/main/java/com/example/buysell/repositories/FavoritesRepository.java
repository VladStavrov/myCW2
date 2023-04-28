package com.example.buysell.repositories;

import com.example.buysell.models.Favorites;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FavoritesRepository extends JpaRepository<Favorites,Long> {
}
