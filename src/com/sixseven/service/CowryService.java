package com.sixseven.service;

import com.sixseven.bean.Cowry;
import com.sixseven.bean.Page;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public interface CowryService {
    public boolean addCowry(Cowry cowry);
    public List<Cowry> cowryListByStatus(Integer status);
    public List<Cowry> cowryList();
    public Cowry cowryById(Integer id);
    public boolean updateCowry(Cowry cowry);
    public boolean deleteCowryById(Integer id);
    public Page<Cowry> page(Integer pageNo, Integer pageSize);
}
