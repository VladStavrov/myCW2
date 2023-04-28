package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.UserRepository;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class ProductController {
    /*@Autowired
    private TypeRepository typeRepository;*/
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name="title",required = false) String title, Model model, Principal principal) {
        model.addAttribute("products",productService.getProductList(title));
        User user= userService.getUserByPrincipal(principal);
        if(user==null){
            user=new User();
        }
        model.addAttribute("user",user);
       /* model.addAttribute("user",userService.getUserByPrincipal(principal));*/
        return "products";
    }
    /*@GetMapping("/admin")
    public String admin( Model model) {
        System.out.println("Admin");
        return "admin";
    }*/

    @GetMapping("/product/{id}")
    public String productInfo(Model model, @PathVariable Long id){
        Product product = productService.getProductById(id);
        model.addAttribute("product",product);
        model.addAttribute("images",product.getImageList());
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("files")  ArrayList<MultipartFile> files, Product product) throws IOException {
        System.out.println("Product: " + product);
        System.out.println("Files: " + files);
        System.out.println("size= " + files.size());

            productService.saveProduct(product,files);

        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "catalog2";
    }
}

