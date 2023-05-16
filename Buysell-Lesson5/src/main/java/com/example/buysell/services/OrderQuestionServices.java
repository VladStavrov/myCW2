package com.example.buysell.services;

import com.example.buysell.models.OrderBuying;
import com.example.buysell.models.OrderQuestion;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.OrderBuyingRepository;
import com.example.buysell.repositories.OrderQuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
@Service
@Slf4j
@RequiredArgsConstructor
public class OrderQuestionServices {
    private final OrderQuestionRepository orderQuestionRepository;

    public List<OrderQuestion> getOrdersQuestions() {

        return orderQuestionRepository.findAll();
    }
    public OrderQuestion getOrderQuestionById(Long id){
        return orderQuestionRepository.getById(id);
    }
    public void save(String phoneNumber,String userName){
        OrderQuestion orderQuestion=new OrderQuestion();
        orderQuestion.setPhoneNumber(phoneNumber);
        orderQuestion.setUserName(userName);
        orderQuestion.setStatus("В ожидании");
        orderQuestionRepository.save(orderQuestion);
    }
}
