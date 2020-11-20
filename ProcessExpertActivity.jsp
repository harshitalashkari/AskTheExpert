<%@page import="dto.Answers_dto" %>
<%@page import="dao.Answers_dao" %>

<%
int answerID = Integer.parseInt(request.getParameter("answerId"));
Answers_dao daoObj = new Answers_dao();

boolean b = daoObj.deleteAnswer(answerID);

if(b)
    response.sendRedirect("ExpertHome.jsp");
else
    response.sendRedirect("ExpertHome.jsp");
%>