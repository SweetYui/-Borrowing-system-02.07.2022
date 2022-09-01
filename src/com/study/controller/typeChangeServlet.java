package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.study.entity.Book;
import com.study.sql.BooksSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class typeChangeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String type = req.getParameter("type");
        String original = req.getParameter("original");




        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        BooksSql Books = new BooksSql();
        Book book = Books.getChangeType(type,original);

        if (book == null){
            str = "false";
        }


        else {
            str= JSON.toJSONString(book);

        }

        out.println(str);
        out.flush();
        out.close();

    }

}
