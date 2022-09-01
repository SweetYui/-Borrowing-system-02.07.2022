package com.study.controller;

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

public class RigisterServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameUser = req.getParameter("nameUser");
        String surname = req.getParameter("surname");
        int userid = Integer.parseInt(req.getParameter("userid"));
        int p1= Integer.parseInt(req.getParameter("p1"));


        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        RigisterSql userSql = new RigisterSql();
        NewUserRigister userByPwd = userSql.getUser(nameUser, surname,userid,p1);

        if (userByPwd == null){
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
