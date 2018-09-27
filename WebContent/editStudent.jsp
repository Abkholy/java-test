<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%@page import="Com.basar.*" %>

<%
String id = request.getParameter("id");
Student s = StudentDao.getRecordById(Integer.parseInt(id));
%>



<form action = "studentEdit.jsp" method="post">
  
  <div class="form-group">
    <label for="exampleInputEmail1">Id</label>
    <input type="text" class="form-control" name="id"  value='<%= s.getId() %>'>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1"> Name</label>
    <input type="text" class="form-control" name="name"  value='<%= s.getName() %>'>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control"  name="password" value='<%=s.getPassword() %>'>
  </div>
  <div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender"   value='<%= s.getGender() %>'>
  <label class="form-check-label" for="inlineRadio1">male</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="gender"    value='<%= s.getGender() %>'>
  <label class="form-check-label" for="inlineRadio2">female</label>
</div>

 <div class="form-group">
    <select class="custom-select"  name="country"   value='<%= s.getCountry() %>'>
      <option value="">Country</option>
      <option value="egypt">egypt</option>
      <option value="saudi">saudi</option>
      <option value="iraq">iraq</option>
    </select>
    <div class="invalid-feedback">Example invalid custom select feedback</div>
  </div>
  
  
  
<br>
  <button type="submit" class="btn btn-primary" value="addStudent">Submit</button>
</form>
</body>
</html>