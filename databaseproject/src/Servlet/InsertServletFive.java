package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Base.DBConnection;

public class InsertServletFive extends HttpServlet{
	
	String aid;
	int rid;
	int year;
	String age;
	String sql;
	String aName;
	String aGender;
	String aBD;
	String aBP;
	String country;
	String sport;
	String event;
	String rank;
	String term;
	String medal;
	String code;
	String city;
	
	public InsertServletFive() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		conn = DBConnection.getConnection();
	    PreparedStatement ps = null;
	    
	    try {
			if (!conn.isClosed()) {
				System.out.println("ZZZZZZZZZZZZZZZZZZZZ");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	    year = Integer.parseInt(request.getParameter("year"));
		city = request.getParameter("city");
		term = request.getParameter("summer_winter");
		sql="insert into years_cities(year,summer_winter,city) value(?,?,?)";	
		
		try{
			ps=conn.prepareStatement(sql);
	        ps.setInt(1, year);
	        ps.setString(2, term);
	        ps.setString(3, city);
	        System.out.println("SQL");
	        ps.executeUpdate();
//	        response.sendRedirect("operation.jsp");
//	        ps.close();
//            rs.close();
//	        conn.close();
	    }catch(Exception e){
	    	request.setAttribute("result", 0);
	    	 e.printStackTrace();
	    }
		
		request.setAttribute("result", 1);
		
		request.getRequestDispatcher("/InsertMain.jsp").forward(request, response);
	}
		
}