<%@page import="dao.Questioner_dao"%>
<%@page import="dto.Questioner_dto"%>
<%
String otp = request.getParameter("otp");
String otpOnMail = (String)session.getAttribute("otpOnMail");

if(otp.equals(otpOnMail)){
    Questioner_dto dtoObj = new Questioner_dto();
    dtoObj.setFirstName((String)session.getAttribute("questionerFirstName"));
    dtoObj.setLastName((String)session.getAttribute("questionerLastName"));
    dtoObj.setEmailID((String)session.getAttribute("questionerMailID"));
    dtoObj.setPassword((String)session.getAttribute("questionerPassword"));
    
    Questioner_dao daoObj = new Questioner_dao();
    boolean b = daoObj.addQuestioner(dtoObj);
    
    if(b)
        response.sendRedirect("QuestionerHome.jsp");
}
else{
    session.setAttribute("invalidOTP", 1);
    response.sendRedirect("QuestionerSignUp2.jsp");
}
%>