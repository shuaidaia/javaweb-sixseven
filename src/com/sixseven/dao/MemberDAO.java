package com.sixseven.dao;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.bean.Member;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface MemberDAO {
    public int saveMember(Member member);
    public Member queryMemberByUsernameAndPassword(String username, String password);
    public Member queryMemberByUsername(String username);
    public int addAnnouncement(Announcement announcement);
    public int addComment(Comment comment);
}
