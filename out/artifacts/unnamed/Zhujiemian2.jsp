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
            bottom:433px;
            width:150px;
            height: 229px;
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

<script>
    function tushuguanli(){
        var book=document.getElementById("booktype");
        book.style.display="block";
        closeInsert();
        closeW2();
        closeW4();
        closeW5();

    }
    function typeManager(){
        var book=document.getElementById("books");
        book.style.display="block";
        closeInsert();
        closeW2();
        closeW();
        closeW3();

        closeW5();

    }
    function usersVerwalten(){
        var openUser=document.getElementById("users");
        openUser.style.display="block";
        closeInsert();
        closeW();
        closeW4();

    }
    function closeW(){
        var booka=document.getElementById("booktype");
        booka.style.display="none";




    }
    function closeW2(){

        var booka2=document.getElementById("xiugaiBook");
        booka2.style.display="none";
        var booka3=document.getElementById("users");
        booka3.style.display="none";



    }
    function closeW3(){
        var users=document.getElementById("xiugaiUser");
        users.style.display="none";
        var users2=document.getElementById("xiugaiType");
        users2.style.display="none";
    }

    function closeW4(){
        var users=document.getElementById("books");
        users.style.display="none";
        var us2=document.getElementById("xiugaiType");
        us2.style.display="none";

    }
    function closeW5(){
        var users=document.getElementById("showBorrowedBook");
        users.style.display="none";
    }
    function addBk(){
        var bookk=document.getElementById("addBookTanchuang1");
        bookk.style.display="block";
    }
    function closeInsert(){
        var bookk2=document.getElementById("addBookTanchuang1");

        $("#Booksname").val("");
        $("#Bookstype").val("");
        $("#Booksautor").val("");
        $("#Booksnumber").val("");


        bookk2.style.display="none";

    }
    function submitNewBook(){
        var Bookstype=$("#Bookstype").val();
        var Booksname=$("#Booksname").val();
        var Booksautor=$("#Booksautor").val();
        var Booksnumber=$("#Booksnumber").val();
        $.post("/lib.do","type='"+Bookstype+"'&name='"+Booksname+"'&autor='"+Booksautor+"'&number="+Booksnumber,function(data){
            alert(data);
            if(data==true){
                alert("您已成功添加图书，请选择关闭窗口或者继续添加");




            }
            else{
                alert("您添加的书已经存在，请勿重复添加");
            }

        })

    }
    function showBorrowed(){
        var d=document.getElementById("showBorrowedBook");
        d.style.display="block";
        closeW2();
        closeW4();
        closeW3();
        closeInsert()
        closeW();
    }
    function sousuo(){
        var searchInfo=$("#booktype2").val();
        $.post("/SearchB.do","name='"+searchInfo+"'",function(rsp){
            alert(JSON.stringify(rsp));
            if(rsp==false){
                alert("您搜索的书不存在哦");
            }
            else{
                alert("下面是您的搜索结果");
                for(var i=0;i<rsp.length;i++){
                    var data=rsp[i];

                    var a1=data.type;
                    var a2=data.name;
                    var a3=data.autor;
                    var a4=data.number;
                    var b1=document.getElementById("B5");
                    var optionEle = document.createElement("tr");

                    b1.appendChild(optionEle);
                    var smallop=document.createElement("td");
                    smallop.innerHTML=a1;
                    smallop.style.border="1px solid black";
                    optionEle.appendChild(smallop);

                    var smallop2=document.createElement("td");
                    smallop2.innerHTML=a2;
                    smallop2.style.border="1px solid black";
                    optionEle.appendChild(smallop2);

                    var smallop3=document.createElement("td");
                    smallop3.innerHTML=a3;
                    smallop3.style.border="1px solid black";
                    optionEle.appendChild(smallop3);

                    var smallop4=document.createElement("td");
                    smallop4.innerHTML=a4;
                    smallop4.style.border="1px solid black";
                    optionEle.appendChild(smallop4);

                    var smallop4=document.createElement("td");
                    smallop4.innerHTML='&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a onclick="xiugai(\''+a1+'\',\''+a2+'\',\''+a3+'\',\''+a4+'\')" href="#">修改</a>|<a onclick="deleteElement(\''+a2+'\')" style="color: red" href="#">删除</a>';
                    smallop4.style.border="1px solid black";
                    optionEle.appendChild(smallop4);

                    optionEle.style.border="1px solid black";
                }}
        })
    }

    function typeSearch(){

        var searchInfo=$("#textType").val();
        $.post("/SearchC.do","type='"+searchInfo+"'",function(rsp){
            alert(JSON.stringify(rsp));
            if(rsp==false){
                alert("您搜索的书类不存在哦");





            }
            else{
                alert("下面是您的搜索结果");
                for(var i=0;i<rsp.length;i++){
                    var data=rsp[i];

                    var a1=data.name;
                    var b1=document.getElementById("B6");
                    var optionEle = document.createElement("tr");

                    b1.appendChild(optionEle);
                    var smallop=document.createElement("td");
                    smallop.innerHTML=a1;
                    smallop.style.border="1px solid black";
                    optionEle.appendChild(smallop);


                    var smallop4=document.createElement("td");
                    smallop4.innerHTML='&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a onclick="xiugaixinxi3(\''+a1+'\')" href="#">修改</a>|<a onclick="deleteInfo(\''+a1+'\')" style="color: red" href="#">删除</a>';
                    smallop4.style.border="1px solid black";
                    optionEle.appendChild(smallop4);

                    optionEle.style.border="1px solid black";
                }}
        })

    }

    function deleteInfo(a){

        var r = confirm("您确定要删除吗？");
        if (r == true) {
            $.post("/DeleteType.do","type='"+a+"'",function(rsp){

                if(rsp==false){
                    alert("更改失败")

                }
                else{
                    alert("更改成功")

                }


            })


        }}




    function xiugai(a1,a2,a3,a4){
        alert("进来了吗")
        var f=a2;
        var r=document.getElementById("xiugaiBook");
        r.style.display="block";
        closeInsert();
        alert(a2);
        var c=document.getElementById("Bookstype2");
        c.value=a1;
        var c1=document.getElementById("Booksname2");
        c1.value=a2;

        var c2=document.getElementById("Booksautor2");
        c2.value=a3;
        var c3=document.getElementById("Booksnumber2");
        c3.value=a4;
        var c4=document.getElementById("Booksname22");
        c4.value=a2;


        //  console.log( $("#Booksname2"))
        // $("#Booksname2").val(f);
        //  var changeSubmit=document.getElementById("submitChange");
        //  changeSubmit.onclick(xiugaixinxi(a2));


    }
    function xiugaixinxi3(a){
        var c=document.getElementById("xiugaiType");
        c.style.display="block";
        closeInsert();
        $("#typeName3").val(a);//这里赋值的方式要注意
        alert(a)






    }

    function submitChangeType(){
        alert("dds");
        var typeName=$("#typeName3").val();
        var a=$("#typeName2").val();
        alert(typeName);
        $.post("/typeChange.do","type='"+a+"'&original='"+typeName+"'",function(fsp){//这里很重要

            alert("aa");
            if(fsp==false){
                alert("更新失败")
            }
            else{
                alert("更新成功")
            }})
    }



    function xiugaixinxi(){
        var type=$("#Bookstype2").val();
        var name=$("#Booksname2").val();
        var autor=$("#Booksautor2").val();
        var number=$("#Booksnumber2").val();
        var a=$("#Booksname22").val();
        alert(a);
        $.post("/Change.do","type='"+type+"'"+"&name='"+name+"'"+"&autor='"+autor+"'"+"&number="+number+"&variable='"+a+"'",function(rsp){

            if(rsp==false){
                alert("更改失败")

            }
            else{
                alert("更改成功")

            }


        })


    }


    function deleteElement(a){
        var r = confirm("您确定要删除吗？");
        if (r == true) {
            $.post("/Delete.do","name='"+a+"'",function(rsp){

                if(rsp==false){
                    alert("更改失败")

                }
                else{
                    alert("更改成功")

                }


            })


        }
        else {
            alert("好的您已取消")

        }}

    function deleteElement2(a){

        var r = confirm("您确定要删除吗？");
        if (r == true) {
            $.post("/Delete2.do","id="+a,function(rsp){

                if(rsp==false){
                    alert("更改失败")

                }
                else{
                    alert("更改成功")

                }


            })


        }
        else {
            alert("好的您已取消")

        }

    }

    function userInfoSearch(){
        var userInfo=$("#userInfo").val();
        $.post("/userInfo.do","surname='"+userInfo+"&name='"+userInfo+"'&id='"+userInfo+"'",function(rsp){
            if(rsp==false){
                alert("用户不存在")
            }
            else{

                for(var i=0;i<rsp.length;i++){
                    var data=rsp[i];
                    var a1=data.surname;
                    var a2=data.name;
                    var a3=data.id;
                    var a4=data.passwort;
                    var b1=document.getElementById("userInf");
                    var optionEle = document.createElement("tr");

                    b1.appendChild(optionEle);
                    var smallop=document.createElement("td");
                    smallop.innerHTML=a1;
                    smallop.style.border="1px solid black";
                    optionEle.appendChild(smallop);

                    var smallop2=document.createElement("td");
                    smallop2.innerHTML=a2;
                    smallop2.style.border="1px solid black";
                    optionEle.appendChild(smallop2);

                    var smallop3=document.createElement("td");
                    smallop3.innerHTML=a3;
                    smallop3.style.border="1px solid black";
                    optionEle.appendChild(smallop3);

                    var smallop4=document.createElement("td");
                    smallop4.innerHTML=a4;
                    smallop4.style.border="1px solid black";
                    optionEle.appendChild(smallop4);

                    var smallop4=document.createElement("td");
                    smallop4.innerHTML='&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a onclick="xiugai2(\''+a1+'\',\''+a2+'\',\''+a3+'\',\''+a4+'\')" href="#">修改</a>|<a onclick="deleteElement2(\''+a3+'\')" style="color: red" href="#">删除</a>';
                    smallop4.style.border="1px solid black";
                    optionEle.appendChild(smallop4);

                    optionEle.style.border="1px solid black";

                }
            }

        })

    }

    function xiugai2(a1,a2,a3,a4){
        var f=a2;
        var r=document.getElementById("xiugaiUser");
        r.style.display="block";
        closeInsert();
        alert(a2);
        var c=document.getElementById("surname2");
        c.value=a1;
        var c1=document.getElementById("name2");
        c1.value=a2;

        var c2=document.getElementById("id2");
        c2.value=a3;
        var c3=document.getElementById("password2");
        c3.value=a4;
        var c4=document.getElementById("name22");
        c4.value=a2;


        //  console.log( $("#Booksname2"))
        // $("#Booksname2").val(f);
        //  var changeSubmit=document.getElementById("submitChange");
        //  changeSubmit.onclick(xiugaixinxi(a2));


    }

    function xiugaixinxi2(){
        var type=$("#surname2").val();
        var name=$("#name2").val();
        var autor=$("#id2").val();
        var number=$("#password2").val();
        var a=$("#name22").val();
        alert(a);
        $.post("/ChangeUser.do","surname='"+type+"'"+"&name='"+name+"'"+"&id="+autor+"&password="+number+"&variable='"+a+"'",function(rsp){

            if(rsp==false){
                alert("更改失败sss")

            }
            else{
                alert("更改成功")

            }


        })


    }

    function showAllType(){
        alert("aaa")
        $.post("/SearchType.do",function(rsp){

            if(rsp==false){
                alert("失败")

            }
            else {
                alert("所有分类信息如下")
                for (var i = 0; i < rsp.length; i++) {
                    var data = rsp[i];

                    var a1 = data.name;
                    var b1 = document.getElementById("B6");
                    var optionEle = document.createElement("tr");

                    b1.appendChild(optionEle);
                    var smallop = document.createElement("td");
                    smallop.innerHTML = a1;
                    smallop.style.border = "1px solid black";
                    optionEle.appendChild(smallop);


                    var smallop4 = document.createElement("td");

                    smallop4.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a onclick="xiugaixinxi3(\''+a1+'\')" href="#">修改</a>|<a onclick="deleteInfo(\''+a1+'\')" style="color: red" href="#">删除</a>';
                    smallop4.style.border = "1px solid black";
                    optionEle.appendChild(smallop4);

                    optionEle.style.border = "1px solid black";

                }

            }
        })

    }

    function showAllBorrowedBooks(){
        $.post("/showborrowAdmin.do",function(data){

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

                    var smallop7 = document.createElement("td");
                    smallop7.innerHTML = '<a href="#" onclick="giveback(\''+a1+'\',\''+a2+'\')" style="padding-left: 20px" >归还</a>';
                    smallop7.style.border = "1px solid black";
                    optionEle.appendChild(smallop7);



                    optionEle.style.border = "1px solid black";
                }}


        })

    }

    function giveback(a1,a2){

        $.post("/giveback.do","bookName='"+a1+"'&userId="+a2,function(data){
            if(data==false){
                alert("归还失败");
            }
            else{
                alert("归还成功");
            }
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
            <div class="tiao" style=""><a href="#" onclick="tushuguanli()">&nbsp&nbsp<strong>图书管理</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp></a></div>
            <div class="tiao" style=""><a href="#" onclick="usersVerwalten()">&nbsp&nbsp<strong>读者管理</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp></a></div>
            <div class="tiao"><a onclick="typeManager()" href="#">&nbsp&nbsp<strong>图书分类管理</strong>&nbsp&nbsp&nbsp></a></div>
            <div class="tiao"><a href="#" onclick="showBorrowed()">&nbsp&nbsp<strong>图书借阅信息</strong>&nbsp&nbsp&nbsp></a></div>

        </div>

        <div class="scriptText" style="position: relative;bottom: 698px;left:950px" > <div style="background-color:darkgrey;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的编号和名称，查询查询书的基本信息，并且添加，修改删除图书。</div></div>
        <div class="scriptText" style="position: relative;bottom: 800px;left:300px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>图书分类管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据书的分类名称查询信息，并且增删改书的分类信息</div></div>
        <div class="scriptText" style="position: relative;bottom: 690px;left:300px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>图书借阅</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">展示所有正在借阅的书</div></div>
        <div class="scriptText" style="position: relative;bottom: 997px;left:630px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp  <strong>图书归还</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">展示所有已归还的书</div></div>
        <div class="scriptText" style="position: relative;bottom: 887px;left:630px"> <div style="background-color:darkgray;width:200px;height: 30px;border-top-right-radius: 10px "> &nbsp <strong>读者管理</strong></div><div style="background-color: midnightblue;opacity: 0.5;color:snow;width:200px;height:70px;padding:10px;font-size:11px">根据读者的账号姓名查看读者信息，并且增删改读者</div></div>
    </div>

    <div style="background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none"><div style="background-color: black;height: 40px">查询</div><span>图书名称: <input type="text"/><input type="button" value="Search"/></span></div>
    <div style="background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none"><div style="background-color: black;height: 40px">查询</div><span>图书名称: <input type="text"/><input type="button" value="Search"/></span></div>
    <div id="booktype" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none">
        <div style="height: 0px;position: relative;width:0px;left:875px;bottom:7px; z-index:99999"><input style="border-top-right-radius: 10px;" onclick="closeW()" type="button" value="X"/></div>
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px;position:relative;bottom:5px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="z-index:999;position: relative;top:10px;left:8px"><strong>书籍类型名称</strong>: <input id="booktype2" class="txsize" type="text"/>
    <input onclick="sousuo()" class="btsize" type="button" value="Search"/>
      <input onclick="addBk()" class="btsize" type="button" style="position: relative;left:290px" value="addBook"/></span>

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
                <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修改</a>|<a href="#" style="color:red">删除</a></td>
            </tr>
        </table>

    </div>






    <div id="users" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none">
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="position: relative;top:10px;left:8px"><strong>读者姓名或id</strong>: <input id="userInfo" class="txsize" type="text"/>

    <input id="userSearch" onclick="userInfoSearch()"  class="btsize" type="button" value="Search"/>
  </span>
        <div style="height:1px;position: relative;left:875px;bottom:70px"><input onclick="closeW2()" type="button" value="X" style="border-radius: 10px"></div>

        <table id="userInf" border="1" style="position: relative;left:30px;top:20px;">
            <th style="border:1px solid black;width:110px">姓</th>
            <th style="border:1px solid black;width:110px">名</th>
            <th style="border:1px solid black;width:110px">id</th>
            <th style="border:1px solid black;width:110px">密码</th>

            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">
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
        <span style="position: relative;top:10px;left:8px"><strong>图书类名称</strong>: <input id="textType" class="txsize" type="text"/>
      <input onclick="typeSearch()" class="btsize" type="button" value="Search"/></span>
        <input id="booksTypeSearch" class="btsize" onclick="showAllType()" type="button" style="position: relative;left:290px;top:10px;width:100px" value="showAll"/>
        <div style="height:1px;border-radius:10px;position:relative;left:872px;bottom:71px  " onclick="closeW4()"><input type="button" value="X"/></div>
        <table id="B6" border="1" style="position: relative;left:30px;top:20px;">
            <th style="border:1px solid black;width:110px">分类名称</th>

            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">
                <td style="border:1px solid black;height: 30px"></td>

                <td style="border:1px solid black;height: 30px"><a href="#">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp修改</a>|<a href="#" style="color:red">删除</a></td>
            </tr>
        </table>





    </div>

    <div id="showBorrowedBook" style="border-radius: 10px;background-color: #b3d7ff;position: relative;bottom: 1200px;width:900px;height: 330px;left:300px;display: none">
        <div style="border-top-left-radius: 10px;border-top-right-radius:10px;background-color: black;height: 40px"><strong style="color: snow">&nbsp&nbsp&nbsp&nbsp查询</strong></div>
        <span style="position: relative;top:10px;left:8px">
      <input onclick="showAllBorrowedBooks()" class="btsize" type="button" value="showAll"/></span>

        <div style="height:1px;border-radius:10px;position:relative;left:872px;bottom:71px  " onclick="closeW5()"><input type="button" value="X"/></div>
        <table id="B7" border="1" style="position: relative;left:30px;top:20px;">
            <th style="border:1px solid black;width:110px">书籍名称</th>
            <th style="border:1px solid black;width:110px">借阅者id</th>
            <th style="border:1px solid black;width:110px">借书日期</th>
            <th style="border:1px solid black;width:110px">还书截止日期</th>
            <th style="border:1px solid black;width:110px">借阅状态</th>
            <th style="border:1px solid black;width:110px">操作</th>
            <tr style="border:1px solid black">
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"></td>
                <td style="border:1px solid black;height: 30px"><a href="#" style="padding-left:20px;color:midnightblue">归还</a></td>
            </tr>
        </table>





    </div>


    <div id="addBookTanchuang1" style="width:330px;height: 200px;border-radius: 10px;display: none;position:relative;bottom:1440px;left:800px;background-color: deepskyblue">
        <div >图书类型:<input class="koc" id="Bookstype" type="text"></div>
        <div style="position:relative;top:10px">图书名称:<input class="koc" id="Booksname" type="text"></div>
        <div style="position:relative;top:20px;">图书作者:<input class="koc" id="Booksautor" type="text"></div>
        <div style="position:relative;top:30px;">图书数量:<input class="koc" id="Booksnumber" type="text"></div>
        <div style="position:relative;top:40px;left:4px"><input onclick="submitNewBook()" type="button" value="提交新书"> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp <span><input type="button" value="X关闭" onclick="closeInsert()"></span></div>
    </div>
</div>
<div id="xiugaiBook" style="width:306px;height: 193px;border-radius: 10px;display: none;position:relative;bottom:1440px;left:800px;background-color: deepskyblue">
    <div >图书类型:<input class="koc" id="Bookstype2" type="text"></div>
    <div style="position:relative;top:10px">图书名称:<input class="koc" id="Booksname2" type="text"></div>
    <div style="position:relative;top:10px;display: none">图书名称:<input class="koc" id="Booksname22" type="text" ></div>
    <div style="position:relative;top:20px;">图书作者:<input class="koc" id="Booksautor2" type="text"></div>
    <div style="position:relative;top:30px;">图书数量:<input class="koc" id="Booksnumber2" type="text"></div>
    <div style="position:relative;top:40px;"><input onclick="xiugaixinxi()" id="submitChange"   type="button" value="提交修改" > &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp <span><input type="button" value="X关闭" onclick="closeW2()"></span></div>
</div>


<div id="xiugaiUser" style="width:306px;height: 193px;border-radius: 10px;display: none;position:relative;bottom:1440px;left:890px;background-color: deepskyblue">
    <div >读者姓氏:<input class="koc" id="surname2" type="text"></div>
    <div style="position:relative;top:10px">读者名字:<input class="koc" id="name2" type="text"></div>
    <div style="position:relative;top:10px;display: none">读者名字:<input class="koc" id="name22" type="text" ></div>
    <div style="position:relative;top:20px;">读者的id:<input class="koc" id="id2" type="text"></div>
    <div style="position:relative;top:30px;">读者密码:<input class="koc" id="password2" type="text"></div>
    <div style="position:relative;top:40px;left:6px"><input onclick="xiugaixinxi2()" id="submitChange2"   type="button" value="提交修改" > &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp <span><input type="button" value="X关闭" onclick="closeW3()"></span></div>
</div>

<div id="xiugaiType" style="width:306px;height: 193px;border-radius: 10px;display: none;position:relative;bottom:1440px;left:800px;background-color: deepskyblue">
    <div style="position: relative;top:20px"  >类型名称:<input class="koc" id="typeName2" type="text"></div>
    <div style="display: none" >类型名称:<input class="koc" id="typeName3" type="text"></div>

    <div style="position:relative;top:40px;"><input onclick="submitChangeType()" id="submitChange3"   type="button" value="提交修改" > &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp <span><input type="button" value="X关闭" onclick="closeW3()"></span></div>
</div>




</div>


</body>
</html>
