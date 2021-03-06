package com.mountech.mycart.entities;

import javax.persistence.*;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;

    @Column(length = 3000)
    private String pDesc;
    private String pPhoto;
    private double pDiscount;
    private double pPrice;
    private int pQuantity;

    @ManyToOne
    private Category category;

    public Product() {
    }


    public Product(String pName, String pDesc, String pPhoto, double pDiscount, double pPrice, int pQuantity, Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pDiscount = pDiscount;
        this.pPrice = pPrice;
        this.pQuantity = pQuantity;
        this.category = category;
    }

    public int getpId() {
        return pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public double getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(double pDiscount) {
        this.pDiscount = pDiscount;
    }

    public double getpPrice() {
        return pPrice;
    }

    public void setpPrice(double pPrice) {
        this.pPrice = pPrice;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pDesc='" + pDesc + '\'' +
                ", pPhoto='" + pPhoto + '\'' +
                ", pDiscount=" + pDiscount +
                ", pPrice=" + pPrice +
                ", pQuantity=" + pQuantity +
                ", category=" + category +
                '}';
    }

    // Calculate price after discount
    public double getPriceAfterDiscount() {
        return getpPrice() - ((getpDiscount() * getpPrice()) / 100.0);
    }
}
