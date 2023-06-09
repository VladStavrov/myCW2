package com.example.buysell.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="product")

@AllArgsConstructor
@NoArgsConstructor
public  class Product {
    private String title;

    @ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.REFRESH   )
    @JoinColumn(name = "type_id")
    private Type  type;


    /*@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,
    mappedBy = "product")
    private List<ProductInfo> productInfoList=new ArrayList<>();*/

    @OneToMany(
            cascade = CascadeType.ALL,orphanRemoval = true,
            mappedBy = "product")
    private List<Image> imageList=new ArrayList<>();


    private Long previewImageId;
    private int price;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Lob
    private String information;

    public Long getPreviewImageId() {
        return previewImageId;
    }

    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
    }
    private int rooms;

    private int years;
    private int floor;
    private String material;

    private String address;
    private int livingArea;

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    @ManyToMany
    @JoinTable(name = "favorites_product",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "favorites_id"))
    private List<Favorites> favorites= new ArrayList<>();
    @PreRemove
    private void preRemove() {
        for (OrderBuying orderBuying : orderBuyings) {
            orderBuying.setProduct(null);
        }
    }
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.REFRESH,
            mappedBy = "product")
    private List<OrderBuying> orderBuyings=new ArrayList<>() ;

    public void addImageToProduct(Image image){
        image.setProduct(this);
        imageList.add(image);
    }

    public List<OrderBuying> getOrderBuyings() {
        return orderBuyings;
    }

    public void setOrderBuyings(List<OrderBuying> orderBuyings) {
        this.orderBuyings = orderBuyings;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
    /*public List<ProductInfo> getProductInfoList() {
        return productInfoList;
    }

    public void setProductInfoList(ArrayList<ProductInfo> productInfoList) {
        this.productInfoList = productInfoList;
    }*/

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(ArrayList<Image> imageList) {
        this.imageList = imageList;
    }


   /* public FavoritesProduct getFavoritesProduct() {
        return favoritesProduct;
    }

    public void setFavoritesProduct(FavoritesProduct favoritesProduct) {
        this.favoritesProduct = favoritesProduct;
    }*/

    public List<Favorites> getFavorites() {
        return favorites;
    }



   /* public OrderBuying getOrderBuying() {
        return orderBuying;
    }

    public void setOrderBuying(OrderBuying orderBuying) {
        this.orderBuying = orderBuying;
    }*/

    public String getTitle(){
        return title;
    };

    public void setTitle(String title) {
        this.title = title;
    }



    public void setFavorites(List<Favorites> favorites) {
        this.favorites = favorites;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getLivingArea() {
        return livingArea;
    }

    public void setLivingArea(int livingArea) {
        this.livingArea = livingArea;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }


}
