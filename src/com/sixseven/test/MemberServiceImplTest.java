package com.sixseven.test;

import com.sixseven.bean.Member;
import com.sixseven.service.MemberService;
import com.sixseven.service.impl.MemberServiceImpl;
import com.sixseven.utils.JDBCUtilsByDruid;
import org.junit.jupiter.api.Test;

/**
 * @author Belly
 * @version 1.1.0
 */
public class MemberServiceImplTest {
    @Test
    public void test(){
        MemberService memberService = new MemberServiceImpl();
        Member belly = memberService.queryMemberByUsername("belly");
        System.out.println(belly);
        Member belly2 = new Member(null, "belly", "1234567", "", null);
        Member king = new Member(null, "king", "1234567", "king@qq.com", 0);
        boolean login = memberService.isLogin(belly2);
        boolean register = memberService.isRegister(king);
        JDBCUtilsByDruid.commit();
        System.out.println(login);
        System.out.println(register);
    }
    @Test
    public void test02(){
        MemberService memberService = new MemberServiceImpl();

    }
}
