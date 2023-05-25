package com.example.buysell.services;

import com.example.buysell.models.Image;
import com.example.buysell.models.Product;
import com.example.buysell.models.Type;
import com.example.buysell.repositories.ImageRepository;
import com.example.buysell.repositories.ProductRepository;
import com.example.buysell.repositories.TypeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final TypeRepository typeRepository;
    private final ImageRepository imageRepository;

    public List<Product> getProductList(String title) {
        if (title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }


    public void saveProduct(Product product, List<MultipartFile> files,String type) throws IOException {
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
        Type productType= typeRepository.findByTypeName(type);
        if(productType!=null){
            System.out.println(productType.getTypeName()+" - type name");
            product.setType(productType);
            productType.getProductList().add(product);
        }
        else{
            log.info("Error Type! type: {}",type);
            productType=new Type();
            productType.setTypeName(type);
            typeRepository.save(productType);
            product.setType(productType);
        }

        log.info("Saving new {}", product);
        Product savedProduct = productRepository.save(product);
        savedProduct.setPreviewImageId(savedProduct.getImageList().get(0).getId());
        productRepository.save(savedProduct);

    }




    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    private enum PreviewImageIdStatus{
        ThereIs,
        Nope,
        NewPreview;
    }

    /*public void editProduct(Long id,Product product, ArrayList<MultipartFile> files, String type,
                            ArrayList<Long> oldImageId) throws IOException {
        Product oldProduct=productRepository.getById(id);
        if(oldProduct!=null){
            System.out.println("Product not null");
            System.out.println(oldProduct.getImageList().size()+"img size old Product");
        }
        else{
            System.out.println("Product is null");
        }
        PreviewImageIdStatus previewImageIdStatus= PreviewImageIdStatus.Nope;

        boolean isFirstFile = true;
        if(oldImageId!=null){
            System.out.println("Зашло в if");
            if(!(oldImageId.isEmpty())){
                Long previewImageId=oldProduct.getPreviewImageId();
                System.out.println("Зашло в if под номером 2");
                System.out.println(oldProduct.getImageList().size()+" Размер списка фоток");
                oldProduct.getImageList().forEach(image -> {
                    System.out.println("Зашло в удаление");
                    deleteImage(image.getId());


                });
                for(Image image: oldProduct.getImageList()){
                    System.out.println("Зашло в уикл под if");
                    if(oldImageId.contains(image.getId())){
                        System.out.println("Зашло в if под номером 3");
                        if(previewImageId==image.getId()){
                            System.out.println("Зашло в if под номером 4");
                            previewImageIdStatus=PreviewImageIdStatus.ThereIs;

                        }

                    }
                    else{
                        oldProduct.getImageList().remove(image);
                        deleteImage(image.getId());
                    }
                }
            }
        }
        else{
            System.out.println("Зашло в else");
            oldProduct.getImageList().forEach(image -> {
                System.out.println("Зашло в удаление");
                deleteImage(image.getId());


            });
            oldProduct.getImageList().clear();
        }

        if(previewImageIdStatus.equals(PreviewImageIdStatus.Nope)&&oldProduct.getImageList().size()!=0){
            System.out.println("Зашло в if2");
            oldProduct.getImageList().get(0).setPreviewImage(true);
            oldProduct.setPreviewImageId(oldProduct.getImageList().get(0).getId());
            previewImageIdStatus=PreviewImageIdStatus.ThereIs;
        }




        for (MultipartFile file : files) {
            if (file.getSize() != 0) {
                Image imageItem = toImageEntity(file);
                if (previewImageIdStatus.equals(PreviewImageIdStatus.Nope)) {
                    imageItem.setPreviewImage(true);
                   previewImageIdStatus=PreviewImageIdStatus.NewPreview;
                }
                oldProduct.addImageToProduct(imageItem);
            }
        }

        if(!oldProduct.getType().getTypeName().equals(type)){
            oldProduct.getType().setTypeName(type);
        }
        oldProduct.setAddress(product.getAddress());
        oldProduct.setInformation(product.getInformation());
        oldProduct.setPrice(product.getPrice());
        oldProduct.setLivingArea(product.getLivingArea());
        oldProduct.setTitle(product.getTitle());
        oldProduct.setRooms(product.getRooms());



        log.info("Saving old {}", product);
        if(previewImageIdStatus.equals(PreviewImageIdStatus.NewPreview)||previewImageIdStatus.equals(PreviewImageIdStatus.Nope)){
            Product savedProduct = productRepository.save(oldProduct);

            savedProduct.setPreviewImageId(savedProduct.getImageList().get(0).getId());
        }

        productRepository.save(oldProduct);


    }*/
    public void editProduct(Long id, Product product, ArrayList<MultipartFile> files, String type,
                            ArrayList<Long> oldImageId) throws IOException {
        Product oldProduct = productRepository.getById(id);
        if (oldProduct != null) {
            System.out.println("Product not null");
            System.out.println(oldProduct.getImageList().size() + " img size old Product");
        } else {
            System.out.println("Product is null");
        }
        PreviewImageIdStatus previewImageIdStatus = PreviewImageIdStatus.Nope;

        boolean isFirstFile = true;
        if (oldImageId != null) {
            System.out.println("Зашло в if");
            if (!(oldImageId.isEmpty())) {
                Long previewImageId = oldProduct.getPreviewImageId();
                System.out.println("Зашло в if под номером 2");
                System.out.println(oldProduct.getImageList().size() + " Размер списка фоток");

                Iterator<Image> iterator = oldProduct.getImageList().iterator();
                while (iterator.hasNext()) {
                    Image image = iterator.next();
                    System.out.println("Зашло в удаление");
                    deleteImage(image.getId());

                    if (oldImageId.contains(image.getId())) {
                        System.out.println("Зашло в if под номером 3");
                        if (previewImageId == image.getId()) {
                            System.out.println("Зашло в if под номером 4");
                            previewImageIdStatus = PreviewImageIdStatus.ThereIs;
                        }
                    } else {
                        iterator.remove();
                        deleteImage(image.getId());
                    }
                }
            }
        } else {
            System.out.println("Зашло в else");
            for (Image image : oldProduct.getImageList()) {
                System.out.println("Зашло в удаление");
                deleteImage(image.getId());
            }
            oldProduct.getImageList().clear();
        }

        if (previewImageIdStatus.equals(PreviewImageIdStatus.Nope) && oldProduct.getImageList().size() != 0) {
            System.out.println("Зашло в if2");
            oldProduct.getImageList().get(0).setPreviewImage(true);
            oldProduct.setPreviewImageId(oldProduct.getImageList().get(0).getId());
            previewImageIdStatus = PreviewImageIdStatus.ThereIs;
        }

        for (MultipartFile file : files) {
            if (file.getSize() != 0) {
                Image imageItem = toImageEntity(file);
                if (previewImageIdStatus.equals(PreviewImageIdStatus.Nope)) {
                    imageItem.setPreviewImage(true);
                    previewImageIdStatus = PreviewImageIdStatus.NewPreview;
                }
                oldProduct.addImageToProduct(imageItem);
            }
        }

        if (!oldProduct.getType().getTypeName().equals(type)) {
            oldProduct.getType().setTypeName(type);
        }
        oldProduct.setAddress(product.getAddress());
        oldProduct.setInformation(product.getInformation());
        oldProduct.setPrice(product.getPrice());
        oldProduct.setLivingArea(product.getLivingArea());
        oldProduct.setTitle(product.getTitle());
        oldProduct.setRooms(product.getRooms());

        log.info("Saving old {}", product);
        if (previewImageIdStatus.equals(PreviewImageIdStatus.NewPreview) || previewImageIdStatus.equals(PreviewImageIdStatus.Nope)) {
            Product savedProduct = productRepository.save(oldProduct);
            savedProduct.setPreviewImageId(savedProduct.getImageList().get(0).getId());
        }

        productRepository.save(oldProduct);
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
    public void deleteImage(Long id){
        imageRepository.deleteById(id);

    }

}
