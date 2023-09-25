package com.sixseven.dao.impl;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.dao.AnnouncementDAO;
import com.sixseven.dao.BasicDAO;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class AnnouncementDAOImpl extends BasicDAO<Announcement> implements AnnouncementDAO {
    @Override
    public List<Announcement> queryAnnouncement() {
        String sql = "select `id`,`name`,`datetime`,`text`,`img_path` from `announcement`";
        return queryMulti(sql, Announcement.class);
    }

    @Override
    public int deleteAnnouncementById(Integer id) {
        String sql = "delete from `announcement` where `id`=?";
        return update(sql, id);
    }

}
