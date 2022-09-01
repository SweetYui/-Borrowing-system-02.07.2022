<%--
  Created by IntelliJ IDEA.
  User: 18303
  Date: 19.07.2022
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎光临图书管理系统</title>

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Fast and English E-Learning Plattform</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->

    <link rel="shortcut icon" href="images/Yumao.jpg" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/Yumao.jpg">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>
    <script src="js/jquery-1.11.0.min.js"></script>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <style>
        .tiao{

            border-color: snow;

            margin:10px;
            border-bottom:1px solid grey;
            width:150px;
            position: relative;
            right: 21px;
            padding: 10px;



        }
        .TushuGuanli{
            position: relative;
            left:3px;
            bottom:430px;
            width:150px;
            height: 232px;
            background-color: #b3d7ff;
            border:1px solid grey;
            border-radius: 10px;
            float: outside;
            opacity: 0.5;


        }
        .scriptText{
            width:200px;
            height:100px;
            border-radius: 20px;
            position: relative;

        }
        .btsize{
            width:74px;
            height: 30px;
            border-radius: 10px;
            margin-left: 3px;
        }
        .txsize{
            width:300px;
            border-radius: 10px;


        }
        td{
            border-color: black;
            border:2px
        }
    </style>

















</head>
<body>

<div id="mainJiemian"  >


    <div>
        <div style="background-color: black;position: relative;height: 50px">
            <p ><strong style="font: italic 2em Georgia, serif;color: snow;font-size: 15px;position: relative;top:10px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspWelcome to Liberay!!</strong></p>
            <span style="position: relative;left:1170px;bottom: 10px">

      <div class="dropdown" style="position: relative;bottom: 25px;background-color: #ff06d6;width:1px;height: 0px">
        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 84px;height: 35px">
         <strong> Admin</strong>
          <span class="caret" style="background-color: #ff06d6"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1"  >

          <li><a href="#">User</a></li>

        </ul>
          </button >
      </div>
         </span>
        </div>



    </div>

    <img src="images/yekong.jpg" style="position: relative;width:1270px;height:550px;bottom: 0px"/>

    <div style="position: relative;bottom: 0px">
        <div class="TushuGuanli" style="">
            <div class="tiao" style=""><a href="#">&nbsp&nbsp<strong>图书管理</strong>>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
            <div class="tiao"><a href="#">&nbsp&nbsp<strong>读者管理</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
            <div class="tiao"><a href="#">&nbsp&nbsp<strong>图书分类管理</strong>&nbsp&nbsp&nbsp></a></div>
            <div class="tiao"><a href="#">&nbsp&nbsp<strong>图书借阅信息</strong>&nbsp&nbsp&nbsp></a></div>
            <div class="tiao"><a href="#">&nbsp&nbsp<strong>图书归还信息</strong>&nbsp&nbsp&nbsp></a></div>
        </div>

        <div class="scriptText" style="position: relative;bottom: 698px;left:950px" > <div style="background-color:darkgrey;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的编号和名称，查询查询书的基本信息，并且添加，修改删除图书。</div></div>
        <div class="scriptText" style="position: relative;bottom: 800px;left:300px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>图书分类管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的分类名称查询信息，并且增删改书的分类信息</div></div>
        <div class="scriptText" style="position: relative;bottom: 690px;left:300px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>图书借阅</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">展示所有正在借阅的书</div></div>
        <div class="scriptText" style="position: relative;bottom: 997px;left:630px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书归还</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">展示所有已归还的书</div></div>
        <div class="scriptText" style="position: relative;bottom: 887px;left:630px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>读者管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据读者的账号姓名查看读者信息，并且增删改读者</div></div>
    </div>

    <div style="background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none"><div style="background-color: black;height: 40px">查询</div><span>图书名称: <input type="text"/><input type="button" value="Search"/></span></div>
    <div style="background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none"><div style="background-color: black;height: 40px">查询</div><span>图书名称: <input type="text"/><input type="button" value="Search"/></span></div>
    <div id="booktype" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: block">
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="z-index:999;position: relative;top:10px;left:8px"><strong>书籍类型名称</strong>: <input class="txsize" type="text"/>
    <input class="btsize" type="button" value="Search"/>
      <input class="btsize" type="button" style="position: relative;left:290px" value="add Type"/></span>

        <table border="1" style="position: relative;left:70px;top:20px;">
            <th style="border:1px solid black;width:110px">类型名称:</th>
            <th style="border:1px solid black;width:110px">名</th>
            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">

                <td style="border:1px solid black;height: 30px">包含图书:</td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修改</a>|<a href="#" style="color:red">删除</a></td>
            </tr>
        </table>
        <img src="images/tushuguan.jpg" style=" width:500px;height:290px;position: relative;left:400px;bottom: 90px;border-radius: 0px;opacity: 0.5"/>
    </div>






    <div id="users" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none">
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="position: relative;top:10px;left:8px"><strong>读者姓名</strong>: <input class="txsize" type="text"/>
    <input class="btsize" type="button" value="Search"/>
      <input class="btsize" type="button" style="position: relative;left:290px" value="add User"/></span>

        <table border="1" style="position: relative;left:30px;top:20px;">
            <th style="border:1px solid black;width:110px">姓</th>
            <th style="border:1px solid black;width:110px">名</th>
            <th style="border:1px solid black;width:110px">id</th>
            <th style="border:1px solid black;width:110px">借阅状态</th>
            <th style="border:1px solid black;width:110px">是否逾期</th>
            <th style="border:1px solid black;width:110px">逾期本数</th>
            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修改</a>|<a href="#" style="color:red">删除</a></td>
            </tr>
        </table>
    </div>




    <div id="books" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none">
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="position: relative;top:10px;left:8px"><strong>图书名称</strong>: <input class="txsize" type="text"/>
      <input class="btsize" type="button" value="Search"/></span>
        <input class="btsize" type="button" style="position: relative;left:290px" value="add book"/>

        <table border="1" style="position: relative;left:30px;top:10px;">
            <th style="border:1px solid black;width:110px">图书号</th>
            <th style="border:1px solid black;width:110px">图书类型</th>
            <th style="border:1px solid black;width:110px">图书名称</th>
            <th style="border:1px solid black;width:110px">作者名称</th>
            <th style="border:1px solid black;width:110px">出版社</th>
            <th style="border:1px solid black;width:110px">总数量</th>
            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修改</a>|<a href="#" style="color:red">删除</a></td>
            </tr>
        </table>





    </div>
</div>



</body>
</html>
