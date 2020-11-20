<%@page import="dao.Expert_dao"%>
<%@page import="dto.Expert_dto"%>

<%
String otp = request.getParameter("otp");
String otpOnMail = (String)session.getAttribute("otpOnMail");

if(otp.equals(otpOnMail)){
    Expert_dto dtoObj = new Expert_dto();
    dtoObj.setFirstName((String)session.getAttribute("expertFirstName"));
    dtoObj.setLastName((String)session.getAttribute("expertLastName"));
    dtoObj.setCategory((String)session.getAttribute("expertCategory"));
    dtoObj.setEmailID((String)session.getAttribute("expertMailID"));
    dtoObj.setPassword((String)session.getAttribute("expertPassword"));
    
    Expert_dao daoObj = new Expert_dao();
    boolean b = daoObj.addExpert(dtoObj);
    
    if(b)
        response.sendRedirect("ExpertHome.jsp");
}
else{
    session.setAttribute("invalidOTP", 1);
    response.sendRedirect("ExpertSignUp2.jsp");
}
%>