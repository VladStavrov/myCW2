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
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
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
        user.getRoles().add(Role.ROLE_MANAGER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with phoneNumber: {}", userPhoneNumber);
        userRepository.save(user);
        return true;
    }
    public void saveUser(User user){
        log.info("Saving new User with phoneNumber: {}", user.getPhoneNumber());
        userRepository.save(user);

    }

    public User getUserByPrincipal(Principal principal) {
        if(principal==null) return null;
        return userRepository.findByPhoneNumber(principal.getName());
    }
    public User  getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
    public List<User> userList(){
        return userRepository.findAll();

    }

    public void banUser(Long id) {
       User user = userRepository.findById(id).orElse(null);
       if(user!=null){
           if(user.isActive()){
               user.setActive(false);
               log.info("Ban user with id = {}, phoneNumber: {}",
                       user.getId(),user.getPhoneNumber() );
           }
           else{
               user.setActive(true);
               log.info("Unban user with id = {}, phoneNumber: {}",
                       user.getId(),user.getPhoneNumber() );
           }



       }
       userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
