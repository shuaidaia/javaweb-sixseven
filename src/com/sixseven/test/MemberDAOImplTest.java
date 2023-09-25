package com.sixseven.test;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.bean.Member;
import com.sixseven.dao.MemberDAO;
import com.sixseven.dao.impl.MemberDAOImpl;
import com.sixseven.utils.JDBCUtilsByDruid;
import org.junit.jupiter.api.Test;

import java.util.Date;

/**
 * @author Belly
 * @version 1.1.0
 */
public class MemberDAOImplTest {
    @Test
    public void test(){
        MemberDAO memberDAO = new MemberDAOImpl();
        Member belly = new Member(null, "belly", "1234567", "belly@qq.com", 1);
        memberDAO.saveMember(belly);
        JDBCUtilsByDruid.commit();
    }
    @Test
    public void test1(){
        MemberDAO memberDAO = new MemberDAOImpl();
        Member belly = memberDAO.queryMemberByUsername("belly");
        System.out.println(belly);
    }
    @Test
    public void test2(){
        MemberDAO memberDAO = new MemberDAOImpl();
        Member belly = memberDAO.queryMemberByUsernameAndPassword("belly", "1234567");
        System.out.println(belly);
    }
    @Test
    public void test3(){
        MemberDAO memberDAO = new MemberDAOImpl();
        Announcement belly = new Announcement(null, "belly", new Date(),
                "一表人才", "assets/img/800_800_28B5F5B15775FEB6D7F13F4CF1A3A8FF59B648B79E6D272Fmp.png");
        int i = memberDAO.addAnnouncement(belly);
        JDBCUtilsByDruid.commit();
        System.out.println("i= " + i);
    }
    @Test
    public void test4(){
        MemberDAO memberDAO = new MemberDAOImpl();
        Comment jack = new Comment(null, "king", new Date(),
                "我是学生，送我！希望你不要不识好歹", 4, 2);
        int i = memberDAO.addComment(jack);
        JDBCUtilsByDruid.commit();
        System.out.println("i= " + i);
    }
}
