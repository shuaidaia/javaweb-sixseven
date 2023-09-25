package com.sixseven.dao;

import com.sixseven.bean.OrderItem;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface OrderItemDAO {
    public int saveOrderItem(OrderItem orderItem);
    public List<OrderItem> queryOrderItemsByOrderId(String orderId);
    public List<OrderItem> queryOrderItems();
}
