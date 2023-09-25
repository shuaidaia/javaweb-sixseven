package com.sixseven.bean;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Order {
    private String id;
    private Date datetime;
    private BigDecimal price;
    private Integer status;
    private Integer member_id;

    public Order() {
    }

    public Order(String id, Date datetime, BigDecimal price, Integer status, Integer member_id) {
        this.id = id;
        this.datetime = datetime;
        this.price = price;
        this.status = status;
        this.member_id = member_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getMember_id() {
        return member_id;
    }

    public void setMember_id(Integer member_id) {
        this.member_id = member_id;
    }
}
