package com.sixseven.bean;

import java.util.Date;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Announcement {
    private Integer id;
    private String name;
    private Date datetime;
    private String text;
    private String img_path;

    public Announcement() {
    }

    public Announcement(Integer id, String name, Date datetime, String text, String img_path) {
        this.id = id;
        this.name = name;
        this.datetime = datetime;
        this.text = text;
        this.img_path = img_path;
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

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", datetime=" + datetime +
                ", text='" + text + '\'' +
                ", img_path='" + img_path + '\'' +
                '}';
    }
}
