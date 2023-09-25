package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.google.gson.Gson;
import com.sixseven.bean.Cart;
import com.sixseven.bean.Member;
import com.sixseven.service.OrderService;
import com.sixseven.service.impl.OrderServiceImpl;
import com.sixseven.utils.WebUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class OrderServlet extends BasicServlet {
    private OrderService orderService = new OrderServiceImpl();
    protected void order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Member member = (Member) request.getSession().getAttribute("member");
        if (cart == null || cart.getCartItemMap().isEmpty()){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        if (member == null){
            request.getRequestDispatcher("/views/customer/login.jsp").forward(request, response);
        }
        String orderId = orderService.saveOrder(cart, member.getId());
        request.setAttribute("orderId", orderId);//todo
        request.getRequestDispatcher("/orderServlet?action=orderList").forward(request, response);
    }

    protected void orderItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        request.setAttribute("orderItemList", orderService.queryOrderItemsByOrderId(orderId));
        request.getRequestDispatcher("/views/member/Ultramantiga.jsp").forward(request, response);
    }

    protected void orderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Member member = (Member) request.getSession().getAttribute("member");
        request.setAttribute("orderList", orderService.queryOrderByMemberId(member.getId()));
        request.getRequestDispatcher("/views/member/Ultramanleo.jsp").forward(request, response);
    }

    protected void allOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("orders", orderService.queryOrders());
        request.getRequestDispatcher("/views/manage/order.jsp").forward(request, response);
    }
    protected void allOrderItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        request.setAttribute("orderItems", orderService.queryOrderItemsByOrderId(orderId));
        request.getRequestDispatcher("/views/manage/orderItem.jsp").forward(request, response);
    }

    protected void status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> mapToJson = new HashMap<>();
        mapToJson.put("isStatus", orderService.updateStatusByOrderId(
                WebUtils.parseInteger(request.getParameter(
                        "status"), 0), request.getParameter("orderId")));
        String s = new Gson().toJson(mapToJson);
        response.getWriter().write(s);
    }
}
