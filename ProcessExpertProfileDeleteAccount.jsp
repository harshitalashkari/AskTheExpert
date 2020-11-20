<%@page import="dao.Expert_dao"%>

<%
Expert_dao daoObj = new Expert_dao();
String expertMailId = (String)session.getAttribute("expertMailID");
String password = request.getParameter("password");

boolean b = daoObj.deleteAccount(expertMailId, password);

if(b)
    response.sendRedirect("Home.jsp");
else
    response.sendRedirect("ExpertProfile.jsp");
%>