package com.study.controller;

import com.study.entity.Book;
import com.study.entity.User;
import com.study.sql.BooksSql;
import com.study.sql.UserSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class libServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String name = req.getParameter("name");
        String autor = req.getParameter("autor");
        int number = Integer.parseInt(req.getParameter("number"));


        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        BooksSql Books = new BooksSql();
        Book book = Books.getUser(type, name,autor,number);

        if (book == null){
            str = "false";
        }


        else {
            str = "true";
        }

        out.println(str);
        out.flush();
        out.close();

    }

}
