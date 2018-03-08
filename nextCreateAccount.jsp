<%@include file="connect.jsp"%>
<%
	String username=request.getParameter("username");
	String pass1=request.getParameter("pass1");
	String pass2=request.getParameter("pass2");
	if(!pass1.equals(pass2))
	{
%>

<%@include file="createAccount.html"%><br>
<div style="font-family: 'Courier New'; color='red'; font-size: 19px;" align=center>Passwords do not match</div>

<%
	}
	else
	{
		try{
			PreparedStatement pst = con.prepareStatement("insert into epostusers values(?, ?)");
			pst.setString(1, request.getParameter("username"));
			pst.setString(2, pass1);
			
			int t = pst.executeUpdate();
			if(t>0)
			{
%>
<br>
<div style="font-family: 'Calibri'; color='green'; font-size: 38px;" align=center>You have been registered successfully!</div>
<br>
<div align=center><a href="http://localhost:1620/ePost" style="font-family: 'Calibri'; font-size: 28px;">Sign In</a></div>
<%
			}
			else out.println("<div align=center>Registration was not successful. Please try again.</div>");
			con.close();
		}
		catch(java.sql.SQLException e){
%>
<%@include file="createAccount.html"%><br>
<div style="font-family: 'Courier New'; color='red'; font-size: 19px;" align=center>The username you entered already exists</div>
<%
		}
	}
%>