package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectionUtil {
	//  MySQL JDBC 연결하는 메소드 작성. 리턴 타입 Connection
	public static Connection connect() {
		Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/jcpdev?useSSL= false";
		String driver="com.mysql.cj.jdbc.Driver"; 
		String user ="jcpdev";
		String password="1234";    
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			conn.setAutoCommit(false); // auto commit 미 설정
		} catch (ClassNotFoundException e) {
			System.out.println("데이터베이스 드라이버 로드에 문제가 생겼습니다. : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 및 사용에 문제가 생겼습니다. : " + e.getMessage());
		} 
		
		return conn;
	}
	
	public static void close(Connection conn) {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("데이터베이스 연결 종료에 문제가 생겼습니다. : " + e.getMessage());
			}
	}

}