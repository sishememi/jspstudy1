package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//Model 기능을 담당하는 클래스. db와 연관된 기능을 가진 클래스.
//Dao : Data Access Object
//Member: Member클래스
public class MemberDao {
	public Member selectOne(String id) {
		//id : 화면에서 입력된 아이디
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where binary id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public int insert(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member"+" (id , pass, name ,gender ,email ,tel ,picture) " 
											+ "values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql); //sql 전달
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getTel());
			pstmt.setString(7, m.getPicture());
			//int executeUpdate() : 변경된 레코드의 건수.
			return pstmt.executeUpdate(); //insert 성공: 1..
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
	 	return 0; //insert 실패. 0이하면 실패 0보다 크면 성공.
	} //=>join.jsp result 값에 ~
	public List<Member> list() {
		Connection conn = DBConnection.getConnection(); //Connection 객체생성
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>(); //비어있는  ArrayList객체
		try {
			pstmt = conn.prepareStatement("select * from member"); //member의 모든 데이터를 가져옴
			rs = pstmt.executeQuery(); //member의 모든 데이터를 받음
			while(rs.next()) {
				Member m = new Member(); //객체 생성시 레코드 생성.
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m); 
			}
			return list; //에러가 안나면 list전달.
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null; //에러가 나면 null값 전달.
	}
	public int update(Member m) {
		//m : 사용자가 입력한 회원 정보. 변경될 내용
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql="update member set name=?,gender=?,"
				+ "email=?,tel=?,picture=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getTel());
			pstmt.setString(5, m.getPicture());
			pstmt.setString(6, m.getId());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int delete(String id) {
		//m : 사용자가 입력한 회원 정보. 변경될 내용
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
	
		try {
			pstmt = conn.prepareStatement("delete from member where id=?");
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public int updatePass(String id, String pass) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set pass=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pass);
			pstmt.setString(2,id);
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	public String idfind(String email, String tel) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member where email = ? and tel = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}return null;
	}
	public String pwSearch(String id, String email, String tel) {
		   Connection conn = DBConnection.getConnection();
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   String sql="select pass from member "
		   		+ " where id =?  and email = ? and tel = ?";
		   try {
		     pstmt = conn.prepareStatement(sql);
		     pstmt.setString(1, id);
		     pstmt.setString(2, email);
		     pstmt.setString(3, tel);
		     rs = pstmt.executeQuery();
		     if (rs.next()) {
		    	 return rs.getString("pass");
		     } 		   
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			   DBConnection.close(conn,pstmt,rs);
		   }
		   return null;
	   }
}
