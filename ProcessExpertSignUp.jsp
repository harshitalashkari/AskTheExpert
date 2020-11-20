<%@page import="dao.Expert_dao"%>
<%@page import="dto.Expert_dto"%>

<%
Expert_dto dtoObj = new Expert_dto();
dtoObj.setFirstName(request.getParameter("first_name"));
dtoObj.setLastName(request.getParameter("last_name"));
dtoObj.setEmailID(request.getParameter("mailID"));
dtoObj.setPassword(request.getParameter("password"));
dtoObj.setCategory(request.getParameter("category"));

Expert_dao daoObj = new Expert_dao();

if(!daoObj.checkExpertExistance(dtoObj.getEmailID())){
    String otpOnMail = daoObj.sendVerificationMail(dtoObj.getEmailID());

    session.setAttribute("expertFirstName", dtoObj.getFirstName());
    session.setAttribute("expertLastName", dtoObj.getLastName());
    session.setAttribute("expertCategory", dtoObj.getCategory());
    session.setAttribute("expertMailID", dtoObj.getEmailID());
    session.setAttribute("expertPassword", dtoObj.getPassword());
    session.setAttribute("otpOnMail", otpOnMail);
    response.sendRedirect("ExpertSignUp2.jsp");
}
else{
    session.setAttribute("expertExists", 1);
    response.sendRedirect("ExpertSignUp.jsp");
}
%>