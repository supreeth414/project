<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String email=request.getParameter("email"); 
//session.putValue("userid",userid); 
session.setAttribute("email", email);
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/test","root","12345"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where emailid='"+email+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("welcome"+email); 

} 
else 
{ 
out.println("Invalid password try again"); 
} 
} 
else 
%>
<a href="index.html">Home</a>
</body>
</html>