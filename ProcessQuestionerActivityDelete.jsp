<%@page import="dao.Answers_dao" %>
<%@page import="dto.Answers_dto" %>
<%@page import="dao.Questions_dao" %>
<%@page import="dto.Questions_dto" %>

<%
Answers_dao ansDaoObj = new Answers_dao();
int quesId = Integer.parseInt(request.getParameter("questionId"));
boolean ansCheck = ansDaoObj.deleteAnswerFromQuesId(quesId);

Questions_dao quesDaoObj = new Questions_dao();
boolean quesCheck = quesDaoObj.deleteQuestion(quesId);

if(ansCheck && quesCheck)
    response.sendRedirect("QuestionerActivity.jsp");
else
    response.sendRedirect("QuestionerActivity.jsp");
%>