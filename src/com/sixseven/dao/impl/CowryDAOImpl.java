package com.sixseven.dao.impl;

import com.sixseven.bean.Cowry;
import com.sixseven.dao.BasicDAO;
import com.sixseven.dao.CowryDAO;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CowryDAOImpl extends BasicDAO<Cowry> implements CowryDAO {
    @Override
    public int addCowryByStatus(Cowry cowry) {
        String sql = "insert into `cowry`(`id`,`name`,`price`,`img_path`,`stock`,`sales`,`status`) values(?,?,?,?,?,?,?)";
        return update(sql, cowry.getId(), cowry.getName(),
                cowry.getPrice(), cowry.getImg_path(),
                cowry.getStock(), cowry.getSales(), cowry.getStatus());
    }

    @Override
    public List<Cowry> cowryListByStatus(Integer status) {
        String sql = "select `id`,`name`,`price`,`img_path`,`stock`,`sales`,`status` from `cowry` where `status` = ?";
        return queryMulti(sql, Cowry.class, status);
    }

    @Override
    public List<Cowry> cowryList() {
        String sql = "select `id`,`name`,`price`,`img_path`,`stock`,`sales`,`status` from `cowry`";
        return queryMulti(sql, Cowry.class);
    }

    @Override
    public Cowry cowryById(Integer id) {
        String sql = "select `id`,`name`,`price`,`img_path`,`stock`,`sales`,`status` from `cowry` where `id`=?";
        return querySingle(sql, Cowry.class, id);
    }

    @Override
    public int updateCowry(Cowry cowry) {
        String sql = "update `cowry` set `name`=?,`price`=?,`img_path`=?,`stock`=?,`sales`=?,`status`=? where `id`=?";
        return update(sql, cowry.getName(), cowry.getPrice(),
                cowry.getImg_path(), cowry.getStock(),
                cowry.getSales(), cowry.getStatus(), cowry.getId());
    }

    @Override
    public int deleteCowryById(Integer id) {
        String sql = "delete from `cowry` where `id`=?";
        return update(sql, id);
    }

    @Override
    public List<Cowry> queryCowryItemByPageNoAndPageSize(Integer pageNo, Integer pageSize) {
        String sql = "select `id`,`name`,`price`,`img_path`,`stock`,`sales`,`status` from `cowry` limit ?, ?";
        return queryMulti(sql, Cowry.class, (pageNo - 1) * pageSize, pageSize);
    }

    @Override
    public int cowryItemTotalRow() {
        String sql = "select count(*) from `cowry`";
        return ((Number) queryScalar(sql)).intValue();
    }
}
