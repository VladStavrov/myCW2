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

    public void save(Principal principal, Long productId) {

        User user = userService.getUserByPrincipal(principal);
        if (user != null) {
            log.info("user !=null");
        }

        Product product = productService.getProductById(productId);
        if (product != null) {
            log.info("product !=null");
        }
        OrderBuying orderBuying = new OrderBuying();
        assert user != null;
        user.getOrderBuyings().add(orderBuying);

        assert product != null;
        product.getOrderBuyings().add(orderBuying);

        orderBuying.setProduct(product);
        orderBuying.setAddress(product.getAddress());

        orderBuying.setUser(user);


        orderBuying.setStatus("В ожидании");
        orderBuyingRepository.save(orderBuying);
    }

    public void changeStatus(Long id, String status) {
        OrderBuying orderBuying = orderBuyingRepository.getById(id);
        orderBuying.setStatus(status);
        orderBuyingRepository.save(orderBuying);
    }

    public void deleteOrder(Long id) {
        orderBuyingRepository.deleteById(id);
    }
}
