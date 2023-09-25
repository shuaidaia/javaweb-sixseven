package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.google.gson.Gson;
import com.sixseven.bean.Member;
import com.sixseven.service.MemberService;
import com.sixseven.service.impl.MemberServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class MemberServlet extends BasicServlet {
    private MemberService memberService = new MemberServiceImpl();
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Member member = new Member();
        member.setUsername(username);
        member.setPassword(password);
        if (memberService.isLogin(member)){
            member = memberService.queryMemberByUsername(username);
            request.getSession().setAttribute("member", member);
            //鉴权
            if (member.getStatus() == 1){
                response.sendRedirect(request.getContextPath() + "/views/manage/index.jsp");
            }else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        }else {
            request.setAttribute("msg", "用户名或密码错误");
            request.setAttribute("username",username);
            request.getRequestDispatcher("/views/customer/login.jsp").forward(request, response);
        }
    }
    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        Object kaptchaSessionKey = request.getSession().getAttribute("KAPTCHA_SESSION_KEY");
        //立即删除session验证码，避免复用
        request.getSession().removeAttribute("KAPTCHA_SESSION_KEY");
        if (code.equalsIgnoreCase((String) kaptchaSessionKey) && kaptchaSessionKey != null){
            if (!memberService.isExistsUsername(username)){
                if ("belly".equals(username) || "guanghui".equals(username)){
                    memberService.isRegister(
                            new Member(null, username, password, email, 1));
                }else {
                    memberService.isRegister(
                            new Member(null, username, password, email, 0));
                }
                request.setAttribute("msg", "注册成功，请登录");
                request.getRequestDispatcher("/views/customer/login.jsp").forward(request, response);
            }else {
                request.setAttribute("msg", "用户名存在");
                request.getRequestDispatcher("/views/customer/register.jsp").forward(request, response);
            }
        }else {
            request.setAttribute("msg", "验证码错误");
            request.setAttribute("reUsername", username);
            request.setAttribute("rePassword", password);
            request.setAttribute("reEmail", email);
            request.getRequestDispatcher("/views/customer/register.jsp").forward(request, response);
        }
    }
    protected void isExistsName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Gson gson = new Gson();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("isExist", memberService.isExistsUsername(name));
        resultMap.put("regexName", Pattern.matches("^\\w{4,10}$",name));
        String mapToJson = gson.toJson(resultMap);
        response.getWriter().write(mapToJson);
    }
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath());
    }
}
