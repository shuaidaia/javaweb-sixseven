package com.sixseven.service.impl;

import com.sixseven.bean.AnnAndComs;
import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.dao.AnnouncementDAO;
import com.sixseven.dao.CommentDAO;
import com.sixseven.dao.MemberDAO;
import com.sixseven.dao.impl.AnnouncementDAOImpl;
import com.sixseven.dao.impl.CommentDAOImpl;
import com.sixseven.dao.impl.MemberDAOImpl;
import com.sixseven.service.AnnouncementService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Belly
 * @version 1.1.0
 */
public class AnnouncementServiceImpl implements AnnouncementService {
    private AnnouncementDAO announcementDAO = new AnnouncementDAOImpl();
    private CommentDAO commentDAO = new CommentDAOImpl();
    private MemberDAO memberDAO = new MemberDAOImpl();
    @Override
    public Map<Integer, AnnAndComs> AnnouncementAndComments() {
        //把公告和对应的评论储存到map中，返回
        List<Announcement> announcements = announcementDAO.queryAnnouncement();
        Map<Integer, AnnAndComs> annAndComsMap = new HashMap<>();
        for (Announcement announcement : announcements) {
            AnnAndComs annAndComs = new AnnAndComs(announcement,
                    commentDAO.queryCommentByAnnouncementId(announcement.getId()),
                    queryCommentCountByAnnouncementId(announcement.getId()));
            annAndComsMap.put(announcement.getId(), annAndComs);
        }
        return annAndComsMap;
    }

    @Override
    public boolean addAnnouncement(Announcement announcement) {
        return memberDAO.addAnnouncement(announcement) == 1 ? true : false;
    }

    @Override
    public boolean addComment(Comment comment) {
        return memberDAO.addComment(comment) == 1 ? true : false;
    }

    @Override
    public int queryCommentCountByAnnouncementId(Integer announcementId) {
        return commentDAO.queryCommentCountByAnnouncementId(announcementId);
    }

    @Override
    public List<Comment> queryCommentByAnnouncementId(Integer announcementId) {
        return commentDAO.queryCommentByAnnouncementId(announcementId);
    }

    @Override
    public boolean deleteAnnouncementById(Integer id) {
        return announcementDAO.deleteAnnouncementById(id) == 1 ? true : false;
    }

    @Override
    public boolean deleteCommentById(Integer id) {
        return commentDAO.deleteCommentById(id) == 1 ? true : false;
    }
}
