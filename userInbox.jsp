<%@include file="connect.jsp"%>

<head>
    <title>ePost | Inbox</title>
    <script type="javascript">
        function toggle()
        {
            alert("Yo");
            checkboxes = document.getElementsByName('selectMail');
            for(var i=0; i<checkboxes.length; i++)
                checkboxes[i].checked = document.getElementById('selectAll').checked;
        }
    </script>
</head>
    
<ul>
	<li><a href="compose.jsp">Compose Mail</a></li>
	<li class="active"><a href="userInbox.jsp">Inbox</a></li>
	<li><a href="userSent.jsp">Sent Items</a></li>
	<li><a href="userDrafts.jsp">Drafts</a></li>
	<li><a href="userTrash.jsp">Trash</a></li>	
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
<tr><th><input type="checkbox" name=selectAll id="selectAll" value=selectAll onchange="toggle()"></th><th>Subject</th><th>From</th><th>Date</th></tr>
<%
	PreparedStatement pst = con.prepareStatement("select * from messages where receiver = ?");
    pst.setString(1, (String)session.getAttribute("Username"));
	ResultSet rs = pst.executeQuery();
	int counter=0, mid;
    String subject, sender, date;
	while(rs.next())
	{
        if(rs.getInt(8)==1)
        {
            mid = rs.getInt(1);
            subject = rs.getString(5);
            sender = rs.getString(2);
            date = rs.getString(4);					
%>
<tr><td><input type="checkbox" name="selectMail" value=mail<%=counter%>></td>
    <td><a href=mail.jsp?message=<%=mid%>><%=subject%></td>
    <td><%=sender%></td>
    <td><%=date%></td></tr>
<%
        }
	}
	con.close();
%>
</table>
</div>