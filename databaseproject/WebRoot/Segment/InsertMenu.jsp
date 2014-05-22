<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>InsertMenu</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <script src="JS/jquery-1.4.3.min.js"></script>
        <script>
            $(function(){
                $(".tab_item li").mouseover(function(){
                    var num = $(this).index();
                    $(this).parents(".tab_item").siblings("div").find("ul").eq(num).siblings("ul").hide().end().show();
                    $(this).siblings("li").removeClass("hover").end().addClass("hover");
                });
            });
        </script>
    </head>

    <body>
        <div id="menu">
            <div class="four">
                <div class="tab_item">
                    <ul>
                        <li class="hover"><a href="#">Insert</a></li>
                    </ul>
                </div>
                <div class="list">
                    <ul>
                        <jsp:include page="Insert.jsp"></jsp:include>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>