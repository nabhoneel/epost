<%@include file="connect.jsp"%>

<head>
    <title>ePost | Vew Mail</title>
    <link rel="stylesheet" href="mailStyle.css">
    <script type="javascript">
    
    function height(element)
    {
        element.style.height = "5px";
        element.style.height = (element.scrollHeight)+"px";
    }
    
    </script>
</head>
    
<ul>
	<li><a href="compose.jsp">Compose Mail</a></li>
	<li><a href="userInbox.jsp">Inbox</a></li>
	<li><a href="userSent.jsp">Sent Items</a></li>
	<li><a href="userDrafts.jsp">Drafts</a></li>
	<li><a href="userTrash.jsp">Trash</a></li>	
    <li><a href="logout.jsp">Logout</a></li>
</ul>
<%@include file="userMenuStyle.html"%>
    
<%
	try
	{
		int mid = Integer.parseInt(request.getParameter("message"));
		PreparedStatement pst = con.prepareStatement("select * from messages where mid = " + mid);	
        ResultSet rs = pst.executeQuery();
        String sender="", receiver="", date="", subject="", message="";
        out.println("Working");
		if(rs.next())
		{
			sender = rs.getString(2);
            receiver = rs.getString(3);
            date = rs.getString(4);
            subject = rs.getString(5);
            message = rs.getString(6);
            out.println("Working");
%>
    
<body>
    <center>
    <form action="sendMessage.jsp" method=post onsubmit="return checkFields()">
    <table class="details">
        <tr><th>To:</td><td><%=receiver%></td></tr>
        <tr><th>From:</td><td><%=sender%></td></tr>
        <tr><th>Date:</td><td><%=date%></td></tr>        
        <tr><th>Subject:</td><td><%=subject%></td></tr>
    </table>
    <table class="mail">
        <tr><td><p><%=message%></p></td></td></tr>
    </table>
    </form>
    </center>
</body> 

<%
		}
		con.close();
	}catch(Exception e){}
%>