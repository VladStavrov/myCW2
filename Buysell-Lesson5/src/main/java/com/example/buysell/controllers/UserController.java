package com.example.buysell.controllers;

import com.example.buysell.models.User;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
/*import org.springframework.ui.Model;*/
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    @GetMapping("/profile")
    public  String profile(Principal principal,Model model){
        User user= userService.getUserByPrincipal(principal);
        if(user==null){
            user=new User();
        }
        model.addAttribute("user",user);
        return "personalAccountPage2";
    }



    @GetMapping("/login")
    public String login(){
        return "login2";
    }

    @PostMapping("/logout")
    public String logout(){
        return "redirect:/";
    }
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user,  Model model){
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с email"+user.getEmail()+" уже сущечтсвует");
            return "registration";
        }
        return "redirect:/login";
    }
    @PostMapping("/hello")
    public String sequrityUrl(){
        return "hello";
    }


}
