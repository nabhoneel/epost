<%@include file="connect.jsp"%>

<head>
    <title>ePost | Drafts</title>
</head>
    
<ul>
	<li><a href="compose.jsp">Compose Mail</a></li>
	<li><a href="userInbox.jsp">Inbox</a></li>
	<li><a href="userSent.jsp">Sent Items</a></li>
	<li><a href="userDrafts.jsp">Drafts</a></li>
	<li class="active"><a href="userTrash.jsp">Trash</a></li>	
    <li><a href="logout.jsp">Logout</a></li>
</ul>

<%@include file="userMenuStyle.html"%>

<style>

table{
padding: 50 50 50 50;
width: 100%;
border-bottom: 1px solid #ddd;
}

th{
background-color: rgb(10, 170, 220);
color: white;
height: 35px;
text-align: center;
}

tr{
font-family: 'Calibri';
text-align: center;
height: 30px;
background-color: #f5f5f5;
}

tr:hover{
background-color: #eee;
}

tr a{
color: black;
}

</style>

<div align=center>
<table>
<tr><th><input type="checkbox" name=selectAll id="selectAll" value=selectAll></th><th>Subject</th><th>To</th><th>Date</th></tr>
<%
	PreparedStatement pst = con.prepareStatement("select * from messages where sender = ?");
    pst.setString(1, (String)session.getAttribute("Username"));
	ResultSet rs = pst.executeQuery();
	int counter=0, mid;
    String subject, receiver, date;
	while(rs.next())
	{
        if(rs.getInt(7)==0 && rs.getInt(8)==0 && rs.getInt(9)==0)
        {
            mid = rs.getInt(1);
            subject = rs.getString(5);
            receiver = rs.getString(3);
            date = rs.getString(4);					
%>
<tr><td><input type="checkbox" name="selectMail" value=mail<%=counter%>></td>
    <td><a href=mail.jsp?message=<%=mid%>><%=subject%></td>
    <td><%=receiver%></td>
    <td><%=date%></td></tr>
<%
        }
	}
	con.close();
%>
</table>
</div>