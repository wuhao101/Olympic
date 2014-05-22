<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>InsertMain</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link href="CSS/style.css" rel="stylesheet" type="text/css" media="screen" />

    </head>

    <body>
        <jsp:include page="Segment/TopHeader.jsp"></jsp:include>
        <div id="header2">
            <jsp:include page="Segment/InsertMenu.jsp"></jsp:include>
        </div>
        <div id="page">
            <%--<jsp:include page="Segment/Sidebar.jsp"></jsp:include>--%>
            <jsp:include page="Segment/Footer.jsp"></jsp:include>
        </div> 


    </body>
</html>
