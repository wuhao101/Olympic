<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Sidebar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

  </head>
  
  <body>
    <div id="sidebar">
       <ul>
          <li>
             <h2>Recommendation</h2>
             <ul>
                <li><a href="http://www.olympic.org/">official website of the Olympic</a></li>
                <li><a href="http://www.london2012.com//">2012 London Olympics Official website</a></li>
                <li><a href="http://www.olympic.org/vancouver-2010-winter-olympics">2010 Vancouver Olympics Official  website</a></li>
                <li><a href="http://2008.olympic.cn//">2008  Beijing Olympics Official website</a></li>
                <li><a href="http://www.olympic.org/turin-2006-winter-olympics">2006 Turin Olympics Officail website</a></li>
                <li><a href="http://www.olympic.org/athens-2004-summer-olympics">2004 Athens Olympics Official  website</a></li>
                <li><a href="http://www.olympic.org/salt-lake-city-2002-winter-olympics">2002 Salt-Lake Olympic Official  website</a></li>
                <li><a href="http://www.olympic.org/sydney-2000-summer-olympics">2000 Sydney Olympic Official  website</a></li>
          
             </ul>
           </li>
        </ul>
     </div>
  </body>
</html>
