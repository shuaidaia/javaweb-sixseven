package com.sixseven.dao.impl;

import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.bean.Member;
import com.sixseven.dao.BasicDAO;
import com.sixseven.dao.MemberDAO;
import com.sixseven.utils.JDBCUtilsByDruid;

/**
 * @author Belly
 * @version 1.1.0
 */
public class MemberDAOImpl extends BasicDAO<Member> implements MemberDAO {
    @Override
    public int saveMember(Member member) {
        String sql = "insert into `member`(`username`,`password`,`email`,`status`) values(?,md5(?),?,?)";
        return update(sql, member.getUsername(), member.getPassword(),
                member.getEmail(), member.getStatus());
    }

    @Override
    public Member queryMemberByUsernameAndPassword(String username, String password) {
        String sql = "select `id`,`username`,`password`,`email`,`status` from `member` where `username`=? and `password`=md5(?)";
        return (Member) querySingle(sql, Member.class, username, password);
    }

    @Override
    public Member queryMemberByUsername(String username) {
        String sql = "select `id`,`username`,`password`,`email`,`status` from `member` where `username`=?";
        return (Member) querySingle(sql, Member.class, username);
    }

    @Override
    public int addAnnouncement(Announcement announcement) {
        String sql = "insert into `announcement`(`name`,`datetime`,`text`,`img_path`) values(?,?,?,?)";
        return update(sql, announcement.getName(), announcement.getDatetime(),
                announcement.getText(), announcement.getImg_path());
    }

    @Override
    public int addComment(Comment comment) {
        String sql = "insert into `comment`(`name`,`datetime`,`message`,`member_id`,`announcement_id`) values(?,?,?,?,?)";
        return update(sql, comment.getName(), comment.getDatetime(),
                comment.getMessage(), comment.getMember_id(), comment.getAnnouncement_id());
    }
}
