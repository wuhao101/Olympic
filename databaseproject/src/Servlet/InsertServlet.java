package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InsertServlet extends HttpServlet{
	
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
	
	public InsertServlet() {
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
		
		//insert Athletes_Information
		aName = request.getParameter("athlete_name");
		aGender = request.getParameter("gender");
		aBD = request.getParameter("birthday");
		aBP = request.getParameter("birthplace");
		country = request.getParameter("country");
		sport = request.getParameter("sport");
		
		sql="insert into Athletes_Information(athlete_name, gender, birthdate, birthplace, country, sport) " +
				"value(aName,aGender,aBD,aBP,country,sport)";
		
		//insert Athletes_Record
		aid= request.getParameter("aid");
		country= request.getParameter("country");
		sport= request.getParameter("sport");
		year = request.getParameter("year");
		rank = request.getParameter("rank");
		aName = request.getParameter("athlete_name");
		event = request.getParameter("event");
		term= request.getParameter("summer_winter");
		age= request.getParameter("iage");
		medal = request.getParameter("medal");
		
		sql="insert into Athletes_Record(aid, athName, year, summer_winter, age, sport, event, country, rank, medal) " +
				"value(aid,aName,year,term,age,sport,event,country,rank,medal)";
		

		//insert country_code
		country=request.getParameter("icountry");
		code=request.getParameter("code");
		sql="insert into countries_code(Country,Code) value(country,code)";
		
		//insert sports_events
		sport=request.getParameter("sport");
		event=request.getParameter("event");
		sql="insert into sports_events(sport,event) value(sport,event)";
		
		
		//insert Years_Cities
		year = request.getParameter("year");
		city = request.getParameter("city");
		term = request.getParameter("summer_winter");
		sql="insert into years_cities(year,summer_winter,city) value(year,term,city)";	
	}
		
}
