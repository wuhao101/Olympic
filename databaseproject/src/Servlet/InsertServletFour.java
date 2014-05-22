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

public class InsertServletFour extends HttpServlet{
	
	String aid;
	int rid;
	String year;
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
	
	public InsertServletFour() {
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
	    
	    sport=request.getParameter("sport");
		event=request.getParameter("event");
		sql="insert into sports_events(sport,event) value(?,?)";
		
		try{
			ps=conn.prepareStatement(sql);
	        ps.setString(1, sport);
	        ps.setString(2, event);
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
