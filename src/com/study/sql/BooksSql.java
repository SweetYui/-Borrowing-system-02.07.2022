package com.study.sql;

import com.study.entity.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BooksSql {
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

    public Book getUser(String type, String name, String autor,int number){
        Connection connection = getConnection();

        String sql2="select name  from books where name =" + name;
        try {
            Statement statement = connection.createStatement();

            ResultSet r1=statement.executeQuery(sql2);
            if(!r1.next()) {
                String sql = "insert into books(type,name,autor,number)values("+type+","+name+","+autor+","+number+")";
                int resultSet = statement.executeUpdate(sql);

                if (resultSet > 0) {
                    return new Book(type, name, autor,number);
                }
                return null;
            }
            else {
                return null;

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getBook( String name){
        Connection connection = getConnection();
           name=name.replace("'","");//去掉字符串里不想要的单引号
        String sql8="select type,name,autor,number  from books where name like " +"'%"+ name+"%'";
        try {
            Statement statement = connection.createStatement();

            ResultSet r2=statement.executeQuery(sql8);
            List<Book> bookList=new ArrayList<>();
            while(r2.next()) {

                String Booksname= r2.getString("name");
                String Bookstype= r2.getString("type");
                String Booksautor= r2.getString("autor");
                int booknumber=Integer.parseInt(r2.getString("number"));

                   bookList.add(new Book(Bookstype,Booksname,Booksautor,booknumber) );


            }

                return bookList;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> getBookType(String type){
        Connection connection = getConnection();
        type=type.replace("'","");//去掉字符串里不想要的单引号
        String sql8="select type from books where type like " +"'%"+ type+"%'";
        try {
            Statement statement = connection.createStatement();

            ResultSet r2=statement.executeQuery(sql8);
            List<Book> bookList=new ArrayList<>();
            while(r2.next()) {


                String Bookstype= r2.getString("type");

                if(bookList.size()>0){
                    boolean flag=true;
                    for(Book a:bookList){
                        String b=a.getName();
                        if(b.equals(Bookstype)){
                            flag=false;
                        }

                    }
                    if(flag==true)bookList.add(new Book(Bookstype));

                }
                else {

                    bookList.add(new Book(Bookstype));

                }
            }

            return bookList;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Book getChange(String type, String name, String autor, int number, String variable){
        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();



                String sql18 = "Update books set name="+name+",type="+type+",autor="+autor+",number="+number+" where name="+variable;
                int resultSet2 = statement.executeUpdate(sql18);

                if (resultSet2 >0) {

                    return new Book(type, name, autor,number,variable);
                }
                return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Book getDelete(String name){
        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();



            String sql18 = "delete from Books where name="+name;
            int resultSet2 = statement.executeUpdate(sql18);

            if (resultSet2 >0) {
                return new Book(name);
            }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public  List<Book>getAllBookType(){
        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();



            String sql18 = "select type from Books ";
           ResultSet resultSet2 = statement.executeQuery(sql18);
              List<Book>bookTypeList=new ArrayList<>();

            while(resultSet2.next()) {
                String type=resultSet2.getString("type");
                boolean f=true;
             for(Book a:bookTypeList){

                 if(a.getName().equals(type)){
                     f=false;
                 }
             }
             if(f==true){
               bookTypeList.add(new Book(type));}


            }

            return bookTypeList;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public  Book getChangeType(String type,String original){
        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();



            String sql18 = "Update books set type="+type+" where type="+original;
            int resultSet2 = statement.executeUpdate(sql18);

            if (resultSet2 >0) {
                return new Book(type);
            }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Book getDeleteType(String type){
        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();



            String sql18 = "delete from Books where type="+type;
            int resultSet2 = statement.executeUpdate(sql18);

            if (resultSet2 >0) {
                return new Book(type);
            }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Book getBorrow(String a,int user){

        Connection connection = getConnection();


        try {
            Statement statement = connection.createStatement();

            String saq1="select*from borrow where BOOK_NAME="+a+" and USER_ID="+user;
            ResultSet re=statement.executeQuery(saq1);
            if(re.next())return null;
            String saq2="select*from borrow where USER_ID="+user;
            ResultSet re2=statement.executeQuery(saq2);
            int getStatus=0;
            while(re2.next()){
                 getStatus=re2.getInt("Status");
            }
             if(getStatus==0)return null;


            String sql18 = "select*from Books where name="+a;
            ResultSet resultSet2 = statement.executeQuery(sql18);

            if (resultSet2.next()) {
                int count=resultSet2.getInt("number")-1;
                String name=resultSet2.getString("name");
                String autor=resultSet2.getString("autor");
                String type=resultSet2.getString("type");
                if(count>=0){
                    String update="update books set number= "+count+" where name="+a;
                    int ifUpdate= statement.executeUpdate(update);
                    if(ifUpdate>0){
                        return new Book(type,name,autor,count);
                    }

                }

            }
            return null;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }

}
