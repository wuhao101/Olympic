<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="Dao.Implement.PaginationUtil"%>
<%@ page import="Bean.AthleteRecord"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MedalList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/style.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="JS/jquery.js"></script>
    <script> 
</script> 

  </head>
  
  <body>
    <center>
           <div><font id = "titlefont">Medal List</font></div>
           </center>
           
           <form>
           <table id="athletes">

            <tr>
               <th>Year</th>
               <th>Sports</th>
               <th>Event</th>
               <th>Athlete</th>
               <th>Medal</th>
               <th>Dlete</th>
            </tr>

            <% session = request.getSession(true); 
               List list = (List)session.getAttribute("recordlist");
               //System.out.println(list); 
               if (list != null) {
                  
				PaginationUtil paginationUtil = new PaginationUtil(list);
				int pageNo = 0;
				if (request.getParameter("No") == null) {
					pageNo = 1;
				} else {
					pageNo = Integer.parseInt(request.getParameter("No"));
				}
				List cc = paginationUtil.findGrade(pageNo, 10);
				Iterator i = cc.iterator();
				while (i.hasNext()) {
					AthleteRecord record = (AthleteRecord ) i.next();
					int number = record.getAid();
			%>
			<tr>
			   <td style="display:none"><%=record.getRid()%></td>
			   <td style="display:none"><%=record.getAid()%></td>
			   <td><%=record.getYear()%></td>
               <td><%=record.getSport()%></td>
               <td><%=record.getEvent()%></td>
			   <td><a href="/databaseproject/Athlete.jsp?number=<%=number%>" target="_blank" id="athnamefont"><%=record.getAthName()%></a></td>
			   <td><%=record.getMedal()%></td>
			   <th><input value="Delete" type="button" id="editbutton"></th> 
			</tr>
			<%	}
				int all = paginationUtil.allPage(10);
			%>
			
         </table>
         </form>
         <center>
            
			<%
				if (pageNo > 1) {
			%>
			<a href="/databaseproject/Segment/MedalList.jsp?No=<%=pageNo - 1%>" id = "contentfont"><font>Last</font> </a>
			<%
				}
			%>
			<font id = "contentfont"> <%=pageNo%> / <%=all%> Pages </font>
			<%
				if (pageNo < all) {
			%>
			<a href="/databaseproject/Segment/MedalList.jsp?No=<%=pageNo + 1%>" id = "contentfont"><font> Next</font></a>
			<%
				}
				}
			%>
		</center>
  </body>
</html>
