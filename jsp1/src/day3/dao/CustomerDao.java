package day3.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day3.dto.Customer;
import util.MySQLConnectionUtil;

public class CustomerDao {
	// 싱글턴 객체 생성
	private static CustomerDao dao = new CustomerDao();

	private CustomerDao() {
	}

	public static CustomerDao getInstance() {
		return dao;
	}

	public void update(Customer cus) {
		Connection conn = MySQLConnectionUtil.connect();
		String sql = "update customer set email = ?, address = ? " + "	where idx = ?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cus.getEmail());
			ps.setString(2, cus.getAddress());
			ps.setInt(3, cus.getIdx());

			ps.execute();
			conn.commit();
		} catch (SQLException e) {
			System.out.println("update 오류" + e.getMessage());
		} finally {
			try {
				ps.close();
				MySQLConnectionUtil.close(conn);
			} catch (SQLException e) {
				System.out.println("close 오류" + e.getMessage());
			}
		}
	}

	public Customer selectOne(int idx) {
		Customer cus = null;
		String sql = "select * from customer where idx = ?";
		Connection conn = MySQLConnectionUtil.connect();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			if (rs.next()) {
				cus = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8));
			}

		} catch (SQLException e) {
			System.out.println("ps오류 " + e.getMessage());
		} finally {
			try {
				rs.close();
				ps.close();
				MySQLConnectionUtil.close(conn);
			} catch (SQLException e) {
				e.getMessage();
			}
		} // end finally

		return cus;
	}

	public List<Customer> selectAll() {
		List<Customer> list = new ArrayList<Customer>();

		Connection conn = MySQLConnectionUtil.connect();
		String sql = "select * from customer";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				MySQLConnectionUtil.close(conn);
			} catch (SQLException e) {
				e.getMessage();
			}
		} // end finally

		return list;
	} // end select

	public void insert(Customer cus) {
		Connection conn = MySQLConnectionUtil.connect();
		String sql = "insert into customer(name, password, email, address, gender, age, hobby)"
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			// ?에 들어갈 값의 바인딩
			ps.setString(1, cus.getName());
			ps.setString(2, cus.getPassword());
			ps.setString(3, cus.getEmail());
			ps.setString(4, cus.getAddress());
			ps.setString(5, cus.getGender());
			ps.setInt(6, cus.getAge());
			ps.setString(7, cus.getHobby());

			ps.execute(); // 실행
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				MySQLConnectionUtil.close(conn);
			} catch (SQLException e) {
				System.out.println("close 오류 : " + e.getMessage());
			}
		} // finally end
	}
	
	public void delete(Customer cus) {
		Connection conn = MySQLConnectionUtil.connect();
		String sql = "delete from customer where idx = ?";
		PreparedStatement ps = null;
		try {
			 ps = conn.prepareStatement(sql);
			 ps.setInt(1, cus.getIdx());
			 ps.execute();
			 
			 conn.commit();
		} catch (SQLException e) {
			System.out.println("sql 오류 " + e.getMessage());
		} finally {
			try {
				ps.close();
				MySQLConnectionUtil.close(conn);
			} catch (SQLException e) {
				System.out.println("close 오류 " + e.getMessage());
			}
		}
	}
}
