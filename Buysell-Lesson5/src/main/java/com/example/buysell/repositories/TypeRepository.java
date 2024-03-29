package com.example.buysell.repositories;

import com.example.buysell.models.Type;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeRepository extends JpaRepository<Type,Long> {
    Type findByTypeName(String typeName);
}
