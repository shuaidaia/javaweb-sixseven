package com.sixseven.service.impl;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.bean.Member;
import com.sixseven.dao.MemberDAO;
import com.sixseven.dao.impl.MemberDAOImpl;
import com.sixseven.service.MemberService;

/**
 * @author Belly
 * @version 1.1.0
 */
public class MemberServiceImpl implements MemberService {
    private MemberDAO memberDAO = new MemberDAOImpl();
    @Override
    public boolean isRegister(Member member) {
        return memberDAO.saveMember(member) == 1 ? true : false;
    }

    @Override
    public boolean isLogin(Member member) {
        return memberDAO.queryMemberByUsernameAndPassword(member.getUsername(), member.getPassword())
                != null ? true : false;
    }

    @Override
    public Member queryMemberByUsername(String username) {
        return memberDAO.queryMemberByUsername(username);
    }

    @Override
    public boolean isExistsUsername(String username) {
        return memberDAO.queryMemberByUsername(username) != null ? true : false;
    }

    @Override
    public boolean addAnnouncement(Announcement announcement) {
        return memberDAO.addAnnouncement(announcement) == 1 ? true : false;
    }

    @Override
    public boolean addComment(Comment comment) {
        return memberDAO.addComment(comment) == 1 ? true : false;
    }
}
