package com.example.buysell.repositories;

import com.example.buysell.models.OrderBuying;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderBuyingRepository extends JpaRepository<OrderBuying, Long> {

}
