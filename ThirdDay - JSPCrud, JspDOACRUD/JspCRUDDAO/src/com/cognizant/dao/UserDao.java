package com.cognizant.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.UserBean;

public class UserDao {
	
	
	public static Connection Connect() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/akhil";
		con = DriverManager.getConnection(url, "root", "root");
		return con;
	}
	
	
	public int insert(UserBean user) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		String insertQuery = "INSERT INTO users VALUES(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(insertQuery);
		pstmt.setInt(1, user.getUserId());
		pstmt.setString(2, user.getUserName());
		pstmt.setString(3, user.getEmail());
		pstmt.setBigDecimal(4, BigDecimal.valueOf(user.getMobile()));
		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();
		return insertStatus;
	}
	
	
	
	public int delete(int userId) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		String deleteQuery = "DELETE FROM users WHERE user_id="+userId;
		int deleteStatus = 0;
		Statement stmt = con.createStatement();
		deleteStatus = stmt.executeUpdate(deleteQuery);
		return deleteStatus;
	}
	
	public int update(UserBean user) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		String updateQuery = "UPDATE users SET user_name=?, email=?, mobile=? WHERE emp_id=?";
		PreparedStatement pstmt = con.prepareStatement(updateQuery);
		pstmt.setInt(4, user.getUserId());
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getEmail());
		pstmt.setBigDecimal(3, BigDecimal.valueOf(user.getMobile()));
		int updateStatus = 0;
		updateStatus = pstmt.executeUpdate();
		return updateStatus;
	}
	
	public UserBean read(int userId) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		String readQuery = "SELECT * FROM users WHERE user_id="+userId;

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		UserBean user = new UserBean();
		
		if(rs.next()) {
			user.setUserId(rs.getInt(1));
			user.setUserName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setMobile(rs.getLong(4));
		}
		
		
		
		return user;
	}
	
	
	public List<UserBean> readAll() throws ClassNotFoundException, SQLException {
		List<UserBean> userList = new ArrayList<UserBean>();
		Connection con = Connect();
		String readQuery = "SELECT * FROM users";

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		
		if(rs.next()) {
			UserBean user = new UserBean();
			user.setUserId(rs.getInt(1));
			user.setUserName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setMobile(rs.getLong(4));
			userList.add(user);
		}
		
		return userList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
