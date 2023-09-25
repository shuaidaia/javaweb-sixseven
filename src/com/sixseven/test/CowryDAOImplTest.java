package com.sixseven.test;

import com.sixseven.bean.Cowry;
import com.sixseven.dao.CowryDAO;
import com.sixseven.dao.impl.CowryDAOImpl;
import com.sixseven.utils.JDBCUtilsByDruid;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CowryDAOImplTest {
    @Test
    public void test(){
        CowryDAO cowryDAO = new CowryDAOImpl();
        Cowry mackBook = new Cowry(null, "MatePad", new BigDecimal(99),
                "assets/img/428_428_2406A21ABDF8E318A3BBAAF8C2ADF050mp.png", 100, 0, 1);
        int i = cowryDAO.addCowryByStatus(mackBook);
        JDBCUtilsByDruid.commit();
        System.out.println("i= " + i);
    }
    @Test
    public void test02(){
        CowryDAO cowryDAO = new CowryDAOImpl();
        List<Cowry> cowries = cowryDAO.cowryListByStatus(1);
        for (Cowry cowry : cowries) {
            System.out.println(cowry);
        }
    }
    @Test
    public void test03(){
        CowryDAO cowryDAO = new CowryDAOImpl();
        List<Cowry> cowries = cowryDAO.cowryList();
        for (Cowry cowry : cowries) {
            System.out.println(cowry);
        }
    }
    @Test
    public void test04(){
        CowryDAO cowryDAO = new CowryDAOImpl();
        List<Cowry> cowries = cowryDAO.queryCowryItemByPageNoAndPageSize(2, 3);
        for (Cowry cowry : cowries) {
            System.out.println(cowry);
        }
    }
    @Test
    public void test05(){
        CowryDAO cowryDAO = new CowryDAOImpl();
        int i = cowryDAO.cowryItemTotalRow();
        System.out.println("i= " + i);
    }
}
