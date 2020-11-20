<%@page import="dao.Questioner_dao"%>

<%
Questioner_dao daoObj = new Questioner_dao();
String questionerMailId = (String)session.getAttribute("questionerMailID");
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");

boolean b = daoObj.changePassword(questionerMailId, currentPassword, newPassword);

if(b)
    response.sendRedirect("QuestionerLogin.jsp");
else
    response.sendRedirect("QuestionerProfile.jsp");
%>