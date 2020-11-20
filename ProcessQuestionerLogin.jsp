okok<%@page import="dao.Questioner_dao" %>
<%@page import="dto.Questioner_dto" %>
<%@page import="dbcon.DatabaseConnection" %>
<%@page import="java.sql.*" %>

<%
String emailID = request.getParameter("mailID");
String password = request.getParameter("password");

Questioner_dao daoObj = new Questioner_dao();
boolean b = daoObj.isBlocked(emailID);

if(!b){
    Questioner_dto dtoObj = daoObj.checkQuestioner(emailID, password);

    if(dtoObj.getFirstName() != null){
        session.setAttribute("questionerFirstName", dtoObj.getFirstName());
        session.setAttribute("questionerLastName", dtoObj.getLastName());
        session.setAttribute("questionerMailID", dtoObj.getEmailID());
        session.setAttribute("questionerPassword", dtoObj.getPassword());
        response.sendRedirect("QuestionerHome.jsp");
    }
    else{
        session.setAttribute("questionerLoginFailed", 1);
        response.sendRedirect("QuestionerLogin.jsp");
    }
}
else{
    session.setAttribute("questionerBlocked", 1);
    response.sendRedirect("QuestionerLogin.jsp");
}
%>