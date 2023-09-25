package com.sixseven.dao;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface AnnouncementDAO {
    public List<Announcement> queryAnnouncement();
    public int deleteAnnouncementById(Integer id);
}
