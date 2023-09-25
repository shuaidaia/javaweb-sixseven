package com.sixseven.test;

import com.sixseven.bean.Announcement;
import com.sixseven.dao.AnnouncementDAO;
import com.sixseven.dao.impl.AnnouncementDAOImpl;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class AnnouncementDAOImplTest {
    @Test
    public void test(){
        AnnouncementDAO announcementDAO = new AnnouncementDAOImpl();
        List<Announcement> announcements = announcementDAO.queryAnnouncement();
        System.out.println(announcements);
    }
}
