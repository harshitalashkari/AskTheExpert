<%@page import="dao.Questioner_dao" %>

<%
Questioner_dao daoObj = new Questioner_dao();
boolean b = daoObj.unblockQuestioner(request.getParameter("questionerMailID"));
if(b)
    response.sendRedirect("AdminHome.jsp");
else
    response.sendRedirect("AdminHome.jsp");
%>