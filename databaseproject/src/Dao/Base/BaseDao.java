package Dao.Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	protected Connection con = null;
	protected PreparedStatement pst = null;
	protected ResultSet rs = null;
	
	public BaseDao() {
		con = DBConnection.getConnection();
	}
	
	public void close(ResultSet rs,PreparedStatement pst,Connection con){
		try {
			if (rs!=null) {
				rs.close();
			}
			pst.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
