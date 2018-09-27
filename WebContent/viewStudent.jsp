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
<%@page import="Com.basar.Student" %>
<%@page import="Com.basar.StudentDao" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.* , javax.servlet.*" %>




<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Password</th>
      <th scope="col">Email</th>
      <th scope="col">gender</th>
            <th scope="col">country</th>
                  <th scope="col">id</th>
                        <th scope="col">Delete</th>
          <th scope="col">Edit</th>
    </tr>
  </thead>
<% List<Student> list=StudentDao.getAllRecords(); %>
<% for (Student s:list) { %>
  <tbody>
    <tr>
      <td><%=s.getName()%></td>
            <td><%=s.getPassword()%></td>
                  <td><%=s.getEmail()%></td>
                        <td><%=s.getGender()%></td>
                              <td><%=s.getCountry()%></td>
                                    <td><%=s.getId()%></td>
                              
             <td><a href="deleteStudent.jsp?id=<%=s.getId() %>">delete</a></td>
        <td><a href="editStudent.jsp?id=<%=s.getId() %>">edit</a></td>
 
    </tr>
    
    
  </tbody>
  <%} %>
</table>


<a class="btn btn-lg btn-info" href="addStudent.jsp" role="button">Add Student</a>
</body>
</html>