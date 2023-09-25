package com.sixseven.service.impl;

import com.sixseven.bean.*;
import com.sixseven.dao.CowryDAO;
import com.sixseven.dao.MemberDAO;
import com.sixseven.dao.OrderDAO;
import com.sixseven.dao.OrderItemDAO;
import com.sixseven.dao.impl.CowryDAOImpl;
import com.sixseven.dao.impl.MemberDAOImpl;
import com.sixseven.dao.impl.OrderDAOImpl;
import com.sixseven.dao.impl.OrderItemDAOImpl;
import com.sixseven.service.OrderService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author Belly
 * @version 1.1.0
 */
public class OrderServiceImpl implements OrderService {
    private OrderDAO orderDAO = new OrderDAOImpl();
    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
    private CowryDAO cowryDAO = new CowryDAOImpl();
    @Override
    public String saveOrder(Cart cart, Integer memberId) {
        String orderID = System.currentTimeMillis() + "" + memberId;
        orderDAO.saveOrder(new Order(
                orderID, new Date(), cart.getFinalTotalPrice(), 0, memberId));

        Map<Integer, CartItem> cartItemMap = cart.getCartItemMap();
        for (Integer id : cartItemMap.keySet()) {
            CartItem item = cartItemMap.get(id);
            orderItemDAO.saveOrderItem(new OrderItem(null, item.getName(),
                    item.getPrice(), item.getCount(), item.getTotalPrice(), orderID));
            Cowry cowry = cowryDAO.cowryById(id);
            cowry.setSales(cowry.getSales() + item.getCount());
            cowry.setStock(cowry.getStock() - item.getCount());
            cowryDAO.updateCowry(cowry);
        }
        cartItemMap.clear();
        return orderID;
    }

    @Override
    public List<Order> queryOrderByMemberId(Integer memberId) {
        return orderDAO.queryOrderByMemberId(memberId);
    }

    @Override
    public List<OrderItem> queryOrderItemsByOrderId(String orderId) {
        return orderItemDAO.queryOrderItemsByOrderId(orderId);
    }

    @Override
    public List<Order> queryOrders() {
        return orderDAO.queryOrders();
    }

    @Override
    public List<OrderItem> queryOrderItems() {
        return orderItemDAO.queryOrderItems();
    }

    @Override
    public boolean updateStatusByOrderId(Integer status, String orderId) {
        return orderDAO.updateStatusByOrderId(status, orderId) == 1 ? true : false;
    }
}
