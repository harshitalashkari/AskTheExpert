<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.OutputStream"%>

<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<style type="text/css">
            *{
		box-sizing: border-box;
            }
            body{
                overflow: hidden;
                background-image: url('Images\\background.jpg');
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: relative;
            }
            .left{
                float: left;
                padding: 1%;
                height: 100%;
                width: 65%;
            }
            .right{
                float: left;
                padding: 1%;
                height: 100%;
                width: 35%;
            }
            .navigator{
                text-align: right;
                text-decoration: none;
                margin: 0% 4% 5% 0%;
            }
            .dropdown{
                position: relative;
                display: inline-block;
                margin: 2% 5% 3% 0%;
            }
            .dropdownList{
                background-color: #B22222;
                border: none;
                font-weight: bold;
                color: #ffffff;
                font-size: 15px;
                padding: 10px;
                opacity: 0.8;
            }
            .dropdownList:hover{
                opacity: 1;
            }
            .dropdownContent a:hover{
                background-color: #f1f1f1;
                color: #000000;
                font-weight: bold;
            }
            .dropdownContent{
                position: absolute;
                display: none;
                background-color: #ffffff;
                opacity: 1;
                text-align: left;
                z-index: 1;
            }
            .dropdownContent a{
                color: #000000;
                padding: 5px 15px;
                display: block;
                text-decoration: none;
                opacity: 1;
            }
            .dropdown:hover .dropdownContent{
                display: block;
            }
            .myTitle{
                color: #ffffff;
                font-size: 60px;
                text-align: center;
                font-weight: bold;
                font-style: italic;
                font-family: monospace;
                line-height: 20px;
                margin-top: 18%;
                margin-right: 14%;
            }
            .box{
                border: 1px outset #808080;
                background-color: #000000;
                opacity: 0.6;
                width: 32%;
                height: 58%;
                position: absolute;
                left: 80%;
                top: 60%;
                transform: translate(-50%, -50%);
            }
            input[type=text], input[type=password] {
                width: 80%;
                align-self: center;
                padding: 2.5%;
                margin: 2% 10%;
                display: inline-block;
                border: none;
                background: #f1f1f1;
                float: left;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
            .LoginBtn{
                background-color: #ff0000;
                color: white;
                font-size: 100%;
                font-weight: bold;
                text-align: center;
                margin: 5% 35%;
                border: none;
                cursor: pointer;
                width: 30%;
                height: 40px;
                opacity: 0.8;
            }
            .LoginBtn:hover {
                opacity: 1;
            }
            .sendMail{
                background-color: #ff0000;
                color: white;
                font-size: 100%;
                font-weight: bold;
                text-align: center;
                margin: 5% 35%;
                border: none;
                cursor: pointer;
                width: 30%;
                height: 40px;
                opacity: 0.8;
            }
            .sendMail:hover {
                opacity: 1;
            }
            .popup{
                position: fixed;
                z-index: 1;
                left: 70%;
                top: 80%;
                width: 20%;
                overflow: auto;
                background-color: transparent;
            }
            .popupText{
                color: #ffffff;
                font-size: 22px;
                text-align: center;
                margin: 2%;
                font-family: fantasy;
            }
            .forgotPassword{
                text-decoration: underline;
                font-size: 14px;
                color: #ffffff;
                margin: 12px 5px 12px 340px;
                cursor: pointer;
            }
            .footer{
                background-color: #000000;
                color: #ffffff;
                text-align: center;
                padding-bottom: 50px;
                opacity: 0.3;
                width: 100%;
                height: 60px;
                position: fixed;
                left: 63%;
                top: 95%;
                transform: translate(-63%, -20%);
            }
            .copyright{
                margin-bottom: 50px;
            }
	</style>
        <script type="text/javascript">
            $(document).ready(function(){
                
                var body = $("body");
                <%
                if((int)session.getAttribute("expertLoginFailed") == 1){
                    %>
                    $(body).append('<div class="popup"><p class="popupText">Please enter valid Email ID or Password<p></div>');
                    var error = $(".popupText");
                    $(window).click(function(){
                        $(error).css("display","none");
                    });
                    <%
                }
                else if((int)session.getAttribute("expertBlocked") == 1){
                    %>
                    $(body).append('<div class="popup"><p class="popupText">Your account has been Blocked by Admin<p></div>');
                    var error = $(".popupText");
                    $(window).click(function(){
                        $(error).css("display","none");
                    });
                    <%
                }
                else if((int)session.getAttribute("expertForgotPassword") == 1){
                    %>
                    $(body).append('<div class="popup"><p class="popupText">Temporary Password sent on Mail<p></div>');
                    var error = $(".popupText");
                    $(window).click(function(){
                        $(error).css("display","none");
                    });
                    <%
                }
                else if((int)session.getAttribute("expertInvalidMailID") == 1){
                    %>
                    $(body).append('<div class="popup"><p class="popupText">Please enter valid Email ID<p></div>');
                    var error = $(".popupText");
                    $(window).click(function(){
                        $(error).css("display","none");
                    });
                    <%
                }
                %>
                
                var box = $(".box");
                
                $(box).append('<form action="ProcessExpertLogin.jsp" method="POST" class="loginForm">'+
                    '<br><br><br><br><br><br>'+
                    '<input type="text" name="mailID" id="mailID" placeholder="E-mail ID" required>'+
                    '<input type="password" name="password" id="password" placeholder="Password" required>'+
                    '<p class="forgotPassword">Forgot Password?</p>'+
                    '<button type="submit" class="LoginBtn">LOGIN</button></form>');
            
                $(document).on("click",".forgotPassword",function(){
                    $(".loginForm").hide();
                    $(box).append('<form action="ProcessExpertLoginForgotPassword.jsp" method="POST">'+
                        '<br><br><br><br><br><br><br><br>'+
                        '<input type="text" name="mailID" placeholder="E-mail ID" required>'+
                        '<br><br><br><br>'+
                        '<button type="submit" class="sendMail">Send E-mail</button>');
                });
            });
        </script>
    </head>
    <body>
        <% 
            session.setAttribute("expertLoginFailed", 0);
            session.setAttribute("expertBlocked", 0);
            session.setAttribute("questionerLoginFailed", 0);
            session.setAttribute("questionerBlocked", 0);
            session.setAttribute("expertForgotPassword", 0);
            session.setAttribute("expertInvalidMailID", 0);
            session.setAttribute("questionerForgotPassword", 0);
            session.setAttribute("questionerInvalidMailID", 0);
            session.setAttribute("expertExists", 0);
            session.setAttribute("questionerExists", 0);
            session.setAttribute("mismatchedPassword", 0);
        %>
	<div>
            <div class="left">
		<a href="Home.jsp" class="logo" ><img src="Images\\logo.png" width="110" height="70"/></a>
            </div>
            <div class="right">
		<div class="navigator">
                    <div class="dropdown">
			<button class="dropdownList">Login</button>
			<div class="dropdownContent">
                            <a href="ExpertLogin.jsp">Expert</a>
                            <a href="QuestionerLogin.jsp">Questioner</a>
			</div>
                    </div>
                    <div class="dropdown">
			<button class="dropdownList">SignUp</button>
                    	<div class="dropdownContent">
                            <a href="ExpertSignUp.jsp">Expert</a>
                            <a href="QuestionerSignUp.jsp">Questioner</a>
			</div>
                    </div>
		</div>
		<p class="myTitle">ASKtheEXPERT</p>
		<div class="box">
		</div>
            </div>
	</div>
	<div class="footer">
            <p class="copyright">Copyright 2020 © Theme Created By Aashi Gupta, Harshita Lashkari, Armaan Agrawal All Rights Reserved</p>
	</div>
    </body>
</html>