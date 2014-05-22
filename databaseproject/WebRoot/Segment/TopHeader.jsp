<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/style.css" rel="stylesheet" type="text/css" media="screen" />
    
  </head>
  
  <body>
    <div id="header">
        <h1><a href="SearchMain.jsp">Welcome to Olympics Database!</a></h1>
        <h2>Group Members: Hao Wu, Jingyi Wu, Jing Guo, Shenxin Chao</h2>
     </div>
     	 
	 <jsp:include page="Navigation.jsp"></jsp:include>
  </body>
</html>
