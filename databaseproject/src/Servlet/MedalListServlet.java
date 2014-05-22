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

import Bean.AthleteRecord;
import Dao.Base.DBConnection;

public class MedalListServlet extends HttpServlet {

	
	public MedalListServlet() {
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
		List list = new ArrayList();
		AthleteRecord record = null;
		
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
        
		sql = "select * from athletes_record ";
		
		String goldcheck = request.getParameter("goldcheck");
		String silvercheck = request.getParameter("silvercheck");
		String bronzecheck = request.getParameter("bronzecheck");
        String athname = request.getParameter("athleteinput");
        String country = request.getParameter("country5");
        String year = request.getParameter("year5");
        String type = request.getParameter("type5");
        String sport = request.getParameter("sport5");
        String event = request.getParameter("event5");
		
		int flag = 0;
		int medal = 0;
		
		if (goldcheck != null && goldcheck != " " && goldcheck != "") {
			if (flag == 0) {
				sql += "where (medal = 'gold' ";
				flag = 1;
			} else if (flag == 1) {
				if (medal == 0) {
					sql += "and (medal = 'gold' ";
				} else if (medal == 1) {
					sql += "or medal = 'gold' ";
				}
			}
			medal = 1;
		}
		
		if (silvercheck != null && silvercheck != " " && silvercheck != "") {
			if (flag == 0) {
				sql += "where (medal = 'silver' ";
				flag = 1;
			} else if (flag == 1) {
				if (medal == 0) {
					sql += "and (medal = 'silver' ";
				} else if (medal == 1) {
					sql += "or medal = 'silver' ";
				}
			}
			medal = 1;
		}
		
		if (bronzecheck != null && bronzecheck != " " && bronzecheck != "") {
			if (flag == 0) {
				sql += "where (medal = 'bronze' ";
				flag = 1;
			} else if (flag == 1) {
				if (medal == 0) {
					sql += "and (medal = 'bronze' ";
				} else if (medal == 1) {
					sql += "or medal = 'bronze' ";
				}
			}
			medal = 1;
		}
		
		if (medal == 1) {
			sql += ") ";
		}
		
		if (athname != null && athname != " " && athname != "") {
			if (flag == 0) {
				sql += "where lower(athName) like \"%" + athname.toLowerCase() + "%\" ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and lower(athName) like \"%" + athname.toLowerCase() + "%\" ";
			}
		}
		
		
		if (country != null  && country != " " && country != "") {
			if (flag == 0) {
				sql += "where country = \"" + country + "\" ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and country = \"" + country + "\" ";
			}
		}
		
		if (year != null  && year != " " && year != "") {
			if (flag == 0) {
				sql += "where year = " + year + " ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and year = " + year + " ";
			}
		}
		
		if (type != null  && type != " " && type != "") {
			if (flag == 0) {
				sql += "where summer_winter = '" + type + "' ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and summer_winter = '" + type + "' ";
			}
		}
		
		if (sport != null  && sport != " " && sport != "") {
			if (flag == 0) {
				sql += "where sport = \"" + sport + "\" ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and sport = \"" + sport + "\" ";
			}
		}
		
		if (event != null  && event != " " && event != "") {
			if (flag == 0) {
				sql += "where sport = \"" + event + "\" ";
				flag = 1;
			} else if (flag == 1) {
				sql += "and event = \"" + event + "\" ";
			}
		}
		
		sql += "order by year desc limit 0, 100;";
		
		System.out.println(sql +  "\n");
		
		try {
			pd = con.prepareStatement(sql);
			rs = pd.executeQuery();
			
			while (rs.next()){
				record = new AthleteRecord();
				record.setRid(rs.getInt(1));
				record.setAid(rs.getInt(2));
				record.setAthName(rs.getString(3));
				record.setYear(rs.getInt(4));
				record.setGameType(rs.getString(5));
				record.setAge(rs.getInt(6));
				record.setSport(rs.getString(7));
				record.setEvent(rs.getString(8));
				record.setCountry(rs.getString(9));
				record.setRank(rs.getString(10));
				record.setMedal(rs.getString(11));
				list.add(record);		
			}
			
//			System.out.println(list);
//			System.out.println("HAHAH");
            
			request.setAttribute("recordlist", list);
            session.setAttribute("recordlist", list); 
            pd.close();
            rs.close();
            con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/Segment/MedalList.jsp").forward(request, response); 
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
