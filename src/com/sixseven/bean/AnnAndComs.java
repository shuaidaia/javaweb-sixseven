package com.sixseven.bean;

import com.sixseven.service.AnnouncementService;
import com.sixseven.service.impl.AnnouncementServiceImpl;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class AnnAndComs {
    private Announcement announcement;
    private List<Comment> commentList;
    private int count;


    public AnnAndComs(Announcement announcement, List<Comment> commentList, int count) {
        this.announcement = announcement;
        this.commentList = commentList;
        this.count = count;
    }

    public Announcement getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(Announcement announcement) {
        this.announcement = announcement;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "AnnAndComs{" +
                "announcement=" + announcement +
                ", commentList=" + commentList +
                '}';
    }
}
