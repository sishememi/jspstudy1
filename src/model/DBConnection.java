package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	private DBConnection() {} //생성자를 막음으로써 객체생성 불가.
	static Connection getConnection() {
		Connection conn =null;
		try {
			Class.forName("org.mariadb.jdbc.Driver"); //db연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234"); //db연결
		} catch(Exception e) {
			e.printStackTrace();	
		}
		return conn;
	}
	static void close(Connection conn,Statement stmt,ResultSet rs) { //model에서만 사용하도록 static앞에 접근제어자 명세하지않음.
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) {
				conn.commit();
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
