<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
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

  </head>
  
  <body>
    <div id="content">
           <form name="view3" method="post" action="ChartServletTwo" target="info3">
              <div class="post">
                 <div class="introdyuctionrow"> 
                 <font id="introductionfont">A pie chart of % total medals won by the selected athlete as compared to % total medals won by remaining athletes in the selected sport for the selected country.</font>
                 </div>
		         <div class="searchtworow">        
                    <div class="inputtwocolumn">
                       <div>
		                  <label for="country" ><font class="titlefont">Country</font></label>
		               </div>
                       <div>
                         <select class="cselectinput" name="country3" id="country3"> </select>            
                       </div>
                    </div>
                    
                    <div class="inputtwocolumn">
                       <div>
		                  <label for="sport" ><font class="titlefont">Sport</font></label>
		               </div>
                       <div>
                          <select class="cselectinput" name="sport3" id="sport3"> </select>           
                       </div>
                    </div>
                    
                    <div class="inputtwocolumn">
                       <div>
		                  <label for="athlete" ><font class="titlefont">Athlete</font></label>
		               </div>
                       <div>
                          <select class="cselectinput" name="athlete3" id="athlete3"> </select>         
                       </div>
                    </div>
                 </div>
              </div>
              
              <div class="submit">
                 <input class="button" type="submit" value="Submit"/>
              </div>
               </form>
           </div>
        
      <iframe name="info3" id="chart" src="Chart/PieChart3D.jsp" ></iframe> 
        
  </body>
</html>
