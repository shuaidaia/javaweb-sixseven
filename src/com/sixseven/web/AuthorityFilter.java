package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.google.gson.Gson;
import com.sixseven.bean.Member;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuthorityFilter implements Filter {
    private List<String> excludedUrls;
    public void init(FilterConfig config) throws ServletException {
        String urls = config.getInitParameter("excludedUrls");
        String[] splitUrl = urls.split(",");
        excludedUrls = Arrays.asList(splitUrl);
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        String url = req.getServletPath();
        if (!excludedUrls.contains(url)) {
            Member member = (Member) req.getSession().getAttribute("member");
            if (null == member) {
                if ("XMLHttpRequest".equals(req.getHeader("X-Requested-With"))){
                    Map<String, Object> map = new HashMap<>();
                    map.put("url", "views/customer/login.jsp");
                    String mapToJson = new Gson().toJson(map);
                    response.getWriter().write(mapToJson);
                }else {
                    req.getRequestDispatcher("/views/customer/login.jsp").forward(request, response);
                }
            }
        }
        chain.doFilter(request, response);
    }
}
