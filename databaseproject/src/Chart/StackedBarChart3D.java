package Chart;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;


public class StackedBarChart3D {

  public StackedBarChart3D() {
  }

  public CategoryDataset createDataset(String[] rowKeys, String[] columnKeys, double[][] data) {
	  
	  return DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);
		  
  }
  
  
  public JFreeChart createChart(final CategoryDataset dataset, String title) {
	  final JFreeChart chart = 
			   ChartFactory.createStackedBarChart3D(
					   title, "Match", "Year",
					   dataset, PlotOrientation.VERTICAL, true, true, false);

	  return chart;		  
  }

}
