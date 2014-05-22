package Chart;

import javax.swing.JPanel; 

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;

public class LineChart {
	public LineChart() {
		
	}

	public static CategoryDataset createDataset(String[] rowKeys, String[] columnKeys, double[][] data) {

		return DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);
			  
	}
	
	public JFreeChart createChart(final CategoryDataset dataset, String title) {		  
		  final JFreeChart chart = ChartFactory.createLineChart(title, // chart title
				    "Year", // domain axis label
				    "Medals", // range axis label
				    dataset, // data
				    PlotOrientation.VERTICAL, // orientation
				    true, // include legend
				    true, // tooltips
				    false // urls
				    );
		  
		  return chart;		  
	  }
}
