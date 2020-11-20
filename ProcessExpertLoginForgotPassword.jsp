<%@page import="dao.Expert_dao" %>

<%
Expert_dao daoObj = new Expert_dao();

boolean b = daoObj.forgotPassword(request.getParameter("mailID"));

if(b){
    session.setAttribute("expertForgotPassword", 1);
    response.sendRedirect("ExpertLogin.jsp");
}
else{
    session.setAttribute("expertInvalidMailID", 1);
    response.sendRedirect("ExpertLogin.jsp");
}
%>