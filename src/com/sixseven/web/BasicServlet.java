package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

public abstract class BasicServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决接收到的乱码问题
        request.setCharacterEncoding("utf-8");

        //获取action中的value值
        String action = request.getParameter("action");
        System.out.println("action= " + action);

        //使用模板模式+反射+动态绑定来简化多个if-else if-...
        try {
            //这里的this就是请求的Servlet，它会由动态绑定机制的找到父类的doPost()方法
            //declaredMethod方法对象就是当前请求的Servlet对应的action的方法，
            //该方法对象declaredMethod是变化的，根据用户的请求
            Method declaredMethod =
                    this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);
            //使用方法对象，进行反射调用
            declaredMethod.invoke(this, request, response);
        } catch (Exception e) {
            //事务管理和异常基础知识回顾：如果这里是直接打印来处理异常e.printStackTrace()而不是抛出，
            // 异常就会在这截至，就不会把异常向上抛出，导致事务过滤器无法执行事务回滚操作
            //（也会因为异常没有抛给tomcat，导致异常页面无法显示）
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
