package Chart;


import java.awt.Color;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import java.awt.Font;
import org.jfree.chart.block.*;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.LegendTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.ui.*;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import java.text.DecimalFormat;
import java.text.NumberFormat; 

public class PieChart3D {
	public PieChart3D() {
		
	}
	
	public PieDataset createDataset(String[] columnKeys, double[] data) {
		DefaultPieDataset defaultpiedataset = new DefaultPieDataset();
		
		int length = columnKeys.length;
		
		for (int i = 0; i < length; i ++) {
			defaultpiedataset.setValue(columnKeys[i], new Double(data[i]));			
		}

        return defaultpiedataset;
	}
	
	public JFreeChart createChart(final PieDataset dataset) {
		  final JFreeChart chart = 
				   ChartFactory.createPieChart3D(
				  "Stacked Bar Chart ",
				  dataset, false, true, false);

		  return chart;		  
	  }

}
