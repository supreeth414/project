<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String email=request.getParameter("emailid"); 
//session.putValue("userid",userid); 
session.setAttribute("emailid", email);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/test","root","12345"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("delete from users where email='"+email+"'"); 
if(rs.next()) 
{ 
if(rs.getString(5).equals(email)) 
{ 
out.println("deleted"+email); 

} 
else 
{ 
out.println("Invalid email try again"); 
} 
} 
else 
%>
<a href="Reg.html">Register</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>