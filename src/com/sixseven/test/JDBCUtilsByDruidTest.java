package com.sixseven.test;

import com.sixseven.utils.JDBCUtilsByDruid;
import org.junit.jupiter.api.Test;

import java.sql.Connection;

/**
 * @author Belly
 * @version 1.1.0
 */
public class JDBCUtilsByDruidTest {
    @Test
    public void test(){
        Connection connection = JDBCUtilsByDruid.getConnection();
        System.out.println("connection= " + connection);
        JDBCUtilsByDruid.close(null, null, connection);
    }
}
