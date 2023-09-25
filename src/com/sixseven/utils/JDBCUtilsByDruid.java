package com.sixseven.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * @author belly
 * @version 1.0
 */
public class JDBCUtilsByDruid {

    private static DataSource ds;

    //在静态代码块完成 ds初始化
    static {
        Properties properties = new Properties();
        try {
            //我们是web项目，他的工作目录在out下，所有文件的加载，需要使用类加载器
            properties.load(JDBCUtilsByDruid.class
                    .getClassLoader().getResourceAsStream("druid.properties"));
            ds = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    //数据池getConnection方法
    //事务管理
    private static ThreadLocal<Connection> threadLocalConn = new ThreadLocal<>();
    public static Connection getConnection(){
        if (threadLocalConn.get() == null){
            try {
                threadLocalConn.set(ds.getConnection());
                threadLocalConn.get().setAutoCommit(false);//设置手动提交，默认自动提交
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return threadLocalConn.get();
    }

    //提交事务
    public static void commit(){
        if (threadLocalConn.get() != null){
            try {
                threadLocalConn.get().commit();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    threadLocalConn.get().close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        //1.当提交过回滚后，都需要把在threadLocalConn的连接清除掉
        //2.不然，会造成threadLocalConn长时间持有该连接，会影响效率
        //3.也因为我们Tomcat底层使用的是线程池技术
        threadLocalConn.remove();
    }

    //事务回滚
    public static void rollback(){
        if (threadLocalConn.get() != null){
            try {
                threadLocalConn.get().rollback();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    threadLocalConn.get().close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        threadLocalConn.remove();
    }

    //关闭连接,在数据库连接池技术中，close 不是真的断掉连接
    //而是把使用的Connection对象放回连接池
    public static void close(ResultSet resultSet, Statement statement, Connection connection) {

        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}


