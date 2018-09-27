<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="Com.basar.StudentDao" %>

<jsp:useBean id="s" class="Com.basar.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>




<%
int num = StudentDao.save(s);

if(num>0){
	response.sendRedirect("studentAdded.jsp");
}else {
	response.sendRedirect("studentFaild.jsp");
}
%>


</body>
</html>