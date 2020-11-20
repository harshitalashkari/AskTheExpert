<%@page import="dao.Expert_dao" %>
<%@page import="dto.Expert_dto" %>

<%
Expert_dao daoObj = new Expert_dao();
String expertMailID = request.getParameter("expertId");

boolean b = daoObj.incrementReport(expertMailID);

if(b)
    response.sendRedirect("QuestionerActivity.jsp");
else
    response.sendRedirect("QuestionerActivity.jsp");
%>