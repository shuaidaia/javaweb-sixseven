package com.sixseven.dao.impl;

import com.sixseven.bean.OrderItem;
import com.sixseven.dao.BasicDAO;
import com.sixseven.dao.OrderItemDAO;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class OrderItemDAOImpl extends BasicDAO<OrderItem> implements OrderItemDAO {
    @Override
    public int saveOrderItem(OrderItem orderItem) {
        String sql = "insert into `order_item`(`id`,`name`,`price`,`count`,`total_price`,`order_id`) values(?,?,?,?,?,?)";
        return update(sql, orderItem.getId(), orderItem.getName(),
                orderItem.getPrice(), orderItem.getCount(),
                orderItem.getTotal_price(), orderItem.getOrder_id());
    }

    @Override
    public List<OrderItem> queryOrderItemsByOrderId(String orderId) {
        String sql = "select `id`,`name`,`price`,`count`,`total_price`,`order_id` from `order_item` where `order_id`=?";
        return queryMulti(sql, OrderItem.class, orderId);
    }

    @Override
    public List<OrderItem> queryOrderItems() {
        String sql = "select `id`,`name`,`price`,`count`,`total_price`,`order_id` from `order_item`";
        return queryMulti(sql, OrderItem.class);
    }
}
