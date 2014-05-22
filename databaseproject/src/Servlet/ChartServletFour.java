package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Base.DBConnection;

public class ChartServletFour extends HttpServlet {

	
	public ChartServletFour() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection con = null;
		PreparedStatement pd = null;
		ResultSet rs = null;
		String sql = "";
		List list1 = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();
		
		con = DBConnection.getConnection();
		
		try {
			if (con.isClosed()) {
				System.out.println(new String("Hi"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
        
        String cname = request.getParameter("country4");
        String syear = request.getParameter("startyear4");
        String eyear = request.getParameter("endyear4");
        String sport = request.getParameter("sport4");
        
		System.out.println(syear + "tt" + eyear + "\n");
		
		if (eyear == null || eyear == "" || eyear == " ") {
			sql = "select count(medal), year " +
		        	  "from athletes_record " +
		        	  "where country = '" + cname + "' and year >= " + syear + " and sport = \"" + sport + "\" and medal <> '' " +
		        	  "group by year " +
		        	  "order by year;";
		} else {
			sql = "select count(medal), year " +
		        	  "from athletes_record " +
		        	  "where country = '" + cname + "' and year >= " + syear + " and year <= " + eyear + " and sport = \"" + sport + "\" and medal <> '' " +
		        	  "group by year " +
		        	  "order by year;";
		}

		System.out.println(sql +  "\n");
		
		try {
			pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				System.out.println(rs.getString(1) +  "\n");
				list1.add(rs.getString(2));
				list2.add(rs.getDouble(1));			
			}
			
			list3.add(new String("Medal"));
            
			request.setAttribute("title4", cname+" / "+sport);
			request.setAttribute("list41", list1);
            request.setAttribute("list42", list2);
            request.setAttribute("list43", list3);
             
            pd.close();
            rs.close();
            con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/Chart/OneLineChart.jsp").forward(request, response); 
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}