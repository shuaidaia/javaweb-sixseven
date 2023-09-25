package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.sixseven.utils.JDBCUtilsByDruid;

import javax.servlet.*;
import java.io.IOException;

public class TransactionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            chain.doFilter(request,response);
            JDBCUtilsByDruid.commit();
        } catch (Exception e) {
            JDBCUtilsByDruid.rollback();
            throw new RuntimeException(e);
        }
    }
}
