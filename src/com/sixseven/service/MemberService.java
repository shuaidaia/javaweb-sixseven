package com.sixseven.service;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.bean.Member;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface MemberService {
    public boolean isRegister(Member member);
    public boolean isLogin(Member member);
    public Member queryMemberByUsername(String username);
    public boolean isExistsUsername(String username);
    public boolean addAnnouncement(Announcement announcement);
    public boolean addComment(Comment comment);
}
