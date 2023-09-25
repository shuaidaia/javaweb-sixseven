package com.sixseven.service.impl;

import com.sixseven.bean.Cowry;
import com.sixseven.bean.Page;
import com.sixseven.dao.CowryDAO;
import com.sixseven.dao.impl.CowryDAOImpl;
import com.sixseven.service.CowryService;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CowryServiceImpl implements CowryService {
    private CowryDAO cowryDAO = new CowryDAOImpl();
    @Override
    public boolean addCowry(Cowry cowry) {
        return cowryDAO.addCowryByStatus(cowry) == 1 ? true : false;
    }

    @Override
    public List<Cowry> cowryListByStatus(Integer status) {
        return cowryDAO.cowryListByStatus(status);
    }

    @Override
    public List<Cowry> cowryList() {
        return cowryDAO.cowryList();
    }

    @Override
    public Cowry cowryById(Integer id) {
        return cowryDAO.cowryById(id);
    }

    @Override
    public boolean updateCowry(Cowry cowry) {
        return cowryDAO.updateCowry(cowry) == 1 ? true : false;
    }

    @Override
    public boolean deleteCowryById(Integer id) {
        return cowryDAO.deleteCowryById(id) == 1 ? true : false;
    }

    @Override
    public Page<Cowry> page(Integer pageNo, Integer pageSize) {
        Page<Cowry> cowryPage = new Page<>();
        int cowryItemTotalRow = cowryDAO.cowryItemTotalRow();
        int i = cowryItemTotalRow / pageSize;
        if (cowryItemTotalRow % pageSize > 0){
            i += 1;
        }
        cowryPage.setPageNo(pageNo);
        cowryPage.setPageTotalCount(i);
        cowryPage.setTotalRow(cowryItemTotalRow);
        cowryPage.setPageSize(pageSize);
        cowryPage.setItems(cowryDAO.queryCowryItemByPageNoAndPageSize(pageNo, pageSize));
        return cowryPage;
    }
}
