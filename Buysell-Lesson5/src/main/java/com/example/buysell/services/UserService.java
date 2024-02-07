package com.example.buysell.services;

import com.example.buysell.models.Favorites;
import com.example.buysell.models.Role;
import com.example.buysell.models.User;

import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.regex.Pattern;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final FavoritesService favoritesService;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;


    public boolean createUser(User user) {
        String userPhoneNumber = user.getPhoneNumber();
        if (userRepository.findByPhoneNumber(userPhoneNumber) != null) return false;
        user.setActive(true);
        Favorites favorites = new Favorites();
        favorites.setUser(user);
        user.setFavorites(favorites);

        user.getRoles().add(Role.ROLE_USER);

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with phoneNumber: {}", userPhoneNumber);
        userRepository.save(user);
        return true;
    }

    public static boolean validateName(String name) {
        String pattern = "^[А-Яа-я\\s-]{2,30}$";
        return Pattern.matches(pattern, name);
    }

    public static boolean validatePhoneNumber(String number) {
        String pattern = "^\\+375(44|33|29)\\d{7}$";
        return Pattern.matches(pattern, number);
    }

    public static boolean validatePassword(String password) {
        String pattern = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d!@#$%^&*()]{8,20}$";
        return Pattern.matches(pattern, password);
    }

    public String validateUser(User user) {
        if (!validateName(user.getName())) {
            return "Неккоректное имя";
        }
        if (!validatePhoneNumber(user.getPhoneNumber())) {
            return "Неккоректный номер телефона";
        }
        if (!validatePassword(user.getPassword())) {
            return "Неккоректный пароль";
        }

        return null;
    }

    public Set<Role> getArrayRoles(String role) {
        Set<Role> roles = new HashSet<>();
        roles.add(Role.ROLE_USER);
        System.out.println("Role = " + role);
        if (role.equals("ROLE_MANAGER")) {
            roles.add(Role.ROLE_MANAGER);
        } else if (role.equals("ROLE_ADMIN")) {
            roles.add(Role.ROLE_MANAGER);
            roles.add(Role.ROLE_ADMIN);
        }
        return roles;

    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return null;
        return userRepository.findByPhoneNumber(principal.getName());
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public List<User> userList() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}, phoneNumber: {}", user.getId(), user.getPhoneNumber());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}, phoneNumber: {}", user.getId(), user.getPhoneNumber());
            }

        }
        assert user != null;
        userRepository.save(user);
    }

    public void changeUserRoles(Long userId, String roleName) {
        User user = getUserById(userId);
        user.setRoles(getArrayRoles(roleName));

        userRepository.save(user);
    }

    public void editUser(Long id, User user) {
        User oldUser = getUserById(id);
        System.out.println("password= " + user.getPassword());
        System.out.println("oldPassword= " + oldUser.getPassword());
        oldUser.setName(user.getName());
        oldUser.setPhoneNumber(user.getPhoneNumber());
        if (!(user.getPassword().isEmpty())) {
            oldUser.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        userRepository.save(oldUser);
    }

    public void deleteUser(Long id) {
        User user = getUserById(id);

        user.getFavorites().getProducts().clear();
        favoritesService.saveFavorites(user.getFavorites());

        userRepository.deleteById(id);
    }
}
