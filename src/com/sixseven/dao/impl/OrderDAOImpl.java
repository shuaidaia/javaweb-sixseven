package com.sixseven.dao.impl;

import com.sixseven.bean.Order;
import com.sixseven.dao.BasicDAO;
import com.sixseven.dao.OrderDAO;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class OrderDAOImpl extends BasicDAO<Order> implements OrderDAO {
    @Override
    public int saveOrder(Order order) {
        String sql = "insert into `order`(`id`,`datetime`,`price`,`status`,`member_id`) values(?,?,?,?,?)";
        return update(sql, order.getId(), order.getDatetime(),
                order.getPrice(), order.getStatus(), order.getMember_id());
    }

    @Override
    public List<Order> queryOrderByMemberId(Integer memberId) {
        String sql = "select `id`,`datetime`,`price`,`status`,`member_id` from `order` where `member_id`=?";
        return queryMulti(sql, Order.class, memberId);
    }

    @Override
    public List<Order> queryOrders() {
        String sql = "select `id`,`datetime`,`price`,`status`,`member_id` from `order`";
        return queryMulti(sql, Order.class);
    }

    @Override
    public int updateStatusByOrderId(Integer status, String orderId) {
        String sql = "update `order` set `status`=? where `id`=?";
        return update(sql, status, orderId);
    }
}
