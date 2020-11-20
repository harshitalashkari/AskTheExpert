<%@page import="dao.Expert_dao"%>

<%
Expert_dao daoObj = new Expert_dao();
String expertMailId = (String)session.getAttribute("expertMailID");
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");

boolean b = daoObj.changePassword(expertMailId, currentPassword, newPassword);

if(b)
    response.sendRedirect("ExpertLogin.jsp");
else
    response.sendRedirect("ExpertProfile.jsp");
%>