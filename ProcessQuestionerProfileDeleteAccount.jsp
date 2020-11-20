<%@page import="dao.Questioner_dao"%>

<%
Questioner_dao daoObj = new Questioner_dao();
String questionerMailId = (String)session.getAttribute("questionerMailID");
String password = request.getParameter("password");

boolean b = daoObj.deleteAccount(questionerMailId, password);

if(b)
    response.sendRedirect("Home.jsp");
else
    response.sendRedirect("QuestionerProfile.jsp");
%>