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
	   ResultSet r1 = null, r2 = null, r3 = null, r4 = null;
	   Connection con = null;
	   int count;
       int count2;
	   con = DBConnection.getConnection();
	   Statement st = null;
	   try {
	      st = con.createStatement();
	   } catch (SQLException e) {
		  e.printStackTrace();
	   }
       String sql = "select distinct(year) from years_cities order by year asc;";
	   try {
	      r1 = st.executeQuery(sql);
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	%> 
	
	<script language="javascript">
	   var onecount;
       onecount=0;
       subcat4=new Array();
    <%
       count=0;
       while(r1.next()){
    %>
          subcat4[<%=count%>]=new Array("<%=r1.getInt("year")%>");
    <%
          count = count + 1 ;
       }
       try {
          r1.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
    %>
       onecount=<%=count%>;
       function changelocation4(locationvalue) {
          document.view4.endyear4.length=0;
          var locationvalue4 = locationvalue;
          var i;
          document.view4.endyear4.options[document.view4.endyear4.length] = new Option("", "");
          for (i = 0; i < onecount; i ++) {
             if (subcat4[i] >= locationvalue)
             {
                document.view4.endyear4.options[document.view4.endyear4.length] = new Option(subcat4[i], subcat4[i]);
             }
          }
       }
     </script>
  </head>
  
  <body>
      <div id="content">
          <form name="view4" method="post" action="ChartServletFour" target="info4">
              <div class="post">
                 <div class="introdyuctionrow"> 
                 <font id="introductionfont">A Trend graph of tally of medals for the selected country in one sport over the selected time period.</font>
                 </div>
		         <div class="searchonerow">        
                    <div class="inputonecolumn">
                       <div>
		                  <label for="startyear" ><font class="titlefont">Start Year</font></label>
		               </div>
                       <div>
                         <select class="yselectinput" name="startyear4" id="startyear4" onChange="changelocation4(document.view4.startyear4.options[document.view4.startyear4.selectedIndex].value)">
                         <option selected="true"></option> 
                         <%
                            r2 = st.executeQuery(sql);
			                try {
			                   while(r2.next()) {
			             %>
                            <option value="<%=r2.getInt("year")%>"><%=r2.getInt("year")%></option>
                         <%    }
			                } catch (SQLException e) {
				               e.printStackTrace();
				            }
				            try {
				               r2.close();
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
                          <select class="yselectinput" name="endyear4" id="endyear4">
                          <option selected="true"></option> 
                          </select>           
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="country" ><font class="titlefont">Country</font></label>
		               </div>
                       <div>
                          <select class="yselectinput" name="country4" id="country4">
                          <option selected="true"></option>
                          <%
                              sql = "select distinct(Country) from countries_code order by Country;";
                              r3 = st.executeQuery(sql);
			                  try {
			                     while(r3.next()) {
			               %>
                              <option value="<%=r3.getString("Country")%>"><%=r3.getString("Country")%></option>
                           <%    }
			                  } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 r3.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
                            %>  
                          </select>         
                       </div>
                    </div>
                    
                    <div class="inputonecolumn">
                       <div>
		                  <label for="sport" ><font class="titlefont">Sport</font></label>
		               </div>
                       <div>
                          <select class="yselectinput" name="sport4" id="sport4">
                          <option selected="true"></option> 
                          <%
                              sql = "select distinct(sport) from sports_events order by sport;";
                              r4 = st.executeQuery(sql);
			                  try {
			                     while(r4.next()) {
			               %>
                              <option value="<%=r4.getString("sport")%>"><%=r4.getString("sport")%></option>
                           <%    }
			                  } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 r4.close();
				              } catch (SQLException e) {
				                 e.printStackTrace();
				              }
				              try {
				                 con.close();
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
      <iframe name="info4" id="chart" src="Chart/OneLineChart.jsp" ></iframe> 
  </body>
</html>
