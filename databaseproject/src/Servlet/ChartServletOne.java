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

public class ChartServletOne extends HttpServlet {

	
	public ChartServletOne() {
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
		List list5 = new ArrayList();
		List list1 = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();
		List list4 = new ArrayList();
		
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
        
        String cname = request.getParameter("country1");
        String syear = request.getParameter("startyear1");
        String eyear = request.getParameter("endyear1");
        String type = request.getParameter("type1");
        
		System.out.println(syear + "tt" + eyear + "\n");
		
		if (eyear == null || eyear == "" || eyear == " ") {
			sql = "select year, gold, silver, bronze " +
		        	  "from countries_record " +
		        	  "where country = '" + cname + "' and year >= " + syear + " and summer_winter = '" + type + "' " +
		        	  "order by year;";
		} else {
			sql = "select year, gold, silver, bronze " +
		        	  "from countries_record " +
		        	  "where country = '" + cname + "' and year >= " + syear + " and year <= " + eyear + " and summer_winter = '" + type + "' " +
		        	  "order by year;";
		}

		System.out.println(sql +  "\n");
		
		try {
			pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				System.out.println(rs.getString(1) +  "\n");
				list1.add(rs.getString(1));
				list2.add(rs.getDouble(2));
				list3.add(rs.getDouble(3));
				list4.add(rs.getDouble(4));
				
			}
			
			list5.add(new String("Gold"));
			list5.add(new String("Silver"));
			list5.add(new String("Bronze"));
			
			System.out.println(list5.size());
			System.out.println("HAHAH");
            
			request.setAttribute("title", cname);
			request.setAttribute("list1", list1);
            request.setAttribute("list2", list2);
            request.setAttribute("list3", list3);
            request.setAttribute("list4", list4);
            request.setAttribute("list5", list5);
             
            pd.close();
            rs.close();
            con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/Chart/LineChart.jsp").forward(request, response); 
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
