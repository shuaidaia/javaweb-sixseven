package com.sixseven.test;

import com.sixseven.bean.Comment;
import com.sixseven.dao.CommentDAO;
import com.sixseven.dao.impl.CommentDAOImpl;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CommentDAOImplTest {
    @Test
    public void test01(){
        CommentDAO commentDAO = new CommentDAOImpl();
        List<Comment> comments = commentDAO.queryCommentByAnnouncementId(2);
        System.out.println(comments);
    }
    @Test
    public void test02(){
        CommentDAO commentDAO = new CommentDAOImpl();
        int i = commentDAO.queryCommentCountByAnnouncementId(3);
        System.out.println("i= " + i);
    }
}
