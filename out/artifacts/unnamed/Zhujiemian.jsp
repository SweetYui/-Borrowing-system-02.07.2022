<%--
  Created by IntelliJ IDEA.
  User: 18303
  Date: 19.07.2022
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    .inputarea{
      color:#008fb3;
      border-radius: 30px;
      position: relative;
      top:70px;
      border-color: deepskyblue;
      width:350px;
      margin:20px
    }
    .inputarea2{
      color:#008fb3;
      border-radius: 30px;
      position: relative;
      top:0px;
      border-color: deepskyblue;
      width:200px;
      margin:15px
    }

  </style>



</head>
<script>


  function Zhuce(){
    var cxs=document.getElementById("ghg");
    cxs.style.display = "block";
  }
  function Tijiaozhuce(){
    var c=document.getElementById("ghg");
    var p1=document.getElementById("psw1");
    var p2=document.getElementById("psw2");
    var nameUser=document.getElementById("UserName");
    var surname=document.getElementById("UserSName");
    var userid=document.getElementById("UserId");
    var mima=document.getElementById("mimageshicuowu");
    var flag=true;
    alert("aaa");
    if(p1.value.length<8||p2.value!=p1.value||p1.value===""||p2.value===""){

      mima.innerHTML="密码不能少于八位或者重复密码出错"
      mima.style.color="red";
      c.style.display="block";
      flag=false;
    }

    if(nameUser.value===""){

      document.getElementById("mingzi").innerHTML="名字不能为空";
      document.getElementById("mingzi").style.color="red";
      flag=false;
    }

    if(flag==true){
      alert("aa");


      $.post("/rigister.do","nameUser="+nameUser.value+"&surname="+surname.value+"&userid="+userid.value+"&p1="+p1.value,function(data){
        alert(data);
        // $("body").html(data)
        if (data === true){
          alert("注册成功")
          location.href = "/index.jsp"
          $("#ghg").attr("style","display:none")


        }


        else{
          alert("注册失败")
          $("#mingzi").attr({"style":"color:red;position:relative;left:20px"});
          $("#mingzi").html("您的id已存在，无需重复注册");
        }

      })
    }


  }


  function Login(){
    var username=$("#uName").val();
    var Passwort=$("#pwd").val();
    alert(username);
    $.post("/login.do","userName="+username+"&pwd="+Passwort,function(data){
      alert(data.emptyUser);
      // $("body").html(data)
      if (data === true){
        alert("登录成功")
        location.href = "/Zhujiemian3.jsp"
        $("#ErrorPasswort").attr("style","display:none")

      } else if(data===false){
        alert("登录失败")
        console.log($("#ErrorPasswort"))
        $("#ErrorPasswort").attr({"style":"position: relative;display: block; width:200px;height:40px;bottom: 550px;left:480px;color:red"})

      }
      else if(data.emptyUser==124){
        location.href = "/Zhujiemian2.jsp"
      }
      else {
        alert("账号不存在")
        $("#ErrorPasswort").attr({"style":"position: relative;display: block; width:200px;height:40px;bottom: 550px;left:480px;color:red",



        } )
        $("#ErrorPasswort").html("用户名不存在");

      }
    })

  }

function closed(){
    var Registera=document.getElementById("ghg");
    Registera.style.display="none";
}

</script>
<body>



<div class="haupt" style="width:700px; height: 547px;" >

  <img style="width:1300px; height: 590px" src="images/gaoqing.jpg"/>

  <div class="denglujiemian" style="background-color:#e5faff;opacity: 0.5;width:400px;height: 300px;position: relative;bottom: 450px;left:450px;border-radius: 30px;">
    <form>
    <input type="text" id="uName" placeholder="Username" name="username" value="username" class="inputarea"/>
    <input type="password" id="pwd" name="pwd" value="passwort" placeholder="Passwort" class="inputarea"/>
    <input type="button" onclick="Login()"  value="Login" style="font-weight: bold; border-color: #00aeef; color: #0c5460;border-radius: 30px;height: 40px;width: 70px;position: relative;top:100px;left:30px"/>

  </form> </div>

  <!--    密码错误提醒-->
  <div style="height: 10px"><span id="ErrorPasswort" style="position: relative;display: none; width:200px;height:1px;bottom: 550px;left:480px;color:red">密码错误，请重新输入！！</span></div>

  <strong style="font: italic 2em Georgia, serif;position: absolute;bottom: 30px;color: snow;font-size: 40px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspWillkommen beim Bibliotheksverwaltungssystem</strong>
  <p style="position: relative;left:570px;bottom: 497px">Hast du noch kein Konto1?<a href="#" style="color:dodgerblue" onclick="Zhuce()"><strong>&nbspRegister</strong></a></p>


  <!--隐藏div 点击注册才显示-->


  <div class="denglujiemian2" id="ghg" style="display: none; background-color:#e5faff;opacity: 1;width:400px;height: 400px;position: relative;bottom: 850px;left:450px;border-radius: 30px;">

    <form value="rigisterSubmit" style="position: relative;">
      <div>&nbsp</div>


      <span><strong style="font: italic 2em Georgia, serif;color: cornflowerblue;font-size: 15px">&nbsp&nbsp&nbsp&nbsp&nbsp Name:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</strong>
                    <input id="UserName" class="inputarea2" type="text" placeholder=" input your name" name="name" />
           <div id="mingzi" style="height: 1px;position: relative;bottom: 10px;left:20px"></div>
                </span>

      <span><strong style="font: italic 2em Georgia, serif;color: cornflowerblue;font-size: 15px">&nbsp&nbsp&nbsp&nbsp&nbspSurname: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</strong>
                    <input id="UserSName" class="inputarea2" type="text" placeholder=" input your surname" name=" surname" />
                </span>


      <span><strong style="font: italic 2em Georgia, serif;color: cornflowerblue;font-size: 15px">&nbsp&nbsp&nbsp&nbsp&nbspIdNumber: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</strong>
                    <input id="UserId" class="inputarea2" type="text" placeholder=" input your idnummer" name="idnumber"/>
                </span>

      <span><strong style="font: italic 2em Georgia, serif;color: cornflowerblue;font-size: 15px">&nbsp&nbsp&nbsp&nbsp&nbspPasswort:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </strong>
                    <input class="inputarea2" type="password" id="psw1" placeholder=" input your phonenumber" name="phonenumber"/>
        <div id="mimageshicuowu" style="height: 1px;position: relative;left:20px;bottom:10px;" ></div>  </span>


      <span><strong style="font: italic 2em Georgia, serif;color: cornflowerblue;font-size: 15px">&nbsp&nbsp&nbsp&nbspCommit&nbspPasswort: </strong>
                    <input class="inputarea2" id="psw2" type="password" placeholder=" input your EmailAdresse" name="EmailAdresse" />
                </span>




      <input class="inputarea2"    type="Button"  value="Submit" style="font-weight: bold;width:70px" onclick="Tijiaozhuce()" />

      <input class="inputarea2" type="button" onclick="closed()" value="Close" style="font-weight: bold;width:70px;position: relative;bottom: 20px;left:200px;color: red;border:3px solid red"/>

    </form>



  </div>
  <!--以上是隐藏div 点击注册才显示-->


</div>







</body>
</html>