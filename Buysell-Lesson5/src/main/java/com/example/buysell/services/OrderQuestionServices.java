package com.example.buysell.services;

import com.example.buysell.models.OrderQuestion;
import com.example.buysell.repositories.OrderQuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderQuestionServices {
    private final OrderQuestionRepository orderQuestionRepository;

    public List<OrderQuestion> getOrdersQuestions() {
        return orderQuestionRepository.findAll();
    }

    public void save(String phoneNumber, String userName) {
        OrderQuestion orderQuestion = new OrderQuestion();
        orderQuestion.setPhoneNumber(phoneNumber);
        orderQuestion.setUserName(userName);
        orderQuestion.setStatus("В ожидании");
        orderQuestionRepository.save(orderQuestion);
    }

    public void changeStatus(Long id, String status) {
        OrderQuestion orderQuestion = orderQuestionRepository.getById(id);
        orderQuestion.setStatus(status);
        orderQuestionRepository.save(orderQuestion);
    }

    public void deleteOrder(Long id) {
        orderQuestionRepository.deleteById(id);
    }
}
