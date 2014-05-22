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

public class ChartServletTwo extends HttpServlet {

	
	public ChartServletTwo() {
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
		
		String cname = null;
		List list5 = new ArrayList();
		List list1 = new ArrayList();
		
		List list2 = new ArrayList();
		List list2g = new ArrayList();
		List list2y = new ArrayList();
		
		List list3 = new ArrayList();
		List list3g = new ArrayList();
		List list3y = new ArrayList();
		
		List list4 = new ArrayList();
		List list4g = new ArrayList();
		List list4y = new ArrayList();
		
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
        
        String syear = request.getParameter("startyear2");
        String eyear = request.getParameter("endyear2");
        String sport = request.getParameter("sport2");
        
		System.out.println(syear + "tt" + eyear + "\n");
		
		if (eyear == null || eyear == "" || eyear == " ") {
			sql = "select country " +
					  "from athletes_record " +
					  "where sport = \"" + sport + "\" and medal <> '' and year >= '" + syear + "' " +
					  "group by country " +
					  "having count(medal) >= all(" +
					  "select count(medal) " +
					  "from athletes_record " +
					  "where year >= " + syear + " and sport = \"" + sport + "\" and medal <> '' " +
					  "group by country) " +
					  "order by country;";
		} else {
			sql = "select country " +
				  "from athletes_record " +
				  "where sport = \"" + sport + "\" and medal <> '' and year >= " + syear + " and year <= " + eyear + " " +
				  "group by country " +
				  "having count(medal) >= all(" +
				  "select count(medal) " +
				  "from athletes_record " +
				  "where year >= " + syear + " and year <= " + eyear + " and sport = \"" + sport + "\" and medal <> '' " +
				  "group by country) " +
				  "order by country;";
		}

		System.out.println(sql +  "\n");
		
		try {
			pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			int flag = 0;
			while (rs.next()){
				if (flag > 0) {
					break;
				}
				System.out.println(rs.getString(1) +  "\n");
				cname = rs.getString(1);
				flag ++;
			}
			
			pd = null;
            rs = null;
            
            if (eyear == null || eyear == "" || eyear == " ") {
    			sql = "select year " +
    		        	  "from athletes_record " +
    		        	  "where country = '" + cname + "' and year >= " + syear + " and sport = \"" + sport + "\" and medal <> '' " +
    		        	  "group by year " +
    		        	  "order by year;";
    		} else {
    			sql = "select year " +
    		        	  "from athletes_record " +
    		        	  "where country = '" + cname + "' and year >= " + syear + " and year <= " + eyear + " and sport = \"" + sport + "\" and medal <> '' " +
    		        	  "group by year " +
    		        	  "order by year;";
    		}
            
            pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				System.out.println(rs.getInt(1) +  "\n");
				list1.add(rs.getString(1));
				list2.add(new Double(0));
				list3.add(new Double(0));
				list4.add(new Double(0));
			}
			
			pd = null;
            rs = null;
            
            if (eyear == null || eyear == "" || eyear == " ") {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Gold' and year >= " + syear + " " +
    					"group by country, year;";
    		} else {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Gold' and year >= " + syear + " and year <= " + eyear + " " +
    					"group by country, year;";
    		}
            
            System.out.println(sql +  "\n");
            
            pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				list2y.add(rs.getString(1));
				list2g.add(rs.getDouble(2));
			}
			
			pd = null;
            rs = null;
            
            if (eyear == null || eyear == "" || eyear == " ") {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Silver' and year >= " + syear + " " +
    					"group by country, year;";
    		} else {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Silver' and year >= " + syear + " and year <= " + eyear + " " +
    					"group by country, year;";
    		}
            
            System.out.println(sql +  "\n");
            
            pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				list3y.add(rs.getString(1));
				list3g.add(rs.getDouble(2));
			}
			
			pd = null;
            rs = null;
            
            if (eyear == null || eyear == "" || eyear == " ") {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Bronze' and year >= " + syear + " " +
    					"group by country, year;";
    		} else {
    			sql = "select year, count(medal) " +
    					"from athletes_record " +
    					"where country = '" + cname + "' and sport = \"" + sport + "\" and medal = 'Bronze' and year >= " + syear + " and year <= " + eyear + " " +
    					"group by country, year;";
    		}
            
            System.out.println(sql +  "\n");
            
            pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				list4y.add(rs.getString(1));
				list4g.add(rs.getDouble(2));
			}
            
			for (int i = 0; i < list1.size(); i ++) {
				for (int j = 0; j < list2y.size(); j ++) {
					if (((String)list1.get(i)).equals((String)list2y.get(j))) {
						System.out.println(i);
						System.out.println(j);
						System.out.println("HIIIIIIIIII");
						list2.set(i, (Double)list2g.get(j));
						break;
					}
				}
			}
			
			for (int i = 0; i < list1.size(); i ++) {
				for (int j = 0; j < list3y.size(); j ++) {
					if (((String)list1.get(i)).equals((String)list3y.get(j))) {
						list3.set(i, (Double)list3g.get(j));
						break;
					}
				}
			}
			
			for (int i = 0; i < list1.size(); i ++) {
				for (int j = 0; j < list4y.size(); j ++) {
					if (((String)list1.get(i)).equals((String)list4y.get(j))) {
						list4.set(i, (Double)list4g.get(j));
						break;
					}
				}
			}
			
			list5.add(new String("Gold"));
			list5.add(new String("Silver"));
			list5.add(new String("Bronze"));
			
			
			System.out.println(list1);
			System.out.println(list2g);
			System.out.println(list3g);
			System.out.println(list4g);
			
			System.out.println(list2y);
			System.out.println(list3y);
			System.out.println(list4y);
			System.out.println(list5.size());
			System.out.println("HAHAH");
            
			request.setAttribute("title", cname + " / " + sport);
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
		
		request.getRequestDispatcher("/Chart/StackedBarChart3D.jsp").forward(request, response); 
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
