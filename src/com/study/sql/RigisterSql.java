package com.study.sql;

import com.study.entity.NewUserRigister;
import com.study.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RigisterSql {

    public static Connection getConnection(){
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

    public NewUserRigister getUser(String name, String surname, int id, int passwort){
        Connection connection = getConnection();
        String sql = "select id  from rigister where id ='" + id+ "'";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);//Query查询
            if(!resultSet.next()){

                String sql2="insert into rigister(id,name,surname,password) values("+id+",'"+name+"','"+surname+"',"+passwort+")";
               int duima= statement.executeUpdate(sql2);

                 if(duima<1) return null;
                 else {
                     String sql3="insert into userinfo(id,username,pwd)values( "+id+",'"+id+"',"+passwort+")";
                     int duima2= statement.executeUpdate(sql3);
                     return new NewUserRigister(name, surname, id, passwort);
                 }



            }
            return null;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static List<NewUserRigister> getUserinfo(String name, String surname, String id){
        Connection connection = getConnection();
        String sql = "select surname,name, id,password  from rigister where surname="+surname+"or name="+name+"'";
       List<NewUserRigister> users=new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);//Query查询
            while(resultSet.next()){
              String sur=resultSet.getString("surname");
              String na=resultSet.getString("name");
              int ids=resultSet.getInt("id");
              int pw=resultSet.getInt("password");
             users.add(new NewUserRigister(sur,na,ids,pw));



            }
            return users;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static NewUserRigister getUserinfo2(String name, String surname, int id,int password,String variable){
        Connection connection = getConnection();
        String sql = "update rigister set name="+name+",surname="+surname+",id="+id+",password="+password+" where surname="+variable;

        try {
            Statement statement = connection.createStatement();
            int resultSet = statement.executeUpdate(sql);//Query查询

         if(resultSet>=0){

             String sql2 = "update userinfo set id="+id+",username="+id+",pwd="+password+" where id="+id;
             int resultSet2 = statement.executeUpdate(sql2);
            if(resultSet2>=0){
             return new NewUserRigister();}}

         return null;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static NewUserRigister getDelete2 (int id){
        Connection connection = getConnection();
        String sql = "delete from rigister where id="+id;

        try {
            Statement statement = connection.createStatement();
            int resultSet = statement.executeUpdate(sql);//Query查询

            if(resultSet>=0){

                String sql2 = "delete from userinfo where id="+id;
                int resultSet2 = statement.executeUpdate(sql2);
                if(resultSet2>=0){
                    return new NewUserRigister();}}

            return null;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



}
