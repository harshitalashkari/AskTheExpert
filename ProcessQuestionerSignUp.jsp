<%@page import="dao.Questioner_dao"%>
<%@page import="dto.Questioner_dto"%>
<%
Questioner_dto dtoObj = new Questioner_dto();
dtoObj.setFirstName(request.getParameter("first_name"));
dtoObj.setLastName(request.getParameter("last_name"));
dtoObj.setEmailID(request.getParameter("mailID"));
dtoObj.setPassword(request.getParameter("password"));
dtoObj.setConfirmPassword(request.getParameter("confirm_password"));

Questioner_dao daoObj = new Questioner_dao();

if(!daoObj.checkQuestionerExistance(dtoObj.getEmailID())){
    if(dtoObj.getPassword().equals(dtoObj.getConfirmPassword())){
        String otpOnMail = daoObj.sendVerificationMail(dtoObj.getEmailID());

        session.setAttribute("questionerFirstName", dtoObj.getFirstName());
        session.setAttribute("questionerLastName", dtoObj.getLastName());
        session.setAttribute("questionerMailID", dtoObj.getEmailID());
        session.setAttribute("questionerPassword", dtoObj.getPassword());
        session.setAttribute("otpOnMail", otpOnMail);
        response.sendRedirect("QuestionerSignUp2.jsp");
    }
    else{
        session.setAttribute("mismatchedPassword", 1);
        response.sendRedirect("QuestionerSignUp.jsp");
    }
}
else{
    session.setAttribute("questionerExists", 1);
    response.sendRedirect("QuestionerSignUp.jsp");
}
%>