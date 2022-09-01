package com.study.sql;

import com.alibaba.fastjson.JSON;
import com.study.entity.Book;
import com.study.entity.borrowBookInfo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.study.sql.RigisterSql.getConnection;

public class BorrowSql {
    public borrowBookInfo getBorrow(String  bookName,int userId,String borrowDate,String deadLine){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();
            String sq1="select*from borrow where BOOK_NAME="+bookName+" and USER_ID="+userId;
            ResultSet ex=statement.executeQuery(sq1);
            if(ex.next())return null;


            String sql18 = "insert into borrow(BOOK_NAME,USER_ID,BORROW_DATE,UNTIL_DATE,STATUS) values("+bookName+","+userId+",'"+borrowDate+"','"+deadLine+"',"+1+")";
            int resultSet2 = statement.executeUpdate(sql18);

           if(resultSet2>0){
               return new borrowBookInfo(bookName,userId,borrowDate,deadLine,1);
           }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

    public List<borrowBookInfo> getBorrowUser(int userId){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();

            long date=new Date().getTime();
            SimpleDateFormat s=new SimpleDateFormat("yy-MM-dd-HH");
            String d=s.format(date);




            String sql18 = "select*from borrow where USER_ID= "+userId;
            ResultSet resultSet2 = statement.executeQuery(sql18);
            List<borrowBookInfo> userInfos=new ArrayList<>();
            while(resultSet2.next()){
                String bookName= resultSet2.getString("BOOK_NAME");
                int userid=resultSet2.getInt("USER_ID");
               long today=new Date().getTime();
               SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd-HH");

                String borrowDate= ss.format(today);
                String deadline= resultSet2.getString("UNTIL_DATE");
                int status=resultSet2.getInt("Status");
                Integer i=borrowDate.compareTo(deadline);
                if(i>0){
                    status=0;
                }

               userInfos.add(new borrowBookInfo(bookName,userid,borrowDate,deadline,status));
            }
            return userInfos;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

    public List<borrowBookInfo> getBorrowUserAdmin(){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();
            String sql18 = "select*from borrow";
            ResultSet resultSet2 = statement.executeQuery(sql18);
            List<borrowBookInfo> userInfos=new ArrayList<>();
            while(resultSet2.next()){
                String bookName= resultSet2.getString("BOOK_NAME");
                int userid=resultSet2.getInt("USER_ID");
                long today=new Date().getTime();
                SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd-HH");

                String borrowDate= ss.format(today);
                String deadline= resultSet2.getString("UNTIL_DATE");
                int status=resultSet2.getInt("Status");
                Integer i=borrowDate.compareTo(deadline);
                if(i>0){
                    status=0;
                }

                userInfos.add(new borrowBookInfo(bookName,userid,borrowDate,deadline,status));
            }
            return userInfos;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

    public borrowBookInfo getGiveBackInfo(String  bookName,int id){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();
            String sql18 = "select number from books where name= "+bookName;
            ResultSet sq1=statement.executeQuery(sql18);
            int setNumber=0;
            if(sq1.next()){
                int count=sq1.getInt("number")+1;
                String sq2="update books set number="+count+" where name="+bookName;
                setNumber= statement.executeUpdate(sq2);
            }
            String sq3="delete from borrow where BOOK_NAME="+bookName+" and USER_ID="+id;
            int resultSet2 = statement.executeUpdate(sq3);

            String delazInfo="select * from delay where BOOK_NAME="+bookName+" and USER_ID="+id;
            ResultSet sq33=statement.executeQuery(delazInfo);
            if(sq33.next()){
                String bsg="delete from delay where BOOK_NAME="+bookName+" and USER_ID="+id;
                int si= statement.executeUpdate(bsg);
            }

            
            if(resultSet2>0&&setNumber>0){
                return new borrowBookInfo();
            }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

}
