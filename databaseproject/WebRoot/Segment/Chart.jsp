<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html;charset=GBK"%>


<%@ page import="org.jfree.chart.servlet.ServletUtilities"%> 

<%@ page import="Chart.StackedBarChart3D"%>  
<%@ page import="org.jfree.data.category.CategoryDataset"%> 
<%@ page import="org.jfree.chart.plot.CategoryPlot"%> 
<%@ page import="org.jfree.data.category.CategoryDataset"%> 


<%@ page import="java.awt.Color"%>  
<%@ page import="java.awt.Font"%>  
<%@ page import="java.io.File"%>  
<%@ page import="java.io.FileOutputStream"%>  
<%@ page import="java.text.DecimalFormat"%> 
<%@ page import="java.text.NumberFormat"%>  
<%@ page import="java.awt.BasicStroke"%>

<%@ page import="org.jfree.chart.ChartFactory"%>  
<%@ page import="org.jfree.chart.ChartUtilities"%> 
<%@ page import="org.jfree.chart.JFreeChart"%> 
<%@ page import="org.jfree.chart.axis.CategoryAxis"%>  
<%@ page import="org.jfree.chart.axis.CategoryLabelPositions"%>  
<%@ page import="org.jfree.chart.axis.NumberAxis"%> 
<%@ page import="org.jfree.chart.axis.ValueAxis"%> 
<%@ page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>  
<%@ page import="org.jfree.chart.labels.StandardPieSectionLabelGenerator"%> 
<%@ page import="org.jfree.chart.plot.CategoryPlot"%> 
<%@ page import="org.jfree.chart.plot.PiePlot3D"%> 
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>  
<%@ page import="org.jfree.chart.renderer.category.BarRenderer"%>  
<%@ page import="org.jfree.chart.renderer.category.LineAndShapeRenderer"%>  
<%@ page import="org.jfree.chart.renderer.category.StackedBarRenderer"%> 
<%@ page import="org.jfree.chart.title.TextTitle"%> 
<%@ page import="org.jfree.data.category.CategoryDataset"%>  
<%@ page import="org.jfree.data.general.DatasetUtilities"%> 
<%@ page import="org.jfree.data.general.DefaultPieDataset"%> 
<%@ page import="org.jfree.data.general.PieDataset"%> 


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Chart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/style.css" rel="stylesheet" type="text/css" media="screen" />
	
	
    </script>
	

  </head>
  
  <body>
    
    <% 
      StackedBarChart3D SBar = new StackedBarChart3D();
  
      double[][] data = new double[][]{
                 {210, 300, 320, 265, 299},
                 {200, 304, 201, 201, 340},
                 {210, 300, 320, 265, 299},
                 };
  
      String[] rowKeys = {"Gold", "Silver", "Broze"}; 
  
      String[] columnKeys = { "1990", "1994", "1998", "2002", "2006" }; 
  
      CategoryDataset dataset = SBar.createDataset(rowKeys, columnKeys, data);
      JFreeChart chart = SBar.createChart(dataset,"111");
  
  
      chart.setBackgroundPaint(Color.WHITE);
      
      
      CategoryPlot plot = chart.getCategoryPlot();
  
  
      plot.getRenderer().setSeriesPaint(0, new Color(20, 70, 145));
	  plot.getRenderer().setSeriesPaint(1, new Color(40, 120, 185));
	  plot.getRenderer().setSeriesPaint(2, new Color(150, 180, 215));

      plot.getRenderer().setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
      plot.getRenderer().setItemLabelFont(new Font("Black",Font.PLAIN,15));
      plot.getRenderer().setItemLabelsVisible(true);
  
  
      String fileName = ServletUtilities.saveChartAsJPEG(chart,725,400,null,null); 
      String url = request.getContextPath()+"/servlet/DisplayChart?filename="+fileName; 
    %> 
    
    <div id="chart">
    <img src="<%=url%>" width=725 height=400 border=0 usemap="<%=fileName%>"> 
    </div>
    
  </body>
</html>
