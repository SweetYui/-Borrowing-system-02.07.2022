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
<script>


  function sousuo(){
    alert("sdf");
    var c=$("#booktype2").val();
    $.post("/userBookSearch.do","name='"+c+"'",function(data){
      if(data==false){
        alert("Das Powerbank,das Sie gerade suchen,existiert nicht")
      } else{
        alert("true");
        for(var i=0;i<data.length;i++) {
          var datas=data[i];
          var table = document.getElementById("B5");
          var child = document.createElement("tr");
          table.appendChild(child);
          var enkel1 = document.createElement("td");
          enkel1.innerHTML =datas.type;
          child.appendChild(enkel1);

          var enkel2 = document.createElement("td");
          var c=datas.name;
          enkel2.innerHTML =datas.name;
          child.appendChild(enkel2);

          var enkel3 = document.createElement("td");
          enkel3.innerHTML =datas.autor;
          child.appendChild(enkel3);

          var enkel4 = document.createElement("td");
          enkel4.innerHTML =datas.number;
          child.appendChild(enkel4);

          var enkel5 = document.createElement("td");
           enkel5.innerHTML ='&nbsp&nbsp<a onclick="borrow(\''+c+'\')" href="#">借阅</a>';//注意 不然会有错误
          child.appendChild(enkel5);
        }
      }
    })

  }


  function searchBook(){
    var c=document.getElementById("booktype");
    c.style.display="block";
    closeW2();
  }
  function closeW(){
    var c=document.getElementById("booktype");
    c.style.display="none";

  }

  function borrow(a){
    alert(a);
    var r = confirm("您确定借阅吗？");
    if (r == false) {
alert("不借瞎按什么？？")
    } else {


    $.post("/borrow.do","name='"+a+"'",function(rsp){

        if(rsp==false){
          alert("Die Ausleihe ist fehlgeschlagen, Sie leihen sich ein Buch aus oder Sie haben eine überfällige Powerbank");
        }
        else{
          alert("Erfolgreich ausgeliehen");
          var bookName=rsp.bookName;
          var userId=rsp.userId;
          var borrowDate=rsp.borrowDate;
          var deadLine=rsp.deadLine;
          var status=rsp.status;
          var statusSitu="";
          if(status==1){
            statusSitu="Nicht überfällig"
          }
          else{
            statusSitu="überfällig" }
            var a1 =bookName;
            var a2=userId;
            var a3=orrowDate;
            var a4=deadLine;
            var a5=statusSitu;
            var b1 = document.getElementById("B7");
            var optionEle = document.createElement("tr");

            b1.appendChild(optionEle);
            var smallop = document.createElement("td");
            smallop.innerHTML = a1;
            smallop.style.border = "1px solid black";
            optionEle.appendChild(smallop);

            var smallop2 = document.createElement("td");
            smallop2.innerHTML = a2;
            smallop2.style.border = "1px solid black";
            optionEle.appendChild(smallop2);

            var smallop3 = document.createElement("td");
            smallop3.innerHTML = a3;
            smallop3.style.border = "1px solid black";
            optionEle.appendChild(smallop3);

            var smallop5 = document.createElement("td");
            smallop5.innerHTML = a4;
            smallop5.style.border = "1px solid black";
            optionEle.appendChild(smallop5);

            var smallop6 = document.createElement("td");
            smallop6.innerHTML = a5;
            smallop6.style.border = "1px solid black";
            optionEle.appendChild(smallop6);


            var smallop4 = document.createElement("td");

            smallop4.innerHTML = '<a onclick="delayGiveBack(\''+a1+'\')" href="#">延期</a>';
            smallop4.style.border = "1px solid black";
            optionEle.appendChild(smallop4);

            optionEle.style.border = "1px solid black";
          }




  })

  }}

  function delayGiveBack(a){
    $.post("/delayGiveBack.do","name='"+a+"'",function(rsp){

      if(rsp==false){
        alert("您的延时以达到上限");
      }
      else{
        alert("以为您延时");
      }


    })
  }

  function openas(){
    var c=document.getElementById("showBorrowedBook2");
    c.style.display="block";
    closeW();
  }

  function closeW2(){
    var c=document.getElementById("showBorrowedBook2");
    c.style.display="none";
  }

  function showAllBorrowedBooks(){
    alert("show");
    $.post("/showborrow.do",function (data){

      if(data==false){
        alert("您还没有借阅任何书哦");
      }
      else{
        alert("您节的书记的早日归还");
        for(var i=0;i<data.length;i++){

        var rsp=data[i];
        var bookName=rsp.bookName;
        var userId=rsp.userId;
        var borrowDate=rsp.borrowDate;
        var deadLine=rsp.deadLine;
        var status=rsp.status;
        var statusSitu="";
        if(status==1){
          statusSitu="未逾期";
        }
        else{
          statusSitu="已逾期";
        }
        var a1 =bookName;
        var a2=userId;
        var a3=borrowDate;
        var a4=deadLine;
        var a5=statusSitu;
        var b1 = document.getElementById("B7");
        var optionEle = document.createElement("tr");

        b1.appendChild(optionEle);
        var smallop = document.createElement("td");
        smallop.innerHTML = a1;
        smallop.style.border = "1px solid black";
        optionEle.appendChild(smallop);

        var smallop2 = document.createElement("td");
        smallop2.innerHTML = a2;
        smallop2.style.border = "1px solid black";
        optionEle.appendChild(smallop2);

        var smallop3 = document.createElement("td");
        smallop3.innerHTML = a3;
        smallop3.style.border = "1px solid black";
        optionEle.appendChild(smallop3);

        var smallop5 = document.createElement("td");
        smallop5.innerHTML = a4;
        smallop5.style.border = "1px solid black";
        optionEle.appendChild(smallop5);

        var smallop6 = document.createElement("td");
        if(a5=="未逾期"){
        smallop6.innerHTML = a5;
        smallop6.style.border = "1px solid black";}
        else{
          smallop6.innerHTML = a5;
          smallop6.style.border = "1px solid black";
          smallop6.style.color="red";
        }
        optionEle.appendChild(smallop6);


          var enkel5 = document.createElement("td");
          enkel5.innerHTML ='&nbsp&nbsp<a onclick="delayGiveBack(\''+a1+'\')" href="#">延时归还</a>';//注意 不然会有错误
          optionEle.appendChild(enkel5);



        optionEle.style.border = "1px solid black";
      }}

    })
  }

