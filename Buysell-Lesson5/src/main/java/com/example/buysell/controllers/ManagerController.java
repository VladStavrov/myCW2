package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_MANAGER')")
public class ManagerController {
    private final ProductService productService;
    private final UserService userService;
    @GetMapping("/manager")
    public String admin(@RequestParam(name="title",required = false) String title, Model model, Principal principal) {
        model.addAttribute("products",productService.getProductList(title));
        User user= userService.getUserByPrincipal(principal);
        if(user==null){
            user=new User();
        }
        model.addAttribute("user",user);
        /* model.addAttribute("user",userService.getUserByPrincipal(principal));*/
        return "products";
    }
    @PostMapping("/product/create")
    public String createProduct(@RequestParam("files") ArrayList<MultipartFile> files,
                                @RequestParam("typeName") String typeName,
                                Product product

            /* , @RequestParam("type") String type*/) throws IOException {
        System.out.println("Product: " + product);
        System.out.println("Files: " + files);
        System.out.println("size= " + files.size());

        productService.saveProduct(product,files,typeName);

        return "redirect:/manager";
    }
    @PostMapping("/product/edit/{id}")
    public String editProduct(@PathVariable Long id,@RequestParam("files") ArrayList<MultipartFile> files,
                              @RequestParam (value = "inputNumberImageName", required = false)ArrayList<Long> numbersInputIds,
                              @RequestParam("typeName") String typeName,
                              Product product
            /* , @RequestParam("type") String type*/) throws IOException {

        System.out.println("Product: " + product);
        System.out.println("Files: " + files);
        System.out.println("size= " + files.size());


    productService.editProduct(id,product,files,typeName,numbersInputIds);


        return "redirect:/manager";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/manager";
    }

}
