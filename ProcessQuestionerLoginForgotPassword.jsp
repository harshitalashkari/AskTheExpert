<%@page import="dao.Questioner_dao" %>

<%
Questioner_dao daoObj = new Questioner_dao();

boolean b = daoObj.forgotPassword(request.getParameter("mailID"));

if(b){
    session.setAttribute("questionerForgotPassword", 1);
    response.sendRedirect("QuestionerLogin.jsp");
}
else{
    session.setAttribute("questionerInvalidMailID", 1);
    response.sendRedirect("QuestionerLogin.jsp");
}
%>