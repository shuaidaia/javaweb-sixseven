package com.sixseven.bean;

import java.util.Date;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Comment {
    private Integer id;
    private String name;
    private Date datetime;
    private String message;
    private Integer member_id;
    private Integer announcement_id;

    public Comment() {
    }

    public Comment(Integer id, String name, Date datetime, String message, Integer member_id, Integer announcement_id) {
        this.id = id;
        this.name = name;
        this.datetime = datetime;
        this.message = message;
        this.member_id = member_id;
        this.announcement_id = announcement_id;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getMember_id() {
        return member_id;
    }

    public void setMember_id(Integer member_id) {
        this.member_id = member_id;
    }

    public Integer getAnnouncement_id() {
        return announcement_id;
    }

    public void setAnnouncement_id(Integer announcement_id) {
        this.announcement_id = announcement_id;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", datetime=" + datetime +
                ", message='" + message + '\'' +
                ", member_id=" + member_id +
                ", announcement_id=" + announcement_id +
                '}';
    }
}
