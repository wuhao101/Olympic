<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>

<%@ page import="Dao.Base.DBConnection"%> 
<%@ page import="java.sql.* "%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Search One</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<%
	   ResultSet r51 = null, r52 = null, r53 = null, r54 = null, r55= null;
	   Connection con5 = null;
	   int count;
       int count2;
	   con5 = DBConnection.getConnection();
	   Statement st5 = null;
	   try {
	      st5 = con5.createStatement();
	      System.out.println("XXXXXXXXXXXXXXXXXXX");
	   } catch (SQLException e) {
		  e.printStackTrace();
	   }
       String sql = "select * from sports_events order by sport asc;";
	   try {
	      r51 = st5.executeQuery(sql);
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	%> 
	
	<script language="javascript">
	   var onecount;
       onecount=0;
       subcat5=new Array();
       subcat52=new Array();
    <%
       count=0;
       while(r51.next()){
    %>
          subcat5[<%=count%>]=new Array("<%=r51.getString("sport")%>");
          subcat52[<%=count%>]=new Array("<%=r51.getString("event")%>");
    <%
          count = count + 1 ;
       }
       try {
          r51.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
    %>
       onecount=<%=count%>;
       function changelocation5(locationvalue) {
          document.view5.event5.length=0;
          var locationvalue5 = locationvalue;
          var i;
          document.view5.event5.options[document.view5.event5.length] = new Option("", "");
          for (i = 0; i < onecount; i ++) {
             if (subcat5[i] == locationvalue)
             {
                document.view5.event5.options[document.view5.event5.length] = new Option(subcat52[i], subcat52[i]);
             }
          }
       }
     </script>
     
  </head>
  
  <body>
     <div id="content">
        <form name="view5" method="post" action="MedalListServlet" target="info5">
              <div class="post">
                 <div class="searchrow">
                    <div class="checkcolumn">
		               <div>
		                  <label for="medal" ><font class="titlefont">Medal</font></label>
		               </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="goldcheck" name="goldcheck" value="goldcheck" checked/> <font class="checkfont">Gold</font>
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="silvercheck" name="silvercheck" value="silvercheck" checked/> <font class="checkfont">Silver</font>
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="bronzecheck" name="bronzecheck" value="silvercheck" checked/> <font class="checkfont">Broze</font>
                       </div>
                    </div>
                    
                    <div class="inputcolumn">
		               <div>
		                  <label for="athlete" ><font class="titlefont">Athlete</font></label>
		               </div>
                       <div>
                          <input class="selectinput" type="text" id="athleteinput" name="athleteinput"/>           
                       </div>
                       <div>
		                  <label for="country" ><font class="titlefont">Country</font></label>
		               </div>
                       <div>
                           <select class="selectinput" name="country5" id="country5"> 
                           <option selected="true"></option> 
                         <%
                            sql = "select distinct(Country) from countries_code order by Country;";
                            r53 = st5.executeQuery(sql);
			                try {
			                   while(r53.next()) {
			             %>
                            <option value="<%=r53.getString("Country")%>"><%=r53.getString("Country")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               r53.close();
				            } catch (SQLException e) {
				               e.printStackTrace();
				            }
                         %> 
                           </select>         
                       </div>
                    </div>
                    
                    <div class="inputcolumn">
                       <div>
		                  <label for="year" ><font class="titlefont">Year</font></label>
		               </div>
                       <div>
                           <select class="selectinput" name="year5" id="year5">
                           <option selected="true"></option> 
                         <%
                            sql = "select distinct(year) from years_cities order by year asc;";
                            r54 = st5.executeQuery(sql);
			                try {
			                   while(r54.next()) {
			             %>
                            <option value="<%=r54.getString("year")%>"><%=r54.getString("year")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               r54.close();
				            } catch (SQLException e) {
				               e.printStackTrace();
				            }
                         %> 
                           </select>         
                       </div>
                       <div>
		                    <label for="type" ><font class="titlefont">Type</font></label>
		               </div>
                       <div>
                            <select class="selectinput" name="type5" id="type5">
                            <option selected="true"></option> 
                         <%
                            sql = "select distinct(summer_winter) from years_cities order by summer_winter;";
                            r55 = st5.executeQuery(sql);
			                try {
			                   while(r55.next()) {
			             %>
                            <option value="<%=r55.getString("summer_winter")%>"><%=r55.getString("summer_winter")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               r55.close();
				            } catch (SQLException e) {
				               e.printStackTrace();
				            }
                         %> 
                            </select>          
                       </div>
                    </div>
                    
                    <div class="inputcolumn">
                       <div>
		                  <label for="sport" ><font class="titlefont">Sport</font></label>
		               </div>
                       <div>
                           <select class="selectinput" name="sport5" id="sport5" onChange="changelocation5(document.view5.sport5.options[document.view5.sport5.selectedIndex].value)">
                           <option selected="true"></option> 
                         <%
                            sql = "select distinct(sport) from sports_events order by sport asc;";
                            r52 = st5.executeQuery(sql);
			                try {
			                   while(r52.next()) {
			             %>
                            <option value="<%=r52.getString("sport")%>"><%=r52.getString("sport")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               r52.close();
				            } catch (SQLException e) {
				               e.printStackTrace();
				            }
                         %> 
                           </select>         
                       </div>
                       <div>
		                    <label for="event" ><font class="titlefont">Event</font></label>
		               </div>
                       <div>
                            <select class="selectinput" name="event5" id="event5"></select>          
                       </div>
                    </div>
                 </div>
              </div>
              
              <div class="submit">
                 <input class="button" type="submit" value="Submit"/>
              </div>
              </form>
           </div>
           
      <iframe name="info5" id="chart2" src="Segment/MedalList.jsp" ></iframe>
        
  </body>
</html>
