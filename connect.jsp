<%@page import="java.sql.*"%>
<%!Connection con=null;%>

<%
	try{
	Class.forName("oracle.jdbc.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","nabhoneel","RKM1429");
	}
	catch(Exception e){out.println(e);}
%>