</script>
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
  <div class="tiao" style=""><a onclick="searchBook()" href="#">&nbsp&nbsp<strong>图书查询</strong>&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp</a></div>
  <div class="tiao"><a  onclick="openas()" href="#">&nbsp&nbsp<strong>借阅信息</strong>&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp</a></div>
  <div class="tiao"><a href="#">&nbsp&nbsp<strong>借阅历史</strong>&nbsp&nbsp&nbsp>&nbsp&nbsp&nbsp</a></div>

</div>

<div class="scriptText" style="position: relative;bottom: 530px;left:750px" > <div style="background-color:darkgrey;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书查询</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的编号和名称，查询查询书的基本信息。</div></div>
<div class="scriptText" style="position: relative;bottom: 730px;left:380px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>借阅信息</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">查询图书的基本信息，借阅日期，截止还书日期，超期天数等</div></div>
<div class="scriptText" style="position: relative;bottom: 620px;left:380px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>借阅历史</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">查询自己以往的借阅历史</div>


  <div id="booktype" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 325px;width:900px;height: 330px;right:90px;display: none">
    <div style="height: 1px"><span style="position:relative;left:876px;border-top-right-radius: 10px"><input style="border-top-right-radius: 10px" onclick="closeW()" type="button" value="X"/></span></div>
    <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
    <span style="z-index:999;position: relative;top:10px;left:8px"><strong>书籍类型名称</strong>: <input id="booktype2" class="txsize" type="text"/>
    <input onclick="sousuo()" class="btsize" type="button" value="Search"/>
     </span>

    <table id="B5" border="1" style="position: relative;left:40px;top:20px;">
      <th id="B1" style="border:1px solid black;width:110px">类型:</th>
      <th id="B2" style="border:1px solid black;width:110px">书名</th>
      <th id="B3" style="border:1px solid black;width:110px">作者</th>
      <th id="B35" style="border:1px solid black;width:110px">数量</th>
      <th id="B4" style="border:1px solid black;width:110px">操作</th>
      <tr  style="border:1px solid black">

        <td id="type0" style="border:1px solid black;height: 30px"></td>
        <td id="name0" style="border:1px solid black;height: 30px"></td>
        <td id="autor0" style="border:1px solid black;height: 30px"></td>
        <td id="number0" style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp借阅</a></td>
      </tr>
    </table>

  </div>


  <div id="showBorrowedBook2" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 320px;width:900px;height: 330px;right:90px;display: none">
    <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
    <span style="position: relative;top:10px;left:8px">
      <input onclick="showAllBorrowedBooks()" class="btsize" type="button" value="showAll"/></span>

    <div style="height:1px;border-radius:10px;position:relative;left:872px;bottom:71px  " onclick="closeW2()"><input type="button" value="X"/></div>
    <table id="B7" border="1" style="position: relative;left:30px;top:20px;">
      <th style="border:1px solid black;width:110px">书籍名称</th>
      <th style="border:1px solid black;width:110px">借阅者id</th>
      <th style="border:1px solid black;width:110px">当前日期</th>
      <th style="border:1px solid black;width:110px">还书截止日期</th>
      <th style="border:1px solid black;width:110px">借阅状态</th>
      <th style="border:1px solid black;width:110px">操作</th>
      <tr style="border:1px solid black">
        <td style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"></td>
        <td style="border:1px solid black;height: 30px"><a href="#" style="padding-left:20px;color:midnightblue">延时归还</a></td>
      </tr>
    </table>





  </div>

</div>


</body>
</html>