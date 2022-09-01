package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.study.entity.Book;
import com.study.entity.NewUserRigister;
import com.study.sql.BooksSql;
import com.study.sql.RigisterSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Delete2Servlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        RigisterSql r1= new RigisterSql();
        NewUserRigister book = r1.getDelete2(id);

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
