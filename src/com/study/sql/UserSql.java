package com.study.sql;

import com.study.entity.User;

import java.sql.*;

public class UserSql {

    public Connection getConnection(){
        try {
           String Driver="com.mysql.cj.jdbc.Driver";
           String url="jdbc:mysql://localhost:3306/uni-hamburg";
           String user="root";
           String password="12345678";
            Class.forName(Driver);
            Connection conn = DriverManager.getConnection(url,user,password);
            return conn;
        } catch (ClassNotFoundException e) {
            System.out.println("类找不到");
            return null;
        } catch (SQLException e) {
            System.out.println("SQL异常");
            return null;
        }
    }

    public User getUserByPwd(String userName,String pwd){
        Connection connection = getConnection();
        String sql = "select id,pwd,username from userinfo where userName =? ";//这是一个SQL！！！！！！！！！！

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,userName);//1表示第一格问号！！！！！！！！！！！！！！11
            ResultSet resultSet = statement.executeQuery();



            if (resultSet.next()){
                String id = resultSet.getString("id");
                String userName1 = resultSet.getString("userName");
                String pwd1 = resultSet.getString("pwd");


                if (pwd1.equals(pwd)){
                    System.out.println("密码正确");
                    return new User(Integer.parseInt(id),userName1,pwd1);
                }

                else {
                    System.out.println("密码错误");
                    return null;
                }
            }
            else{
                return new User(0,"","");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        UserSql userSql = new UserSql();
        User zhangSan = userSql.getUserByPwd("184", "123456789");
        if (zhangSan == null) {

            System.out.println("登录失败");

        } else {
            System.out.println("登录成功， 跳转到首页");
        }
    }
}
