<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@ page import="org.jfree.chart.servlet.ServletUtilities"%> 

<%@ page import="Chart.PieChart3D"%>  
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
<%@ page import="org.jfree.chart.plot.PiePlot"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PieChart3D.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <% 
      PieChart3D PBar = new PieChart3D();

      double[] data = {40.00, 60.00};
  
  
      String[] columnKeys = {"Special Athlete", "Other Athletes"}; 
      
      
      PieDataset dataset = PBar.createDataset(columnKeys, data);
      JFreeChart chart = PBar.createChart(dataset);
  
  
      chart.setBackgroundPaint(Color.WHITE);
      
      
      PiePlot pieplot = (PiePlot)chart.getPlot();
      pieplot.setSectionPaint(0, new Color(50, 80, 145));
      pieplot.setSectionPaint(1, new Color(150, 180, 215));
                
      pieplot.setLabelFont(new Font("Trebuchet MS", Font.BOLD, 15));
      pieplot.setNoDataMessage("No Data");
      pieplot.setCircular(true);
      pieplot.setLabelGap(0.07D);
      pieplot.setBackgroundPaint(Color.WHITE);
      pieplot.setOutlinePaint(Color.WHITE);
      pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(
              "{0} {2}",
              NumberFormat.getNumberInstance(),
              new DecimalFormat("0.00%")));
                

  
  
      String fileName = ServletUtilities.saveChartAsJPEG(chart,725,400,null,null); 
      String url = request.getContextPath()+"/servlet/DisplayChart?filename="+fileName; 
    %> 
    
    <div id="chart">
    <img src="<%=url%>" width=700 height=370 border=0 usemap="<%=fileName%>"> 
    </div>
  </body>
</html>
