<html>
    <head>
        <title>ePost | Compose Mail</title>
        <link rel="stylesheet" href="composeStyle.css">
        <script="javascript">
            function checkFields()
            {
                alert("yo");
                if(document.getElementById("To").textContent=="")
                {
                    document.getElementById("id").innerHTML="Required";
                    return false;
                }
                if(document.getElementById("Subject").textContent=="") 
                {
                    document.getElementById("subject").innerHTML="Required";
                    return false;
                }
            }
        </script>
    </head>
    <ul>
	<li class="active"><a href="compose.jsp">Compose Mail</a></li>
	<li><a href="userInbox.jsp">Inbox</a></li>
	<li><a href="userSent.jsp">Sent Items</a></li>
	<li><a href="userDrafts.jsp">Drafts</a></li>
	<li><a href="userTrash.jsp">Trash</a></li>	
    <li><a href="logout.jsp">Logout</a></li>
    </ul>
    <%@include file="userMenuStyle.html"%>
        
    <body>
        <center>
        <form action="sendMessage.jsp" method=post onsubmit="return checkFields()">
        <table>
            <tr><td>To</td><td><input type="text" name="receiver" size="50" id="To"></td><td id="to" class="red"></td></tr>
            <tr><td>Subject</td><td><input type="text" name="subject" size="50" id="Subject"></td><td id="subject" class="red"></td></tr>
            <tr><td colspan=2><textarea wrap="soft" name="message" rows="20" cols="150"></textarea></td></tr>
            <tr><td colspan=2><input type="submit" value="Send" class="button" name="Send">&nbsp;<input type="submit" value="Save draft" class="button" name="Send"></td></tr>
        </table>
        </form>
        </center>
    </body>
</html>
