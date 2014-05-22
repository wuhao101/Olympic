<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="Dao.Implement.PaginationUtil"%>
<%@ page import="Dao.Implement.FindAthlete"%>
<%@ page import="Bean.AthleteRecord"%>
<%@ page import="Bean.Athlete"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Athlete.jsp' starting page</title>
    
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
    <jsp:include page="Segment/TopHeader.jsp"></jsp:include>
	 
	 
     <div id="page">
        <%
           Athlete athlete = new Athlete();
           FindAthlete result = new FindAthlete();
           int aid = 0;
           if (request.getParameter("number") == null) {
              aid = 0;
		   } else {
			  aid = Integer.parseInt(request.getParameter("number"));
		   }
		   athlete = result.findAthlete(aid);
		%>
        <div id="athlete">
           <div id="content2">
              <div id="left_info">
                 <div id="photo">
                 <img src="images/athlete.png" width=180 height=180>
                 </div>
              </div>
              <div id="right_info">
                 <div id="country">
                 <font id="titlefont2"><%=athlete.getName() %></font>
                 </div>
                 
                 <div id="firstlevel">
                    <font id="contentfont">Gender: <%=athlete.getGender() %></font>
                 </div>
                 
                 <div id="firstlevel">
                    <font id="contentfont">Nationality: <%=athlete.getCountry() %></font>
                 </div>
              
                 <div id="secondlevel">
                    <font id="contentfont">Birth Date: <%=athlete.getBirthDtae() %></font>
                 </div>
                 
                 <div id="secondlevel">
                    <font id="contentfont">Sport: <%=athlete.getSport() %></font>
                 </div>
              </div>
           </div>
           
        </div>
        
        <div id="athlete">
        <center>
           <div><font id = "titlefont">Medal List</font></div>
           </center>
        <table id="athletes">

            <tr>
               <th>Year</th>
               <th>Sports</th>
               <th>Event</th>
               <th>Rank</th>
               <th>Medal</th>
            </tr>

            <% 
               List list = athlete.getRecord();
				Iterator i = list.iterator();
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
			   <td><%=record.getRank()%></td>
			   <td><%=record.getMedal()%></td>
			</tr>
			<%	}
			%>
			
         </table>
         <center>
		</center>
		</div>
        <jsp:include page="Segment/Sidebar.jsp"></jsp:include>
        <jsp:include page="Segment/Footer.jsp"></jsp:include>
     </div> 
  </body>
</html>
