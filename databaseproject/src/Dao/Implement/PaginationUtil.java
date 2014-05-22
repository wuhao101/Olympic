package Dao.Implement;

import java.util.*;
import java.sql.*;

import Bean.AthleteRecord;
import Bean.Athlete;
import Dao.Base.DBConnection;

public class PaginationUtil {
	
	private Connection con = null;
	private List result;
	private int all;
	
//	public PaginationUtil() {
//		result = constructList();
//		if (result != null) {
//			all = result.size();
//		} else {
//			all = 0;
//		}
//	}
	
	public PaginationUtil(List record) {
		result = record;
		if (result != null) {
			all = result.size();
		} else {
			all = 0;
		}
	}
	
//	public List constructList() {		
//		con = DBConnection.getConnection();
//		try {
//			if (!con.isClosed()) {
//				System.out.println("HAHAHAHAH");
//			}
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		
//		PreparedStatement pd = null;
//		ResultSet rs = null;
//		String sql = "";
//		
//		sql = "select * from athletes_record order by rid limit 0, 100;"; 
//		List<AthleteRecord> lstList = new ArrayList(); 
//		try {
//			pd = con.prepareStatement(sql);
//			rs = pd.executeQuery(); 
//			while (rs.next()) { 
//				
//				AthleteRecord record = new AthleteRecord();  
//				record.setRid(rs.getInt(1));
//			    record.setAthName(rs.getString(3));
//			    record.setYear(rs.getInt(4));
//			    record.setGameType(rs.getString(5));
//			    record.setAge(rs.getInt(6));
//			    record.setSport(rs.getString(7));
//			    record.setEvent(rs.getString(8));
//			    record.setCountry(rs.getString(9));
//			    record.setRank(rs.getString(10));
//			    record.setMedal(rs.getString(11));
//				
//				lstList.add(record);
//				System.out.println(rs.getString(11));
//			}
//			
//			System.out.println("HAHAHAHAH");
//			
//			System.out.println(lstList.size());
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pd != null) {
//					rs.close();
//					pd.close();
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return lstList; 
//	}

	public List findGrade(int page, int pagesize) {
		List<AthleteRecord> lstList = new ArrayList(); 
		
		int i, j;
		for (i = (page - 1) * pagesize, j = 0; i < result.size() && j < pagesize; i ++, j++) {
			lstList.add((AthleteRecord)result.get(i));
		}
		System.out.println(lstList);
		return lstList; 
	}

//	public ResultSet findOrder(int page, int pagesize) {
//		con = DBConnection.getConnection(); 
//		
//		PreparedStatement pd = null;
//		ResultSet rs = null;
//		String sql = "";
//		sql = "select * from record order by rid limit " + (page - 1)
//				* pagesize + "," + pagesize + ""; 
//		
//		try {
//			pd = con.prepareStatement(sql);
//			rs = pd.executeQuery(); 
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pd != null) {
//					rs.close();
//					pd.close();
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return rs; 
//	}

	public int allPage(int pagesize) {
//		con = DBConnection.getConnection();
//
//		PreparedStatement pd = null;
//		ResultSet rs = null;
//		String sql = "";
		int allp = 0;
		System.out.print(all);
		allp = (all - 1) / pagesize + 1;
		System.out.println(allp);
//		try {
//			pd = con.prepareStatement(sql);
//			pd.execute("select count(*) from record");
//			rs = pd.getResultSet();
//			System.out.print("00");
//			rs.next();
//			int all = rs.getInt(1);
//			System.out.print(all);
//			allp = (all - 1) / pagesize + 1;
//			System.out.println(allp);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		return allp;

	}

	public static void main(String[] args) {
//		PaginationUtil pageinationUtil = new PaginationUtil();
//		List list = pageinationUtil.findGrade(2, 6);
//		for (int i = 0; i < list.size(); i++) {
//			User user = (User) list.get(i);
//			System.out.println(user.getId());
//		}
	}
}
