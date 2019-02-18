package com.cognizant;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;




public class JdbcDemo {
	
	public static void main(String[] args) throws Exception {
		
		// Loading and Registering Driver - Step 1
		
		Class.forName("com.mysql.jdbc.Driver");
		
		System.out.println("Enter the Schema");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String schema = br.readLine();
		
		// Establishing Connection - Step 2
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+schema, "root", "root");
		
		// Executing Queries
		
		Statement stmt = con.createStatement();
		//stmt.executeUpdate("INSERT INTO user VALUES(22, 'akhi', 'akhil@yahoo.com')");
		System.out.println("Enter the Database Name");
		String db = br.readLine();
		
		ResultSet rs =  stmt.executeQuery("SELECT * FROM "+db);
		
		ResultSetMetaData rsmd = rs.getMetaData();
		
		int no = rsmd.getColumnCount();
		
		// Processing the result set
		
		for(int iter = 1; iter <= no; iter++) {
		
			System.out.print(rsmd.getColumnName(iter)+" ");
		}
		
		System.out.print("\n");
		
		while(rs.next()) {
			
			for(int iter = 1; iter <= no; iter++) {
				System.out.print(rs.getString(iter)+" ");
			}
			System.out.printf("\n");
			//System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
		}
		
		//Close the resources
		
		rs.close();
		stmt.close();
		con.close();
		
		
	}

}
