<%@include file="connect.jsp"%>
<%@page import="java.util.Calendar"%>

<%
   PreparedStatement p1 = con.prepareStatement("select max(mid) from messages");
   PreparedStatement pst = con.prepareStatement("insert into messages values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
   ResultSet r1 = p1.executeQuery();
   int mid = 0;
   if(r1.next()) mid = r1.getInt(1);
   mid++;
   pst.setInt(1, mid);
   pst.setString(2, (String)session.getAttribute("Username"));
   pst.setString(3, request.getParameter("receiver"));
   Calendar now = Calendar.getInstance();
   String month[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
   String date = month[now.get(Calendar.MONTH)] + " " + now.get(Calendar.DAY_OF_MONTH) + ",  " + now.get(Calendar.YEAR);
   pst.setString(4, date);
   pst.setString(5, request.getParameter("subject"));
   pst.setString(6, request.getParameter("message"));
   
   if(request.getParameter("Send").equals("Send")){   
       pst.setInt(7, 1);
       pst.setInt(8, 1);
       pst.setInt(9, 0);
   }
   else
   {
       pst.setInt(7, 0);
       pst.setInt(8, 0);
       pst.setInt(9, 1);
   }
   pst.executeUpdate();   
   response.sendRedirect("userInbox.jsp");
%>