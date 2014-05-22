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
	   ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null;
	   Connection conn = null;
	   int count;
       int count2;
	   conn = DBConnection.getConnection();
	   Statement statement = null;
	   try {
	      statement = conn.createStatement();
	   } catch (SQLException e) {
		  e.printStackTrace();
	   }
       String sql = "select distinct(year) from years_cities order by year asc;";
	   try {
	      rs1 = statement.executeQuery(sql);
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	%> 
	
	<script language="javascript">
	   var onecount;
       onecount=0;
       subcat=new Array();
    <%
       count=0;
       while(rs1.next()){
    %>
          subcat[<%=count%>]=new Array("<%=rs1.getInt("year")%>");
    <%
          count = count + 1 ;
       }
       try {
          rs1.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
    %>
       onecount=<%=count%>;
       function changelocation(locationvalue) {
          document.view1.endyear1.length=0;
          var locationvalue = locationvalue;
          var i;
          document.view1.endyear1.options[document.view1.endyear1.length] = new Option("", "");
          for (i = 0; i < onecount; i ++) {
             if (subcat[i] >= locationvalue)
             {
                document.view1.endyear1.options[document.view1.endyear1.length] = new Option(subcat[i], subcat[i]);
             }
          }
       }
     </script>
  </head>
  
  <body>
      <div id="content">
           <form name="view1" method="post" action="ChartServletOne" target="info1">
              <div class="post">
                 <div class="introdyuctionrow"> 
                 <font id="introductionfont">A Trend graph of tally of medals for the selected country over the selected time period.</font>
                 </div>
		         <div class="searchonerow">        
                    <div class="inputonecolumn">
                       <div>
		                  <label for="startyear" ><font class="titlefont">Start Year</font></label>
		               </div>
                       <div>
                         <select class="yselectinput" name="startyear1" id="startyear1" onChange="changelocation(document.view1.startyear1.options[document.view1.startyear1.selectedIndex].value)"> 
                         <option selected="true"></option>
                         <%
                            rs2 = statement.executeQuery(sql);
			                try {
			                   while(rs2.next()) {
			             %>
                            <option value="<%=rs2.getInt("year")%>"><%=rs2.getInt("year")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               rs2.close();
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
                          <select class="yselectinput" name="endyear1" id="endyear1">   
                          <option selected="true"></option> 
                          </select>        
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="country" ><font class="titlefont">Country</font></label>
		               </div>
                       <div>
                          <select class="yselectinput" name="country1" id="country1"> 
                           <option selected="true"></option>
                           <%
                              sql = "select distinct(Country) from countries_code order by Country;";
                              rs3 = statement.executeQuery(sql);
			                  try {
			                     while(rs3.next()) {
			               %>
                              <option value="<%=rs3.getString("Country")%>"><%=rs3.getString("Country")%></option>
                           <%    }
			                  } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 rs3.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
                            %> 
                          </select>         
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="type" ><font class="titlefont">Type</font></label>
		               </div>
                       <div>
                          <select class="yselectinput" name="type1" id="type1"> 
                          <option selected="true"></option>
                           <%
                              sql = "select distinct(summer_winter) from years_cities order by summer_winter;";
                              rs4 = statement.executeQuery(sql);
			                  try {
			                     while(rs4.next()) {
			               %>
                              <option value="<%=rs4.getString("summer_winter")%>"><%=rs4.getString("summer_winter")%></option>
                           <%    }
			                  } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 rs4.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 conn.close();
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
      <iframe name="info1" id="chart" src="Chart/LineChart.jsp" ></iframe>     
  </body>
</html>
