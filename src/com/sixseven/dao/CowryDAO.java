package com.sixseven.dao;

import com.sixseven.bean.Cowry;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface CowryDAO {
    public int addCowryByStatus(Cowry cowry);
    public List<Cowry> cowryListByStatus(Integer status);
    public List<Cowry> cowryList();
    public Cowry cowryById(Integer id);
    public int updateCowry(Cowry cowry);
    public int deleteCowryById(Integer id);
    public List<Cowry> queryCowryItemByPageNoAndPageSize(Integer pageNo, Integer pageSize);
    public int cowryItemTotalRow();
}
