package com.sixseven.bean;

import java.math.BigDecimal;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Cowry {
    private Integer id;
    private String name;
    private BigDecimal price;
    private String img_path;
    private Integer stock;
    private Integer sales;
    private Integer status;

    public Cowry() {
    }

    public Cowry(Integer id, String name, BigDecimal price, String img_path, Integer stock, Integer sales, Integer status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.img_path = img_path;
        this.stock = stock;
        this.sales = sales;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Cowry{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", img_path='" + img_path + '\'' +
                ", stock=" + stock +
                ", sales=" + sales +
                ", status=" + status +
                '}';
    }
}
