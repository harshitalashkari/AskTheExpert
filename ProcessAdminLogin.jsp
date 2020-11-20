<%@page import="dao.Admin_dao" %>
<%@page import="dto.Admin_dto" %>

<%
String emailID = request.getParameter("mailID");
String password = request.getParameter("password");

Admin_dao daoObj = new Admin_dao();
Admin_dto dtoObj = daoObj.checkAdmin(emailID, password);

if(dtoObj.getFirstName() != null){
    session.setAttribute("adminFirstName", dtoObj.getFirstName());
    session.setAttribute("adminLastName", dtoObj.getLastName());
    session.setAttribute("adminMailID", dtoObj.getEmailID());
    session.setAttribute("adminPassword", dtoObj.getPassword());
    response.sendRedirect("AdminHome.jsp");
}
else
    response.sendRedirect("AdminLogin.jsp");
%>