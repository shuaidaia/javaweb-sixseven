# javaweb-sixseven

 ### 介绍 
 **一个纯原生的JavaWeb（servlet+jsp）商城项目** 
涵盖了JavaWeb所有的知识点，包括：servlet、过滤器、监听器、线程、事务管理和自定义分页等知识。

#### 软件架构
技术栈：
    前端：h5、c3、jq、ajax、jsp
    后端：JavaWeb、mysql

项目功能模块：首页、商城、购物车、评论吧、订单信息和后台管理

#### 效果图展示
SixSeven商城项目(Spring Boot + Vue)上线展示地址：[SixSeven商城](http://belly.love:8800)
![sixseven](https://belly-1317114531.cos.ap-guangzhou.myqcloud.com/public/sixseven.gif)

#### 安装教程

1.  git clone https://gitee.com/shuaidaia/javaweb-sixseven.git
2.  找到sixseven.sql文件，打开mysql数据库，恢复数据库文件(ps：开发时使用的是MySQL5.7)。
3.  使用idea，打开项目，找到druid.properties文件，根据自己的情况进行修改里面的url、username和password。
4.  配置tomcat
5.  原神启动！


#### 使用说明

1.  数据库文件中的管理员账号：belly 密码：1234567
2.  如果需要添加更多的管理员，可以去数据库中修改member表中的status字段，1为管理员，0为普通会员
3.  可以去扩展项目的后台用户管理功能
4.  [仓库](https://gitee.com/shuaidaia/projects)有项目升级成 [Spring Boot](https://gitee.com/shuaidaia/springboot-sixseven-backfend.git) + [Vue](https://gitee.com/shuaidaia/vue-sixseven-frontend.git) 版的，可当毕设交作业。
[前端代码](https://gitee.com/shuaidaia/vue-sixseven-frontend.git)
[后端代码](https://gitee.com/shuaidaia/springboot-sixseven-backfend.git)
