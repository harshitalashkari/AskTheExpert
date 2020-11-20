<%@page import="dao.Admin_dao"%>

<%
Admin_dao daoObj = new Admin_dao();
String adminMailId = (String)session.getAttribute("adminMailID");
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");

boolean b = daoObj.changePassword(adminMailId, currentPassword, newPassword);

if(b)
    response.sendRedirect("AdminLogin.jsp");
else
    response.sendRedirect("AdminProfile.jsp");
%>