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
              <div class="post">
		         <div class="searchrow">
		            <div class="checkcolumn">
		               <div>
		                  <label for="gender" ><font class="titlefont">Gender</font></label>
		               </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="malecheck" name="malecheckbox" value="checkbox"/> <font class="checkfont">Male</font>      
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="femalecheck" name="femalecheckbox" value="checkbox"/> <font class="checkfont">Female</font>
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="mixedcheck" name="mixedcheckbox" value="checkbox"/> <font class="checkfont">Mixed</font>
                       </div>
                    </div>
                    
                    <div class="checkcolumn">
		               <div>
		                  <label for="medal" ><font class="titlefont">Medal</font></label>
		               </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="goldcheck" name="goldcheckbox" value="checkbox"/> <font class="checkfont">Gold</font>
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="silvercheck" name="silvercheckbox" value="checkbox"/> <font class="checkfont">Silver</font>
                       </div>
                       <div>
                          <input class="checkinput" type="checkbox" id="brozecheck" name="brozecheckbox" value="checkbox"/> <font class="checkfont">Broze</font>
                       </div>
                    </div>
                    
                    <div class="inputcolumn">
                       <div>
		                  <label for="startyear" ><font class="titlefont">Start Year</font></label>
		               </div>
                       <div>
                          <input class="yearinput" type="text" id="startinput" name="startyearinput"/>           
                       </div>
                       <div>
		                  <label for="endyear" ><font class="titlefont">End Year</font></label>
		               </div>
                       <div>
                          <input class="yearinput" type="text" id="endinput" name="endyearinput"/>           
                       </div>
                    </div>
                    
                    <div class="inputcolumn">
                       <div>
		                  <label for="country" ><font class="titlefont">Country</font></label>
		               </div>
                       <div>
                           <select class="selectinput" name="country"> </select>         
                       </div>
                       <div>
		                    <label for="event" ><font class="titlefont">Event</font></label>
		               </div>
                       <div>
                            <select class="selectinput" name="event"></select>          
                       </div>
                    </div>
                 </div>
              </div>
              
              <div class="submit">
                 <input class="button" type="button" value="Submit"/>
              </div>
           </div>

     
        
  </body>
</html>
