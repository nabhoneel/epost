<%@include file="connect.jsp"%>
<%
	try{
	PreparedStatement pst = con.prepareStatement("select * from epostadmins where username=? and password=?");
	pst.setString(1, request.getParameter("username"));
	pst.setString(2, request.getParameter("password"));	
	ResultSet rs = pst.executeQuery();

	if(rs.next())
	{
		session.setAttribute("adminUser", rs.getString(1));
		response.sendRedirect("adminHome.jsp");
	}
	else
	{
%>
<center>
<font color = red>Invalid username/password</font>
<%@include file = "adminLogin.html"%>
</center>
<%
	}
	con.close();
	}catch(Exception e){out.println("<center>" + e + "</center>");}
%>