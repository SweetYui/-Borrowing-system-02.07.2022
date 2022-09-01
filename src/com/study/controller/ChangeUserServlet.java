package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.study.entity.NewUserRigister;
import com.study.entity.User;
import com.study.sql.RigisterSql;
import com.study.sql.UserSql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ChangeUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        int id = Integer.parseInt(req.getParameter("id"));
        int password = Integer.parseInt(req.getParameter("password"));
        String variable=req.getParameter("variable");





        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        RigisterSql newUser = new RigisterSql();
       NewUserRigister user = RigisterSql.getUserinfo2(surname,name,id,password,variable);

        if (user == null){
            str = "false";
        }


        else {
            str= "true";

        }

        out.println(str);
        out.flush();
        out.close();

    }

}
