package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;


public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn)
	{
		super();
		this.conn = conn;
	}
	
	
	public boolean addUser(user u)
	{
		boolean f = false;
		{
			try {
				
				
				String sql = "insert into userrr(name,qualification,email,password,role) values(?,?,?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1,u.getName());
				ps.setString(2,u.getQualification());
				ps.setString(3,u.getEmail());
				ps.setString(4,u.getPassword());
				ps.setString(5,"user");
				
				
				int i = ps.executeUpdate();
				if(i==1)
				{
					f = true;
				}
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
				
			}
			return f;
		}
	}
		public user login(String email, String password)
		{
			user i = null;
			try {
				
				String sql = "select * from userrr email=? and password=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				
				ps.setString(1,email);
				ps.setString(2,password);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					
					i = new user();
					i.setId(rs.getInt(1));
					i.setName(rs.getString(2));
					i.setQualification(rs.getString(3));
					i.setEmail(rs.getString(4));
					i.setPassword(rs.getString(5));
					i.setRole(rs.getString(6));
				}				
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return i;
			
		}
	}
