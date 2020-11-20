<%@page import="dao.Expert_dao" %>

<%
Expert_dao daoObj = new Expert_dao();
boolean b = daoObj.unblockExpert(request.getParameter("expertMailID"));
if(b)
    response.sendRedirect("AdminHome.jsp");
else
    response.sendRedirect("AdminHome.jsp");
%>