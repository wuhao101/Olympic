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

public class InsertServletTwo extends HttpServlet{
	
	int aid;
	int rid;
	int year;
	int age;
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
	
	public InsertServletTwo() {
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
	    
	    rid = Integer.parseInt(request.getParameter("rid"));
	    aid= Integer.parseInt(request.getParameter("aid"));
		country= request.getParameter("icountry");
		sport= request.getParameter("sport");
		year = Integer.parseInt(request.getParameter("year"));
		rank = request.getParameter("rank");
		aName = request.getParameter("athlete_name");
		event = request.getParameter("event");
		term= request.getParameter("summer_winter");
		age= Integer.parseInt(request.getParameter("iage"));
		medal = request.getParameter("medal");
		
		sql="insert into Athletes_Record(rid, aid, athName, year, summer_winter, age, sport, event, country, rank, medal) " +
				"value(rid, aid,aName,year,term,age,sport,event,country,rank,medal)";
		
		System.out.println("HHHHHHH   " + aGender);
		
		if (aGender.equals(new String("Male")) || aGender.equals(new String("male"))) {
			aGender = "M";
		} else if (aGender.equals(new String("Femal")) || aGender.equals(new String("femal"))) {
			aGender = "F";
		}
		
		System.out.println("HHHHHHH   " + aGender);
		
		try{
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rid);
	        ps.setInt(2, aid);
	        ps.setString(3, aName);
	        ps.setInt(4, year);
	        ps.setString(5, term);
	        ps.setInt(6, age);
	        ps.setString(7, sport);
	        ps.setString(8, event);
	        ps.setString(9, country);
	        ps.setString(10, rank);
	        ps.setString(11, medal);
	        
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