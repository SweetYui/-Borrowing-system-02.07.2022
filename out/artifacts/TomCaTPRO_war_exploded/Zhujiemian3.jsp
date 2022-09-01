<%--
  Created by IntelliJ IDEA.
  User: 18303
  Date: 19.07.2022
  Time: 18:34
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

      margin:20px;
      border-bottom:1px solid grey;
      width:150px;
      position: relative;
      right: 21px;




    }
    .TushuGuanli2{
      position: relative;
      left:3px;
      bottom:430px;
      width:150px;
      height: 140px;
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
         <strong> User</strong>
          <span class="caret" style="background-color: #ff06d6"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1"  >

          <li><a href="#">Admin</a></li>

        </ul>
        </button >
      </div>
         </span>
    </div>



  </div>

  <img src="images/yekong.jpg" style="position: relative;width:1270px;height:550px;bottom: 0px"/>


</div>
<div class="TushuGuanli2" style="">
  <div class="tiao" style=""><a href="#">&nbsp&nbsp<strong>图书查询</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
  <div class="tiao"><a href="#">&nbsp&nbsp<strong>借阅信息</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
  <div class="tiao"><a href="#">&nbsp&nbsp<strong>借阅历史</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp></a></div>

</div>

<div class="scriptText" style="position: relative;bottom: 530px;left:750px" > <div style="background-color:darkgrey;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书查询</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的编号和名称，查询查询书的基本信息。</div></div>
<div class="scriptText" style="position: relative;bottom: 730px;left:380px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>借阅信息</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">查询图书的基本信息，借阅日期，截止还书日期，超期天数等</div></div>
<div class="scriptText" style="position: relative;bottom: 620px;left:380px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>借阅历史</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">查询自己以往的借阅历史</div></div>


</body>
</html>