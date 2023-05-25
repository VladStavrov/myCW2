package com.example.buysell.controllers;

import com.example.buysell.models.User;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
/*import org.springframework.ui.Model;*/
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
    public String login(Model model, @RequestParam (name = "error",required = false) String errorMessage){

        if(errorMessage!=null){
            System.out.println(errorMessage);
            System.out.println(" ПРикол");
            model.addAttribute("errorMessage","Неверный логин или пароль");
        }
        /*User user= userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        if (user != null && !user.isActive()) {
            System.out.println("user was banned");
            model.addAttribute("errorMessage", "Ваш аккаунт заблокирован");

        }*/
        return "login2";
    }


   /*@PostMapping("/login")
public String login(@RequestParam("phoneNumber") String phoneNumber, @RequestParam("password") String password, Model model) {

    User user = userService.findByPhoneNumber(phoneNumber);

    if (user != null) {
        if (userService.isPasswordEquals(password,user.getPassword())) {
            if (user.isActive()) {
                return "redirect:/mainPage"; // Исправьте путь на соответствующий
            } else {
                model.addAttribute("errorMessage", "Пользователь заблокирован");
                return "login";
            }
        } else {
            model.addAttribute("errorMessage", "Неверный номер телефона или пароль1");
            return "login";
        }
    } else {
        model.addAttribute("errorMessage", "Неверный номер телефона или пароль2");
        return "login";
    }
}
  */ @PostMapping("/logout")
    public String logout(){

        return "redirect:/";
    }
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user,  Model model){
        String errorMassage=null;
        errorMassage=userService.validateUser(user);
        if(errorMassage!=null) {
            model.addAttribute("errorMessage",errorMassage);
            return "registration";

        }
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage","Пользователь с такик Номером Телефона уже существует");
            return "registration";
        }

        return "redirect:/login";
    }
    @PostMapping("/hello")
    public String sequrityUrl(){
        return "hello";
    }

    @PostMapping("/admin/edit/{id}")
    public String userEdit(@PathVariable Long id,
                           User user,
                           HttpServletRequest request){

        String refererUrl = request.getHeader("referer");
        System.out.println("current Url = " + refererUrl);

        userService.editUser(id,user);
        return "redirect:" + refererUrl;



    }

}
