package com.sixseven.dao;

import com.sixseven.bean.Order;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface OrderDAO {
    public int saveOrder(Order order);
    public List<Order> queryOrderByMemberId(Integer memberId);
    public List<Order> queryOrders();
    public int updateStatusByOrderId(Integer status, String orderId);
}
