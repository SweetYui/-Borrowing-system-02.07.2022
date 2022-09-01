package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.study.entity.Book;
import com.study.entity.User;
import com.study.entity.borrowBookInfo;
import com.study.sql.BooksSql;
import com.study.sql.BorrowSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class showBorrowServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();//能拿到session就是能拿到id和密码 需要session.get("username"),在用正常的方式获取书的信息，然后把它们放在borrow表里，再查询我的借阅去borrow表里查，只能看自己的
        User username = (User) session.getAttribute("username");

        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        BorrowSql borrowBook =new BorrowSql();
        List<borrowBookInfo> borrowBooks=borrowBook.getBorrowUser(username.getId());

        if ( borrowBooks == null){
            str = "false";
        }


        else {
            str= JSON.toJSONString(borrowBooks);

        }

        out.println(str);
        out.flush();
        out.close();

    }

}
