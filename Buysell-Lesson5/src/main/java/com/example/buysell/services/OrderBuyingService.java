package com.example.buysell.services;

import com.example.buysell.models.OrderBuying;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.OrderBuyingRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderBuyingService {
    private final OrderBuyingRepository orderBuyingRepository;
    private final UserService userService;
    private final ProductService productService;
    public List<OrderBuying> getOrdersBuying() {

        return orderBuyingRepository.findAll();
    }
    public OrderBuying getOrderBuyingById(Long id){
        return orderBuyingRepository.getById(id);
    }
    public void save(Principal principal, Long productId){
        System.out.println("Мы в функцииии!!!!!!!");
        User user= userService.getUserByPrincipal(principal);
        if(user!=null){
            log.info("user !=null");
        }

        Product product=productService.getProductById(productId);
        if(product!=null){
            log.info("product !=null");
        }
        OrderBuying orderBuying=new OrderBuying();
        user.getOrderBuyings().add(orderBuying);
        log.info("user add order ");
        product.getOrderBuyings().add(orderBuying);
        log.info("product add order ");
        orderBuying.setProduct(product);
        log.info("order ser product ");
        orderBuying.setUser(user);
        log.info("order set user ");

        orderBuying.setStatus("В ожидании");
        orderBuyingRepository.save(orderBuying);
    }


}
