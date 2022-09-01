package com.study.controller;




import com.study.entity.User;
import com.study.sql.UserSql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getParameter("username");
        String pwd = (String) req.getParameter("pwd");
        System.out.println("进这里");
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        String pwd = req.getParameter("pwd");


        resp.setContentType("text/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String str = "";
        UserSql userSql = new UserSql();
        User userByPwd = userSql.getUserByPwd(username, pwd);

        if (userByPwd == null){
            str = "false";
        }
        else if(userByPwd.getId()==0){
            str="{\"emptyUser\":123}";
        }
        else if(userByPwd.getId()<4&&userByPwd.getId()>0){
            str="{\"emptyUser\":124}";
        }

        else {
            str = "true";
            HttpSession session = req.getSession();//var 这是一个Map
            session.setAttribute("username",userByPwd);



        }

        out.println(str);
        out.flush();
        out.close();

    }



}