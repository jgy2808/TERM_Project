//package com.jgy.webapp.db;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.jgy.webapp.service.MemberService;
//
//@Service
//public class JDBCController implements MemberService{
//	
//	@Autowired
//	private DataSource dataSource;
//	
//	public void TestPing() throws SQLException {
//		Connection connection = dataSource.getConnection();
//		System.out.println("Database connectino success!!");
//		connection.close();
//	}
//	
//
//	@Override
//	public String getRecycle(String object) throws SQLException {
//		String recycle = "-1";
//		String sql = "select recycle from way where id = ?";
//		Connection conn = dataSource.getConnection();
//		PreparedStatement pstm = conn.prepareStatement(sql);
//		pstm.setString(1, object);
//		ResultSet rs = pstm.executeQuery();
//		while (rs.next()) {
//			recycle = rs.getString(1);
//		}
//		rs.close();
//		pstm.close();
//		conn.close();
//		return recycle;
//	}
//	
//	@Override
//	public int Login(String id, String pw) throws SQLException {
//		String sql = "select pw from members where id = ?";
//		Connection conn = dataSource.getConnection();
//		PreparedStatement pstm = conn.prepareStatement(sql);
//		pstm.setString(1, id);		
//		ResultSet rs = pstm.executeQuery();
//		while(rs.next()) {
//			if (rs.getString(1).equals(pw)) {
//				System.out.println("로그인 성공");
//				rs.close();
//				pstm.close();
//				conn.close();
//				return 1;
//			} else {
//				System.out.println("비밀번호 틀림");
//				rs.close();
//				pstm.close();
//				conn.close();
//				return 0;
//			}
//		}
//		System.out.println("아이디 없음");
//		rs.close();
//		pstm.close();
//		conn.close();
//		return -1;
//	}
//	
//	@Override
//	public int Signup(String id, String pw) throws SQLException {
//		String sql = "select id from members where id = ?";
//		Connection conn = dataSource.getConnection();
//		PreparedStatement pstm = conn.prepareStatement(sql);
//		pstm.setString(1, id);	
//		ResultSet rs = pstm.executeQuery();
//		while(rs.next()) {
//			System.out.println("아이디 중복");
//			return 0;
//		}
//		rs.close();
//		pstm.close();
//		
//		sql = "insert into members values (?, ?)";	
//		pstm = conn.prepareStatement(sql);
//		pstm.setString(1, id);
//		pstm.setString(2, pw);
//		pstm.execute();
//		System.out.println("회원 가입 완료");
//		rs.close();
//		pstm.close();
//		conn.close();
//		return 1;
//	}
//}
