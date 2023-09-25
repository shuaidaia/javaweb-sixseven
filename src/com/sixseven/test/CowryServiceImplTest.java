package com.sixseven.test;

import com.sixseven.bean.Cowry;
import com.sixseven.bean.Page;
import com.sixseven.service.CowryService;
import com.sixseven.service.impl.CowryServiceImpl;
import com.sixseven.utils.JDBCUtilsByDruid;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class CowryServiceImplTest {
    @Test
    public void test01(){
        CowryService cowryService = new CowryServiceImpl();
        List<Cowry> cowries = cowryService.cowryListByStatus(1);
        for (Cowry cowry : cowries) {
            System.out.println(cowry);
        }
    }
    @Test
    public void test02(){
        CowryService cowryService = new CowryServiceImpl();
        Cowry Mac = new Cowry(null, "Mate 30 RS", new BigDecimal(99),
                "assets/img/800_800_3F2DBA93088E337403F70A88956883E586C4B514B56D5399mp.png", 100, 0, 2);
        boolean b = cowryService.addCowry(Mac);
        JDBCUtilsByDruid.commit();
        System.out.println(b);
    }

    @Test
    public void test03(){
        CowryService cowryService = new CowryServiceImpl();
        Page<Cowry> page = cowryService.page(1, 4);
        List<Cowry> items = page.getItems();
        for (Cowry item : items) {
            System.out.println(item);
        }
    }
}
