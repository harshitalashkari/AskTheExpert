<%@page import="dto.Answers_dto" %>
<%@page import="dao.Answers_dao" %>

<%
Answers_dto dtoObj = new Answers_dto();
dtoObj.setAnswer(request.getParameter("answer"));
dtoObj.setQuestionID(Integer.parseInt(request.getParameter("questionID")));
dtoObj.setExpertID(request.getParameter("expertID"));
dtoObj.setAgree(0);
dtoObj.setDisagree(0);

Answers_dao daoObj = new Answers_dao();
boolean b = daoObj.addAnswer(dtoObj);

if(b)
    response.sendRedirect("ExpertHome.jsp");
else
    response.sendRedirect("ExpertHome.jsp");
%>