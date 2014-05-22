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
      
      String fileName = null; 
      String url = null; 
      List list1 = (List)request.getAttribute("list1");
      List list2 = (List)request.getAttribute("list2");
      List list3 = (List)request.getAttribute("list3");
      List list4 = (List)request.getAttribute("list4");
      List list5 = (List)request.getAttribute("list5");
      String title = (String)request.getAttribute("title");
      
      System.out.println(list1);
      System.out.println(list2);
      System.out.println(list3);
      System.out.println(list4);
      System.out.println(list5);
      
      if (list1 != null && list2 != null && list3 != null && list4 != null && list5 != null && title != null) {
          if (list1.size() != 0 && list2.size() != 0 && list3.size() != 0 && list4.size() != 0 && list5.size() != 0) {
             int n = 0;
             int m = 0;
      
             n = list5.size();
             m = list1.size();
         
             double[][] data = new double[n][m];
             String[] rowKeys = new String[n]; 
             String[] columnKeys = new String[m]; 
         
         
             for (int i = 0; i < m; i ++) { 
                columnKeys[i] = (String)list1.get(i);
             }

             for (int i = 0; i < n; i ++) { 
                rowKeys[i] = (String)list5.get(i);
             }

             for (int i = 0; i < m; i ++) { 
                data[0][i] = ((Double)list2.get(i)).doubleValue();
             }
             for (int i = 0; i < m; i ++) { 
                data[1][i] = ((Double)list3.get(i)).doubleValue();
             }
             for (int i = 0; i < m; i ++) { 
                data[2][i] = ((Double)list4.get(i)).doubleValue();
             }
      
             StackedBarChart3D SBar = new StackedBarChart3D();
         
             CategoryDataset dataset = SBar.createDataset(rowKeys, columnKeys, data);
             JFreeChart chart = SBar.createChart(dataset, title);

             chart.setBackgroundPaint(Color.WHITE);
  
             CategoryPlot plot = chart.getCategoryPlot();
  
             NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
             rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
             rangeAxis.setAutoRangeIncludesZero(true);
             rangeAxis.setUpperMargin(0.20);
             rangeAxis.setLabelAngle(Math.PI / 2.0); 
             rangeAxis.setLabelFont(new Font("Trebuchet MS", Font.BOLD, 15));
      
             CategoryAxis domainAxis = plot.getDomainAxis();
             domainAxis.setLabelFont(new Font("Trebuchet MS", Font.BOLD, 15));
  
             plot.getRenderer().setSeriesPaint(0, new Color(255, 247, 0));
	         plot.getRenderer().setSeriesPaint(1, new Color(198, 198, 198));
	         plot.getRenderer().setSeriesPaint(2, new Color(247, 117, 51));

             plot.getRenderer().setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
             plot.getRenderer().setItemLabelFont(new Font("Trebuchet MS",Font.PLAIN,15));
             plot.getRenderer().setItemLabelsVisible(true);
  
  
             fileName = ServletUtilities.saveChartAsJPEG(chart,725,400,null,null); 
             url = request.getContextPath()+"/servlet/DisplayChart?filename="+fileName; 
    %> 
    
             <img src="<%=url%>" width=700 height=370 border=0 usemap="<%=fileName%>"> 
    <%    }
       }%>
  </body>
</html>
