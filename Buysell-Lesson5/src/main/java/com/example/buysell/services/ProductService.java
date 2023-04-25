package com.example.buysell.services;

import com.example.buysell.models.Image;
import com.example.buysell.models.Product;
import com.example.buysell.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    public List<Product> getProductList(String title) {
        if (title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }


    public void saveProduct(Product product, List<MultipartFile> files) throws IOException {
        boolean isFirstFile = true;

        for (MultipartFile file : files) {
            if (file.getSize() != 0) {
                Image imageItem = toImageEntity(file);
                if (isFirstFile) {
                    imageItem.setPreviewImage(true);
                    isFirstFile = false;
                }
                product.addImageToProduct(imageItem);
            }
        }

        log.info("Saving new {}", product);
        Product savedProduct = productRepository.save(product);
        savedProduct.setPreviewImageId(savedProduct.getImageList().get(0).getId());
        productRepository.save(product);
    }


    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
