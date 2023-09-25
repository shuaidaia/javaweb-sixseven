package com.sixseven.dao.impl;

import com.sixseven.bean.Comment;
import com.sixseven.dao.BasicDAO;
import com.sixseven.dao.CommentDAO;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CommentDAOImpl extends BasicDAO<Comment> implements CommentDAO {
    @Override
    public List<Comment> queryCommentByAnnouncementId(Integer announcementId) {
        String sql = " select `id`,`name`,`datetime`,`message`,`member_id`,`announcement_id` from `comment` where `announcement_id`=?";
        return queryMulti(sql, Comment.class, announcementId);
    }

    @Override
    public int queryCommentCountByAnnouncementId(Integer announcementId) {
        String sql = "select count(*) from `comment` where `announcement_id`=?";
        return ((Number)queryScalar(sql, announcementId)).intValue();
    }

    @Override
    public int deleteCommentById(Integer id) {
        String sql = "delete from `comment` where `id`=?";
        return update(sql, id);
    }
}
