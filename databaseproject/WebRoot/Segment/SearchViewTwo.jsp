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
	   ResultSet rs21 = null, rs22 = null, rs23 = null, rs24 = null;
	   Connection conn2 = null;
	   int count;
       int count2;
	   conn2 = DBConnection.getConnection();
	   Statement statement2 = null;
	   try {
	      statement2 = conn2.createStatement();
	   } catch (SQLException e) {
		  e.printStackTrace();
	   }
       String sql = "select distinct(year) from years_cities order by year asc;";
	   try {
	      rs21 = statement2.executeQuery(sql);
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	%> 
	
	<script language="javascript">
	   var onecount;
       onecount=0;
       subcat2 = new Array();
    <%
       count=0;
       while(rs21.next()){
    %>
          subcat2[<%=count%>]=new Array("<%=rs21.getInt("year")%>");
    <%
          count = count + 1 ;
       }
       try {
          rs21.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
    %>
       onecount=<%=count%>;
       function changelocation2(locationvalue) {
          document.view2.endyear2.length=0;
          var locationvalue2 = locationvalue;
          var i;
          document.view2.endyear2.options[document.view2.endyear2.length] = new Option("", "");
          for (i = 0; i < onecount; i ++) {
             if (subcat2[i] >= locationvalue2)
             {
                document.view2.endyear2.options[document.view2.endyear2.length] = new Option(subcat2[i], subcat2[i]);
             }
          }
       }
     </script>
  </head>
  
  <body>
      <div id="content">
          <form name="view2" method="post" action="ChartServletTwo" target="info2">
              <div class="post">
                 <div class="introdyuctionrow"> 
                 <font id="introductionfont">A bar graph of tally of medals for the selected sports category of the country with maximum number of medals in selected sports category over each selected time period.</font>
                 </div>
		         <div class="searchonerow">        
                    <div class="inputonecolumn">
                       <div>
		                  <label for="startyear" ><font class="titlefont">Start Year</font></label>
		               </div>
                       <div>
                         <select class="yselectinput" name="startyear2" id="startyear2" onChange="changelocation2(document.view2.startyear2.options[document.view2.startyear2.selectedIndex].value)"> 
                         <option selected="true"></option>
                         <%
                            rs22 = statement2.executeQuery(sql);
			                try {
			                   while(rs22.next()) {
			             %>
                            <option value="<%=rs22.getInt("year")%>"><%=rs22.getInt("year")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               rs22.close();
				            } catch (SQLException e) {
				               e.printStackTrace();
				            }
                         %> 
                         </select>            
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="endyear" ><font class="titlefont">End Year</font></label>
		               </div>
                       <div>
                          <select class="yselectinput" name="endyear2" id="endyear2"> </select>           
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="sport" ><font class="titlefont">Sport</font></label>
		               </div>
                       <div>
                          <select class="cselectinput" name="sport2" id="sport2"> 
                          <option selected="true"></option> 
                          <%
                              sql = "select distinct(sport) from sports_events order by sport;";
                              rs24 = statement2.executeQuery(sql);
			                  try {
			                     while(rs24.next()) {
			               %>
                              <option value="<%=rs24.getString("sport")%>"><%=rs24.getString("sport")%></option>
                           <%    }
			                  } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 rs24.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 conn2.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
                            %> 
                          </select>         
                       </div>
                    </div>
                 </div>
              </div>
              
              <div class="submit">
                 <input class="button" type="submit" value="Submit"/>
              </div>
          </form>
      </div>
      <iframe name="info2" id="chart" src="Chart/StackedBarChart3D.jsp" ></iframe>   
  </body>
</html>
