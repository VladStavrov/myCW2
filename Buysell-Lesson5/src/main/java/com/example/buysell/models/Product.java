package com.example.buysell.models;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "product")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private String title;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "type_id")
    private Type type;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "product")
    private List<Image> imageList = new ArrayList<>();

    private Long previewImageId;
    private Integer price;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Lob
    private String information;

    private Integer rooms;

    private Integer years;
    private Integer floor;
    private String material;

    private String address;
    private Integer livingArea;

    @ManyToMany
    @JoinTable(name = "favorites_product", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "favorites_id"))
    private List<Favorites> favorites = new ArrayList<>();

    @PreRemove
    private void preRemove() {
        for (OrderBuying orderBuying : orderBuyings) {
            orderBuying.setProduct(null);
        }
    }

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH, mappedBy = "product")
    private List<OrderBuying> orderBuyings = new ArrayList<>();

    public void addImageToProduct(Image image) {
        image.setProduct(this);
        imageList.add(image);
    }
}
