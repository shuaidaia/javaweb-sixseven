package com.sixseven.service;

import com.sixseven.bean.Cart;
import com.sixseven.bean.Order;
import com.sixseven.bean.OrderItem;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface OrderService {
    public String saveOrder(Cart cart, Integer memberId);
    public List<Order> queryOrderByMemberId(Integer memberId);
    public List<OrderItem> queryOrderItemsByOrderId(String orderId);
    public List<Order> queryOrders();
    public List<OrderItem> queryOrderItems();
    public boolean updateStatusByOrderId(Integer status, String orderId);
}
