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

public class InsertServletOne extends HttpServlet{
	
	int aid;
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
	
	public InsertServletOne() {
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
	    
	    aid= Integer.parseInt(request.getParameter("aid"));
	    aName = request.getParameter("athlete_name");
		aGender = request.getParameter("gender");
		aBD = request.getParameter("birthday");
		aBP = request.getParameter("birthplace");
		country = request.getParameter("icountry");
		sport = request.getParameter("sport");
		
		sql="insert into Athletes_Information(aid, athlete_name, gender, birthdate, birthplace, country, sport) " +
				"value(?,?,?,?,?,?,?)";	
		
		System.out.println("HHHHHHH   " + aGender);
		
		if (aGender.equals(new String("Male")) || aGender.equals(new String("male"))) {
			aGender = "M";
		} else if (aGender.equals(new String("Femal")) || aGender.equals(new String("femal"))) {
			aGender = "F";
		}
		
		System.out.println("HHHHHHH   " + aGender);
		
		try{
			ps=conn.prepareStatement(sql);
	        ps.setInt(1, aid);
	        ps.setString(2, aName);
	        ps.setString(3, aGender);
	        ps.setString(4, aBD);
	        ps.setString(5, aBP);
	        ps.setString(6, country);
	        ps.setString(7, sport);
	        
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