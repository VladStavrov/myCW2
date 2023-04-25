package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class ProductController {
    /*@Autowired
    private TypeRepository typeRepository;*/
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name="title",required = false) String title, Model model) {
        model.addAttribute("products",productService.getProductList(title));
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
    public String createProduct(@RequestParam("files")  ArrayList<MultipartFile> files, Product product) {
       /* System.out.println("Product: " + product);
        System.out.println("Files: " + files);
        System.out.println("size= " );*/
        try {
            productService.saveProduct(product,files);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }
    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "catalog2";
    }
}

