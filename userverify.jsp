<%@include file="connect.jsp"%>

<%
	try{
	PreparedStatement pst = con.prepareStatement("select * from epostusers where username=? and password=?");
	String username=request.getParameter("username");
	pst.setString(1, username);
	pst.setString(2, request.getParameter("password"));
	ResultSet rs = pst.executeQuery();
	if(!rs.next())
	{
%>

<div style="font-family: 'Courier New'; color='red'; font-size: 19px;" align=center>Incorrect username/password</div>
<%@include file="index.html"%>

<%
	}
	else
	{
		session.setAttribute("Username", username);
		response.sendRedirect("userInbox.jsp");
	}	
	con.close();
	}catch(Exception e){out.println(e);}
%>