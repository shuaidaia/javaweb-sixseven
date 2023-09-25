package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.google.gson.Gson;
import com.sixseven.bean.Cart;
import com.sixseven.bean.CartItem;
import com.sixseven.bean.Cowry;
import com.sixseven.service.CowryService;
import com.sixseven.service.impl.CowryServiceImpl;
import com.sixseven.utils.WebUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends BasicServlet {
    private CowryService cowryService = new CowryServiceImpl();
    protected void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = WebUtils.parseInteger(request.getParameter("id"), 0);
        Cowry cowry = cowryService.cowryById(id);
        CartItem cartItem = new CartItem(cowry.getId(), cowry.getName(),
                1, cowry.getPrice(), cowry.getPrice(), cowry.getImg_path());
        Cart sessionCart = (Cart) request.getSession().getAttribute("cart");
        if (sessionCart == null) {
            sessionCart = new Cart();
            request.getSession().setAttribute("cart", sessionCart);
        }
        sessionCart.addItem(cartItem);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = WebUtils.parseInteger(request.getParameter("id"), 0);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.deleteItem(id);
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = WebUtils.parseInteger(request.getParameter("id"), 0);
        int count = WebUtils.parseInteger(request.getParameter("count"), 1);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.modifyItem(id, count);
        response.sendRedirect(request.getHeader("Referer"));
//        request.getRequestDispatcher("/views/member/Ultraman.jsp").forward(request, response);
    }
}
