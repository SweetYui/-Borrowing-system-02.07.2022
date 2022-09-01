package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.study.entity.Book;
import com.study.entity.NewUserRigister;
import com.study.entity.User;
import com.study.sql.BooksSql;
import com.study.sql.RigisterSql;
import com.study.sql.UserSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class userInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String id = req.getParameter("id");





        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        UserSql Books = new UserSql();
        List<NewUserRigister> user = RigisterSql.getUserinfo(surname,name,id);

        if (user == null||user.size()==0){
            str = "false";
        }


        else {
            str= JSON.toJSONString(user);

        }

        out.println(str);
        out.flush();
        out.close();

    }
}
