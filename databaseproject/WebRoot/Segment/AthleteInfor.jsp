<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AthleteInfor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/style.css">

  </head>
  
  <body>
  <div id="content">
    <div id="title">
          <p>the information of the Athlete</p>
        </div>
        <div id="info">
                  <div id="name">
                     <p>name</p>
                  </div>
                  <div id="content2">
                         <div id="left_info">
                                 <div id="photo">
                                 </div>
                         </div>

                         <div id="right_info">
                                 <div id="country">
                                   <p>country</p>
                                 </div>

                                 <div id="firstlevel">
                                       <div id="dob">
                                          <p>date of birth</p>
                                       </div>
                                       <div id="age">
                                           <p>age</p>
                                       </div>
                                 </div>

                                 <div id="secondlevel">
                                       <div id="gender">
                                          <p>gender</p> 
                                       </div>
                                       <div id="sports">
                                           <p>sports</p>
                                       </div>
                                 </div>
                         </div>
                  </div>
         </div>
</div>
  </body>
</html>
