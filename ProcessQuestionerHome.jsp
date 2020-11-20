<%@page import="dao.Questions_dao"%>
<%@page import="dto.Questions_dto"%>
<%
Questions_dto dtoObj = new Questions_dto();
dtoObj.setQuestion(request.getParameter("question"));
dtoObj.setCategory(request.getParameter("category"));
dtoObj.setTag1(request.getParameter("tag1"));
dtoObj.setTag2(request.getParameter("tag2"));
dtoObj.setTag3(request.getParameter("tag3"));
dtoObj.setTag4(request.getParameter("tag4"));
dtoObj.setTag5(request.getParameter("tag5"));
dtoObj.setQuestionerEmailID((String)session.getAttribute("questionerMailID"));

Questions_dao daoObj = new Questions_dao();
boolean b = daoObj.addQuestion(dtoObj);

if(b)
    response.sendRedirect("QuestionerHome.jsp");
else
    response.sendRedirect("QuestionerHome.jsp");
%>