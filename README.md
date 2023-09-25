# javaweb-sixseven

#### 介绍
一个纯原生的JavaWeb（servlet+jsp）商城项目
#### 软件架构
项目功能模块：首页、商城、购物车、评论吧、订单信息和后台管理

#### 安装教程

1.  git clone https://gitee.com/shuaidaia/javaweb-sixseven.git
2.  找到sixseven.sql文件，打开mysql数据库，恢复数据库文件。
3.  使用idea，打开项目，找到druid.properties文件，
根据自己的情况进行修改里面的url、username和password。

#### 使用说明

1.  数据库文件中的管理员账号：belly 密码：1234567
2.  如果需要添加跟多的管理员，可以去数据库中修改member表中的status字段，1为管理员，0为普通会员
3.  可以扩展项目后台用户管理功能
