package com.sixseven.dao;

import com.sixseven.bean.Comment;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface CommentDAO {
    public List<Comment> queryCommentByAnnouncementId(Integer announcementId);
    public int queryCommentCountByAnnouncementId(Integer announcementId);
    public int deleteCommentById(Integer id);
}
