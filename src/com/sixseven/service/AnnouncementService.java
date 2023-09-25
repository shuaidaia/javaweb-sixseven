package com.sixseven.service;

import com.sixseven.bean.AnnAndComs;
import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;

import java.util.List;
import java.util.Map;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface AnnouncementService {
    public Map<Integer, AnnAndComs> AnnouncementAndComments();
    public boolean addAnnouncement(Announcement announcement);
    public boolean addComment(Comment comment);
    public int queryCommentCountByAnnouncementId(Integer announcementId);
    public List<Comment> queryCommentByAnnouncementId(Integer announcementId);
    public boolean deleteAnnouncementById(Integer id);
    public boolean deleteCommentById(Integer id);
}
