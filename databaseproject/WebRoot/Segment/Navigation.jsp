<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Navigation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	
  </head>
  
  <body>
    <div id="navi">
       <dl id="gallery">
          <dt>Olympics Database 
          <dd><a title="Search" href="SearchMain.jsp">Search</a></dd> 
          <dd><a title="Quiz" href="Main.jsp">Quiz</a></dd> 
          <dd><a title="Insert" href="InsertMain.jsp">Insert</a></dd>
       </dl>
    </div>
  </body>
</html>
