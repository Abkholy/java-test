
<html>
<head>

</head>
<body>
<%@page import="Com.basar.*" %>
<jsp:useBean id="s" class="Com.basar.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>



<%
int num = StudentDao.update(s);
response.sendRedirect("viewStudent.jsp") ;
%>
</body>
</html>