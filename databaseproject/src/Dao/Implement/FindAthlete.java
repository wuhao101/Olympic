package Dao.Implement;

import java.util.*;
import java.sql.*;

import Bean.AthleteRecord;
import Bean.Athlete;
import Dao.Base.DBConnection;

public class FindAthlete {
	
	private Connection con = null;
	private Connection con2 = null;
	
	public FindAthlete() {

	}
	
	public Athlete findAthlete(int aid) {		
		con = DBConnection.getConnection();
		try {
			if (!con.isClosed()) {
				System.out.println("HAHAHAHAH");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement pd = null;
		ResultSet rs = null;
		String sql = "";
		
		sql = "select * from athletes_information where aid =" + aid + ";"; 
		Athlete ath = new Athlete(); 
		try {
			pd = con.prepareStatement(sql);
			rs = pd.executeQuery(); 
			int flag = 0;
			while (rs.next()) { 
				if (flag == 1) {
					break;
				}
				  
				ath.setAid(rs.getInt(1));
			    ath.setName(rs.getString(2));
			    if (rs.getString(3).equals(new String("M"))) {
			    	ath.setGender("Male");
			    } else if (rs.getString(3).equals(new String("F"))) {
			    	ath.setGender("Female");
			    } else {
			    	ath.setGender("");
			    }
			    ath.setBirthDtae(rs.getString(4));
			    ath.setBirthPlace(rs.getString(5));
			    ath.setCountry(rs.getString(6));
			    String sport = rs.getString(7);	     
			    ath.setSport(rs.getString(7));
			    ath.setRecord(constructList(aid));
			}
			
			System.out.println("HAHAHAHAH");			
			System.out.println(ath.getAid());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pd != null) {
					rs.close();
					pd.close();
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ath; 
	}
	
	public List constructList(int aid) {	
		con2 = DBConnection.getConnection();
		try {
			if (!con2.isClosed()) {
				System.out.println("HAHAHAHAH");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement pd = null;
		ResultSet rs = null;
		String sql = "";
		
		sql = "select * from athletes_record where aid = " + aid + " order by year limit 0, 100;"; 
		List<AthleteRecord> lstList = new ArrayList(); 
		try {
			pd = con2.prepareStatement(sql);
			rs = pd.executeQuery(); 
			while (rs.next()) { 
				
				AthleteRecord record = new AthleteRecord();  
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
				
				lstList.add(record);
				System.out.println(rs.getString(11));
			}
			
			System.out.println("HAHAHAHAH");
			
			System.out.println(lstList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pd != null) {
					rs.close();
					pd.close();
					con2.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lstList; 
	}
	
}
