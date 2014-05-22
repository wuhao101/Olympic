package Dao.Base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String className="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/olympics";
	private static String user="root";
	private static String password="123456";
	
	public static Connection getConnection(){
		Connection con=null;
		try {
			Class.forName(className);
			con=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}

