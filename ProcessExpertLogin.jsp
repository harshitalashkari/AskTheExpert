<%@page import="dao.Expert_dao" %>
<%@page import="dto.Expert_dto" %>
<%
String emailID = request.getParameter("mailID");
String password = request.getParameter("password");

Expert_dao daoObj = new Expert_dao();

boolean b = daoObj.isBlocked(emailID);

if(!b){
    Expert_dto dtoObj = daoObj.checkExpert(emailID, password);

    if( dtoObj.getFirstName() != null){
        session.setAttribute("expertFirstName", dtoObj.getFirstName());
        session.setAttribute("expertLastName", dtoObj.getLastName());
        session.setAttribute("expertCategory", dtoObj.getCategory());
        session.setAttribute("expertMailID", dtoObj.getEmailID());
        session.setAttribute("expertPassword", dtoObj.getPassword());
        response.sendRedirect("ExpertHome.jsp");
    }
    else{
        session.setAttribute("expertLoginFailed", 1);
        response.sendRedirect("ExpertLogin.jsp");
    }
}
else{
    session.setAttribute("expertBlocked", 1);
    response.sendRedirect("ExpertLogin.jsp");
}
%>