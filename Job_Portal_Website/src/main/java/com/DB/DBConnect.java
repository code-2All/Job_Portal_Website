package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;
	// Always call THis getConn class
	public static Connection getConn()
	{
		try {
			if(conn==null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root", "Ar1122@mysql");
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return conn;
	}
	

}
