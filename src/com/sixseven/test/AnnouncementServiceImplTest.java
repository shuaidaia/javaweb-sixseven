package com.sixseven.test;

import com.sixseven.bean.AnnAndComs;
import com.sixseven.service.AnnouncementService;
import com.sixseven.service.impl.AnnouncementServiceImpl;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * @author Belly
 * @version 1.1.0
 */
public class AnnouncementServiceImplTest {
    @Test
    public void test01(){
        AnnouncementService announcementService = new AnnouncementServiceImpl();
        Map<Integer, AnnAndComs> annAndComsMap = announcementService.AnnouncementAndComments();
        System.out.println("annAndComsMap= " + annAndComsMap);
    }
}
