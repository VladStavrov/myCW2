package com.example.buysell.services;

import com.example.buysell.models.Favorites;
import com.example.buysell.models.Product;
import com.example.buysell.models.Role;
import com.example.buysell.models.User;

import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail) != null) return false;
        user.setActive(true);
        Favorites favorites = new Favorites();
        favorites.setUser(user);
        user.setFavorites(favorites);

        user.getRoles().add(Role.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }
    public void saveUser(User user){
        log.info("Saving new User with email: {}", user.getEmail());
        userRepository.save(user);

    }

    public User getUserByPrincipal(Principal principal) {
        if(principal==null) return null;
        return userRepository.findByEmail(principal.getName());
    }
    public User  getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
}
