package com.study.sql;

import com.study.entity.DelayBookInfo;
import com.study.entity.borrowBookInfo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.study.sql.RigisterSql.getConnection;

public class DelaySql {

    public DelayBookInfo getDelayUser(String  bookName, int userId,int count,String a,String a1){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();
            String sq1="select TIMES  from delay where BOOK_NAME="+bookName+" and USER_ID="+userId;
            ResultSet ex=statement.executeQuery(sq1);

            if(ex.next()) {

                count=ex.getInt("TIMES")+1;

                String sql23="Select Status from borrow where BOOK_NAME="+bookName+" and USER_ID="+userId;


                ResultSet xse=statement.executeQuery(sql23);
                int g=9;

                if(xse.next()){
                    g=xse.getInt("Status");
                    if(g!=0)return null;
                }
                String sql13="UPDATE borrow set BORROW_DATE='"+a+"',UNTIL_DATE='"+a1+"',Status="+1+" where USER_ID="+userId+" and BOOK_NAME="+bookName;
                int re2= statement.executeUpdate(sql13);
                String sql20="update delay set TIMES="+count+" where USER_ID="+userId+" and BOOK_NAME="+bookName;
                int re3= statement.executeUpdate(sql20);

                if(re2>0&&re3>0&&count<3&&g==0) return new DelayBookInfo(bookName,userId,count);
                if(count>=3)return null;
            };



            

            String sql23="Select Status from borrow where BOOK_NAME="+bookName+" and USER_ID="+userId;
            ResultSet xse=statement.executeQuery(sql23);
            int g=9;

            if(xse.next()){
                g=xse.getInt("Status");
                if(g!=0)return null;
            }
            String sql12="UPDATE borrow set BORROW_DATE='"+a+"',UNTIL_DATE='"+a1+"',Status="+1+" where USER_ID="+userId+" and BOOK_NAME="+bookName;
            int re= statement.executeUpdate(sql12);
            String sql18 = "insert into delay(BOOK_NAME,USER_ID,Times) values("+bookName+","+userId+","+count+")";
            int resultSet2 = statement.executeUpdate(sql18);
            if(resultSet2>0&&re>0&&g==0){
                return new DelayBookInfo(bookName,userId,count);
            }

            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

}
