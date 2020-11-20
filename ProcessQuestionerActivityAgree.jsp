<%@page import="dao.Answers_dao" %>
<%@page import="dto.Answers_dto" %>

<%
Answers_dao daoObj = new Answers_dao();
int answerId = Integer.parseInt(request.getParameter("answerId"));

boolean b = daoObj.incrementAgree(answerId);

if(b)
    response.sendRedirect("QuestionerActivity.jsp");
else
    response.sendRedirect("QuestionerActivity.jsp");
%>